# Togikai Sample Program

[**Autonomous Minicar Battle**](https://github.com/autonomous-minicar-battle)
| [**Slides - Google Drive**](https://drive.google.com/drive/folders/17YLekXMTtOAwoKE8AF5WkMViXlS2xn-3)

## Main Program

| File name        | Description |
|------------------|-------------|
| run.py           | 走行時のループ処理をするメインプログラム |
| config.py        | パラメータ用プログラム |
| ultrasonic.py    | 超音波測定用プログラム |
| planner.py       | 走行ロジック用プログラム |
| motor.py         | 操舵・モーター出力/調整用プログラム |
| train_pytorch.py | 機械学習用プログラム |

## run.py

```mermaid
flowchart TB

  step1["Initialization"]
  step2["Import external packages"]
  step3["Import necessary modules"]
  step4["Initialize motor"]
  step5["Initialize ultrasonic sensor"]
  step6["Initialize planner"]
  step7["Load Neural Network model"]
  step8["Initialize IMU"]
  step9["Initialize joystick controller"]
  step10["Set the PWM duty for motor"]

  step1_drv["Measure the distance to objects"]
  step2_drv["Planning"]
  step3_drv["Operation"]
  step4_drv["Set motor output duty cycle"]
  step5_drv["Record logs"]
  step6_drv["Display all status"]
  step7_drv["Backward/Stop operation"]

  step1_end["Stop motor output"]
  step2_end["Cleanup GPIO"]
  step3_end["Save log"]

  subgraph Initialization
    step1 --> step2 --> step3 --> step4 --> step5 --> step6 --> step7 --> step8 --> step9 --> step10
  end

  step10 --> step1_drv

  subgraph Driving
    step1_drv --> step2_drv --> step3_drv --> step4_drv --> step5_drv --> step6_drv --> step7_drv -->|Loop| step1_drv
  end

  step7_drv --> step1_end

  subgraph End processing
    step1_end --> step2_end --> step3_end
  end
```
