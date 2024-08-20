# Design Patterns

デザインパターンを活用して、自動運転ラジコンカーのプログラムを再利用性や拡張性に優れた形で設計・実装する方法について解説します。ここでは、いくつかの主要なデザインパターンを組み合わせて、システム全体の設計を行います。

## Summary

使用するデザインパターン

- Strategy パターン - 異なるアルゴリズムを動的に切り替える。
- Observer パターン - センサーやカメラなどのデータ変化を監視し、制御をリアルタイムで更新。
- Singleton パターン - システム全体で共通の設定や状態を管理。
- Factory Method パターン - インスタンス生成をサブクラスに委譲。
- Command パターン - ユーザーのコマンドをカプセル化し、再利用可能にする。
- Facade パターン - システムの複雑なサブシステムへのアクセスを単純化。
- Template Method パターン - アルゴリズムの骨格を定義し、サブクラスで詳細を実装。
- State パターン - 状態に応じて異なる振る舞いを実行。

### Strategy Pattern

まず、異なる制御アルゴリズム（例えば、障害物回避、直進、スラロームなど）を実装し、それらを動的に切り替えられるようにします。

```python
from abc import ABC, abstractmethod

# Strategy インターフェース
class DrivingStrategy(ABC):
    @abstractmethod
    def execute(self, sensor_data):
        pass

# 直進戦略
class StraightStrategy(DrivingStrategy):
    def execute(self, sensor_data):
        print("直進中")
        # 直進のロジックを実装

# 障害物回避戦略
class AvoidObstacleStrategy(DrivingStrategy):
    def execute(self, sensor_data):
        print("障害物を回避")
        # 障害物回避のロジックを実装

# スラローム戦略
class SlalomStrategy(DrivingStrategy):
    def execute(self, sensor_data):
        print("スラローム中")
        # スラロームのロジックを実装

# コンテキストクラス
class DrivingContext:
    def __init__(self, strategy: DrivingStrategy):
        self._strategy = strategy

    def set_strategy(self, strategy: DrivingStrategy):
        self._strategy = strategy

    def execute_strategy(self, sensor_data):
        self._strategy.execute(sensor_data)
```

### Observer Pattern

センサーやカメラデータの変更に応じて、車両制御をリアルタイムで更新します。

```python
class SensorData:
    def __init__(self):
        self._observers = []

    def add_observer(self, observer):
        self._observers.append(observer)

    def notify_observers(self):
        for observer in self._observers:
            observer.update(self)

    def set_data(self, data):
        self._data = data
        self.notify_observers()

    def get_data(self):
        return self._data

class VehicleController:
    def update(self, sensor_data):
        print("センサーデータ更新:", sensor_data.get_data())
        # データに基づいて制御を更新

```

### Singleton Pattern

設定や車両の状態を一元管理するためにSingletonを使用します。

```python
class ConfigurationManager:
    _instance = None

    @staticmethod
    def get_instance():
        if ConfigurationManager._instance is None:
            ConfigurationManager._instance = ConfigurationManager()
        return ConfigurationManager._instance

    def __init__(self):
        if ConfigurationManager._instance is not None:
            raise Exception("Singletonクラス")
        self._settings = {}

    def set_setting(self, key, value):
        self._settings[key] = value

    def get_setting(self, key):
        return self._settings.get(key)
```

### Factory Method Pattern

センサーやカメラのインスタンス生成をサブクラスに委譲します。

```python
from abc import ABC, abstractmethod

class Sensor(ABC):
    @abstractmethod
    def read_data(self):
        pass

class UltrasonicSensor(Sensor):
    def read_data(self):
        # 超音波センサーのデータ取得
        return "Ultrasonic Data"

class CameraSensor(Sensor):
    def read_data(self):
        # カメラのデータ取得
        return "Camera Data"

class SensorFactory(ABC):
    @abstractmethod
    def create_sensor(self):
        pass

class UltrasonicSensorFactory(SensorFactory):
    def create_sensor(self):
        return UltrasonicSensor()

class CameraSensorFactory(SensorFactory):
    def create_sensor(self):
        return CameraSensor()
```

### Command Pattern

ユーザーからのコマンド（例えば、スタート、ストップ、方向転換）をカプセル化し、再利用可能にします。

```python
class Command(ABC):
    @abstractmethod
    def execute(self):
        pass

class StartCommand(Command):
    def __init__(self, vehicle):
        self._vehicle = vehicle

    def execute(self):
        self._vehicle.start()

class StopCommand(Command):
    def __init__(self, vehicle):
        self._vehicle = vehicle

    def execute(self):
        self._vehicle.stop()

class TurnLeftCommand(Command):
    def __init__(self, vehicle):
        self._vehicle = vehicle

    def execute(self):
        self._vehicle.turn_left()

```

### Facade Pattern

複雑なセンサーやカメラの初期化・操作を単純化するために、Facadeを提供します。

```python
class VehicleFacade:
    def __init__(self):
        self._ultrasonic_sensor = UltrasonicSensor()
        self._camera_sensor = CameraSensor()

    def initialize_sensors(self):
        print("センサーを初期化中...")
        # 初期化処理

    def get_ultrasonic_data(self):
        return self._ultrasonic_sensor.read_data()

    def get_camera_data(self):
        return self._camera_sensor.read_data()
```

### Template Method Pattern

進行方向決定のアルゴリズムの骨格を定義し、サブクラスで詳細を実装します。

```python
class DirectionDecider(ABC):
    def decide_direction(self, sensor_data):
        self.preprocess(sensor_data)
        direction = self.compute_direction(sensor_data)
        self.postprocess(sensor_data)
        return direction

    @abstractmethod
    def preprocess(self, sensor_data):
        pass

    @abstractmethod
    def compute_direction(self, sensor_data):
        pass

    @abstractmethod
    def postprocess(self, sensor_data):
        pass

class BasicDirectionDecider(DirectionDecider):
    def preprocess(self, sensor_data):
        print("データを前処理中")

    def compute_direction(self, sensor_data):
        print("方向を計算中")
        return "forward"

    def postprocess(self, sensor_data):
        print("後処理中")
```

### State Pattern

車両の状態に応じて、異なる動作を実行します（例えば、停止、進行、回避）。

```python
class VehicleState(ABC):
    @abstractmethod
    def handle(self, vehicle):
        pass

class StoppedState(VehicleState):
    def handle(self, vehicle):
        print("車両が停止状態")

class MovingState(VehicleState):
    def handle(self, vehicle):
        print("車両が進行状態")

class Vehicle:
    def __init__(self):
        self._state = StoppedState()

    def set_state(self, state: VehicleState):
        self._state = state

    def handle_state(self):
        self._state.handle(self)
```

## Conclusion

この設計では、デザインパターンを活用することで、以下のような利点が得られます。

- 再利用性: 各機能が独立して実装されており、他のプロジェクトやシステムでも容易に再利用可能です。
- 拡張性: 新しい戦略や機能を追加する場合も、既存のコードを変更することなく追加できます。
- メンテナンス性: 各クラスが責務を明確に持っており、メンテナンスが容易です。
- 柔軟性: 実行時に戦略や状態を変更することで、異なるシナリオに対応できます。

このように、デザインパターンを活用することで、Raspberry Pi上で効率的かつ柔軟な自動運転ラジコンカーのプログラムを実装できます。
