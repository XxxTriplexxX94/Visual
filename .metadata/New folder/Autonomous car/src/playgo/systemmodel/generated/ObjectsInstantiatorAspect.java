
package playgo.systemmodel.generated;

import il.ac.wis.cs.playgo.playtoolkit.AppObjects;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import playgo.systemmodel.classes.Car;
import playgo.systemmodel.classes.Computer;
import playgo.systemmodel.classes.GasPaddle;
import playgo.systemmodel.classes.Sensor;
import playgo.systemmodel.classes.Wheel;


/**
 * This file was automatically generated using PlayGo system-model.
 * This class shouldn't be changed. Any change to this class will be overridden!!!
 * 
 */
@Aspect
public class ObjectsInstantiatorAspect {

    private boolean smFirstTime = true;
    private boolean appFirstTime = true;

    @Pointcut("execution(il.ac.wis.cs.playgo.playtoolkit.api.impl.java.GuiJAgent.new(..)) ")
    void systemModelMainInit() {
    }

    @After("systemModelMainInit()")
    public void smInit(JoinPoint thisJoinPoint)
        throws Throwable
    {
        if (smFirstTime) {
        	smFirstTime = false;
        	playgo.systemmodel.SystemModelMain.getInstance();
        }
    }

    @Pointcut("execution(void playgo.systemmodel.SystemModelMain.createSMObjects())")
    void createAppObjects() {
    }

    @After("createAppObjects()")
    public void creObjects(JoinPoint thisJoinPoint)
        throws Throwable
    {
        if (appFirstTime) {
        	appFirstTime = false;
        	instantiateExecutionBridges();
        	createSystemModelObjects();
        }
    }

    private void createSystemModelObjects() {
        try {
            AppObjects.addObject(playgo.systemmodel.classes.Clock.getInstance());
            Object object = null;
            object = new Car("car");
            AppObjects.addObject(object);
            object = new Computer("computer");
            AppObjects.addObject(object);
            object = new GasPaddle("GasPaddle");
            AppObjects.addObject(object);
            object = new Wheel("wheel");
            AppObjects.addObject(object);
            object = new Sensor("sensor");
            AppObjects.addObject(object);
            object = new playgo.systemmodel.classes.Env("Env");
            AppObjects.addObject(object);
            object = new playgo.systemmodel.classes.Env("User");
            AppObjects.addObject(object);
        } catch (Exception _x) {
            _x.printStackTrace();
        }
    }

    public void instantiateExecutionBridges() {
    }

}
