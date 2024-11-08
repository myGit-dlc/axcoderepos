NAMESPACE Siemens.DemoMachine.ConveyorUnit
FUNCTION_BLOCK PUBLIC ConveyorMotor
    VAR_INPUT
        startStop: BOOL;
    END_VAR
    VAR_OUTPUT
        outRun: BOOL;

    END_VAR
    VAR
        conveyor: cConveyor;
        motor: cMotor;

    END_VAR
        conveyor.startSop := REF(startStop);
        motor.outRun := REF(outRun);
        conveyor.motor := motor;
        conveyor.ConveyorControl();

END_FUNCTION_BLOCK

FUNCTION_BLOCK PUBLIC ConveyorDrive
    VAR_INPUT
        startStop: BOOL;
        speedSetpoint: REAL;
    END_VAR
    VAR_OUTPUT
        outRun: BOOL;
        outSpeed: REAL;
    END_VAR
    VAR
        conveyor: cConveyor;
        motor: cDriveMotor;
    END_VAR
    VAR_TEMP
        myrefbool: REF_TO BOOL;
    END_VAR
    // Run/Stop control
        conveyor.motor := motor;
        conveyor.startSop := REF(startStop);
        motor.outRun := REF(outRun);
        conveyor.ConveyorControl();
     // set drive speed
        motor.outSpeed := REF(outSpeed);
        motor.SetSpeed(speedSetpoint);

    ;
    //

END_FUNCTION_BLOCK






FUNCTION MyTestFC
    // VAR_IN_OUT
    // inout1:bool;
    // END_VAR
     VAR_INPUT
        in1: BOOL;
    END_VAR
    VAR_TEMP
        // myrefbool:REF_TO BOOL;
        tmpBool: BOOL;



        END_VAR


    // myrefbool^:=in1;
    tmpBool := in1;
END_FUNCTION

TYPE
    Colors: (RED, GREEN, BLUE);
END_TYPE

END_NAMESPACE