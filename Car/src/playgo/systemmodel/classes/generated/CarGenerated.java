
package playgo.systemmodel.classes.generated;

import il.ac.wis.cs.systemmodel.SMBaseClass;
import il.ac.wis.cs.systemmodel.SystemModelGen;


/**
 * This file was automatically generated using PlayGo system-model.
 * This class shouldn't be changed. Any change to this class will be overridden!!!
 * 
 */
public class CarGenerated
    extends SMBaseClass
{

    protected String Status = ("UnDamged");

    public CarGenerated(java.lang.String name) {
        super(name);
    }

    @SystemModelGen
    public String getName() {
        return name;
    }

    @SystemModelGen
    public void Enters() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> Enters() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Car", name, "Enters");

        return;
    }

    @SystemModelGen
    public void TurnOn() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> TurnOn() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Car", name, "TurnOn");

        return;
    }

    @SystemModelGen
    public void enter() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> enter() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Car", name, "enter");

        return;
    }

    @SystemModelGen
    public String getStatus() {
        return Status;
    }

    @SystemModelGen
    public void setStatus(String arg0) {
        this.Status=arg0;
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> setStatus(String) : void");
        }
        //GUI handling
        playgo.systemmodel.SystemModelMain.getInstance().getPlayable().
        	setPropertyValue("Car", name, "Status", arg0);
         
        playgo.systemmodel.SystemModelAgent.getInstance().setPropertyValue("Car", name, "Status", arg0);
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	setPropertyValue("Car", name, "Status", "String", String.valueOf(arg0));

    }

    @SystemModelGen
    public void pgInitStatus(String arg0) {
        this.Status=arg0;
         
        playgo.systemmodel.SystemModelAgent.getInstance().setPropertyValue("Car", name, "Status", arg0);
    }

    @SystemModelGen
    public void Call(string arg0, string arg1) {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> Call(string,string) : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Car", name, "Call");

        return;
    }

    @SystemModelGen
    public void Call(string arg0) {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> Call(string) : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Car", name, "Call");

        return;
    }

    @SystemModelGen
    public void LookForPark() {
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> LookForPark() : void");
        }
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	activateMethod("Car", name, "LookForPark");

        return;
    }

}
