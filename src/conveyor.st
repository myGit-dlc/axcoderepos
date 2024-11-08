// using nmTankControl;
NAMESPACE Siemens.DemoMachine

    CLASS PUBLIC cConveyor
        VAR PUBLIC
            motor: IMotor;
            startSop: REF_TO BOOL;
        END_VAR

        VAR PRIVATE
bb: BOOL ;
        END_VAR

        METHOD PUBLIC ConveyorControl

           IF startSop^ THEN
                motor.Run();
           ELSE
                motor.Stop();
            END_IF;
        END_METHOD
    END_CLASS

    INTERFACE IMotor
        METHOD Stop END_METHOD
        METHOD Run END_METHOD
    END_INTERFACE
    CLASS cMotor IMPLEMENTS IMotor
        VAR PUBLIC
            outRun: REF_TO BOOL;
        END_VAR
        METHOD PUBLIC Run
            outRun^ := TRUE;
        END_METHOD
        METHOD PUBLIC Stop
            outRun^ := FALSE;
        END_METHOD
        // METHOD PUBLIC MotorControl

        // END_METHOD
    END_CLASS
    CLASS cDriveMotor IMPLEMENTS IMotor
        VAR PUBLIC
            outSpeed: REF_TO REAL;
            outRun: REF_TO BOOL;
        END_VAR
        METHOD PUBLIC SetSpeed
            VAR_INPUT
                inSpeed: REAL;

            END_VAR

            IF inSpeed > 0.0 AND inSpeed < 60.0 THEN
                outSpeed^ := inSpeed;
            END_IF;
        END_METHOD
        METHOD PUBLIC Run
            outRun^ := TRUE;
        END_METHOD
        METHOD PUBLIC Stop
            outRun^ := FALSE;
        END_METHOD

    END_CLASS




END_NAMESPACE

