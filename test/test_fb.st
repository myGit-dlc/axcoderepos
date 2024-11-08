USING Siemens.DemoMachine;
USING Siemens.DemoMachine.ConveyorUnit;
using  AxUnit;
NAMESPACE ConveyorTestFB

    {Test(start:=true)}
    FUNCTION PUBLIC TestConveyorMotorFB

        
        VAR_EXTERNAL
            //conveyor : ConveyorMotor;
            instConveyorMotor : ConveyorMotor;
                                                                                                                                                                                                                                                            //conveyor:Conveyor;
                                                                                                                                                                                                                                                        END_VAR

                                                                                                                                                                                                                                                        VAR_INPUT
                                                                                                                                                                                                                                                            start:bool;
                                                                                                                                                                                                                                                    
        END_VAR
        VAR_TEMP
            res:bool;
        END_VAR

            instConveyorMotor(startStop:=start,outRun=>res);
            Assert.Equal(res,TRUE);

    END_FUNCTION
    {Test(start:=true,speed:=REAL#10.0)}
    FUNCTION PUBLIC TestConveyorDriveFB
        VAR_EXTERNAL
            instConveyorDrive : ConveyorDrive;
        END_VAR

        VAR_INPUT
            start:bool;
            speed:REAL;
        END_VAR
        VAR_TEMP
            run:bool;
            oSpeed:REAL;

        END_VAR

            instConveyorDrive(startStop:=start,speedSetpoint:=speed,outRun=>run,outSpeed=>oSpeed);
            Assert.Equal(run,FALSE);
            Assert.Equal(oSpeed,REAL#20.0);

    END_FUNCTION
END_NAMESPACE