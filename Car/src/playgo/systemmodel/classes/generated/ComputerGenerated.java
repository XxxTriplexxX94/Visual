
package playgo.systemmodel.classes.generated;

import il.ac.wis.cs.systemmodel.SMBaseClass;
import il.ac.wis.cs.systemmodel.SystemModelGen;


/**
 * This file was automatically generated using PlayGo system-model.
 * This class shouldn't be changed. Any change to this class will be overridden!!!
 * 
 */
public class ComputerGenerated
    extends SMBaseClass
{

    protected String state = ("");

    public ComputerGenerated(java.lang.String name) {
        super(name);
    }

    @SystemModelGen
    public String getName() {
        return name;
    }

    @SystemModelGen
    public String getState() {
        return state;
    }

    @SystemModelGen
    public void setState(String arg0) {
        this.state=arg0;
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> setState(String) : void");
        }
        //GUI handling
        playgo.systemmodel.SystemModelMain.getInstance().getPlayable().
        	setPropertyValue("Computer", name, "state", arg0);
         
        playgo.systemmodel.SystemModelAgent.getInstance().setPropertyValue("Computer", name, "state", arg0);
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	setPropertyValue("Computer", name, "state", "String", String.valueOf(arg0));

    }

    @SystemModelGen
    public void pgInitState(String arg0) {
        this.state=arg0;
         
        playgo.systemmodel.SystemModelAgent.getInstance().setPropertyValue("Computer", name, "state", arg0);
    }

    @SystemModelGen
    public void Parking() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> Parking() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Computer", name, "Parking");

        return;
    }

    @SystemModelGen
    public void LookForPark() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> LookForPark() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Computer", name, "LookForPark");

        return;
    }

}
