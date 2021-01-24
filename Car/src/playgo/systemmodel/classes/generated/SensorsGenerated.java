
package playgo.systemmodel.classes.generated;

import il.ac.wis.cs.systemmodel.SMBaseClass;
import il.ac.wis.cs.systemmodel.SystemModelGen;


/**
 * This file was automatically generated using PlayGo system-model.
 * This class shouldn't be changed. Any change to this class will be overridden!!!
 * 
 */
public class SensorsGenerated
    extends SMBaseClass
{

    protected boolean Status = (True);

    public SensorsGenerated(java.lang.String name) {
        super(name);
    }

    @SystemModelGen
    public String getName() {
        return name;
    }

    @SystemModelGen
    public boolean isStatus() {
        return Status;
    }

    @SystemModelGen
    public boolean getStatus() {
        return Status;
    }

    @SystemModelGen
    public void setStatus(boolean arg0) {
        this.Status=arg0;
        if(java.lang.System.getProperty("SYSTEM_MODEL_DEBUG")!=null){
        	java.lang.System.out.println(">>> method call: >>> setStatus(boolean) : void");
        }
        //GUI handling
        playgo.systemmodel.SystemModelMain.getInstance().getPlayable().
        	setPropertyValue("Sensors", name, "Status", String.valueOf(arg0));
         
        playgo.systemmodel.SystemModelAgent.getInstance().setPropertyValue("Sensors", name, "Status", String.valueOf(arg0));
        
		//ExecutionBridge handling
        playgo.systemmodel.SystemModelMain.getInstance().
        	setPropertyValue("Sensors", name, "Status", "boolean", String.valueOf(arg0));

    }

    @SystemModelGen
    public void pgInitStatus(boolean arg0) {
        this.Status=arg0;
         
        playgo.systemmodel.SystemModelAgent.getInstance().setPropertyValue("Sensors", name, "Status", String.valueOf(arg0));
    }

}
