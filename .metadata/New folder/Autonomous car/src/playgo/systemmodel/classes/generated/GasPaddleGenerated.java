
package playgo.systemmodel.classes.generated;

import il.ac.wis.cs.systemmodel.SMBaseClass;
import il.ac.wis.cs.systemmodel.SystemModelGen;


/**
 * This file was automatically generated using PlayGo system-model.
 * This class shouldn't be changed. Any change to this class will be overridden!!!
 * 
 */
public class GasPaddleGenerated
    extends SMBaseClass
{


    public GasPaddleGenerated(java.lang.String name) {
        super(name);
    }

    @SystemModelGen
    public String getName() {
        return name;
    }

    @SystemModelGen
    public void press() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> press() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("GasPaddle", name, "press");

        return;
    }

}
