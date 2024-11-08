USING AxUnit;
USING Siemens.DemoMachine;

NAMESPACE ConveyorTestClass

    {TestFixture}
    CLASS ConveyorMotorTest

        VAR PROTECTED
            conveyor : cConveyor;
            motor:cMotor;
            out:BOOL;
            in:BOOL;

        END_VAR

        {Test(btnStartStop:=TRUE)}
        METHOD PUBLIC MyTestMethod
            VAR_INPUT
                btnStartStop:BOOL;
            END_VAR

            motor.outRun:=REF(out);
            in:=btnStartStop;
            conveyor.startSop:=REF(in);
            conveyor.motor:=motor;
            conveyor.ConveyorControl();

            Assert.Equal(actual := out, expected := TRUE);
        
        END_METHOD
    END_CLASS


    {TestFixture}
    CLASS ConveyorDriveTest

        VAR PROTECTED
            conveyor : cConveyor;
            motor:cDriveMotor;
            out:BOOL;
            in:BOOL;
            outSpeed:REAL;
        END_VAR

        {Test(btnStartStop:=TRUE,setSpeed:=REAL#70.0)}
        METHOD PUBLIC MyTestMethod
            VAR_INPUT
                btnStartStop:BOOL;
                setSpeed:REAL;
            END_VAR

            motor.outRun:=REF(out);
           
            motor.outSpeed:=REF(outSpeed);
            in:=btnStartStop;
            conveyor.startSop:=REF(in);
            conveyor.motor:=motor;
            //set speed
            motor.SetSpeed(setSpeed);
            motor.outSpeed:=REF(outSpeed);
            //run/stop control
            conveyor.ConveyorControl();


            //Assert.Equal(actual := out, expected := btnStartStop);
            Assert.Equal(actual :=outSpeed, expected := REAL#60.0);
        
        END_METHOD
    END_CLASS
END_NAMESPACE
