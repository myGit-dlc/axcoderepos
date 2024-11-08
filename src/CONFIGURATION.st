USING Siemens.DemoMachine.ConveyorUnit;
CONFIGURATION PLC_1
    TASK Main(Interval := T#100ms, Priority := 1);
    PROGRAM P1 WITH Main : MainProgram;
    VAR_GLOBAL
        instConveyorMotor:ConveyorMotor;
        instConveyorDrive:ConveyorDrive;
    END_VAR
END_CONFIGURATION

PROGRAM MainProgram
    VAR
        
    END_VAR
    ;//1st test
END_PROGRAM
