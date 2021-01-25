
package playgo.systemmodel.classes.generated;

import il.ac.wis.cs.systemmodel.SMBaseClass;
import il.ac.wis.cs.systemmodel.SystemModelGen;


/**
 * This file was automatically generated using PlayGo system-model.
 * This class shouldn't be changed. Any change to this class will be overridden!!!
 * 
 */
public class SensorGenerated
    extends SMBaseClass
{


    public SensorGenerated(java.lang.String name) {
        super(name);
    }

    @SystemModelGen
    public String getName() {
        return name;
    }

    @SystemModelGen
    public void work() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> work() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Sensor", name, "work");

        return;
    }

    @SystemModelGen
    public void damage() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> damage() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Sensor", name, "damage");

        return;
    }

}
