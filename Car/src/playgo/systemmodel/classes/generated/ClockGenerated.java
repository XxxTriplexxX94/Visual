
package playgo.systemmodel.classes.generated;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import il.ac.wis.cs.s2a.runtime.Utils;
import il.ac.wis.cs.systemmodel.SMBaseClass;
import il.ac.wis.cs.systemmodel.SystemModelGen;


/**
 * This file was automatically generated using PlayGo system-model.
 * This class shouldn't be changed. Any change to this class will be overridden!!!
 * 
 */
public class ClockGenerated
    extends SMBaseClass
{


    public ClockGenerated(java.lang.String name) {
        super(name);
        Properties properties = new Properties();
        java.lang.String runtimePropertiesPath = Utils.getRuntimePropertiesPath();
        try {
            properties.load(new java.io.FileInputStream(runtimePropertiesPath));
        } catch (FileNotFoundException _x) {
            _x.printStackTrace();
        } catch (IOException _x) {
            _x.printStackTrace();
        }
        tickInterval=1000;
        if ((properties.getProperty("clockTickInterval") !=null)) {
            tickInterval = Integer.parseInt(properties.getProperty("clockTickInterval"));
        }
        autoTick=true;
        if ((properties.getProperty("clockAutoTicks") !=null)) {
            autoTick= Boolean.parseBoolean(properties.getProperty("clockAutoTicks"));
        }
        startFromSysTime= Boolean.parseBoolean(properties.getProperty("clockStartFromSysTime"));
        timeFormat= properties.getProperty("stringTimeFormat");
    }

    @SystemModelGen
    public String getName() {
        return name;
    }

}
