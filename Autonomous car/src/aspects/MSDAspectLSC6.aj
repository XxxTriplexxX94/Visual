//  The file MSDAspectLSC6.aj was automatically generated using S2A 2.0.0.201512210921.
//  For information see http://www.wisdom.weizmann.ac.il/~maozs/s2a/

package aspects;

import playgo.systemmodel.classes.*;
import playgo.systemmodel.types.*;
import java.util.ArrayList;
import il.ac.wis.cs.s2a.runtime.lib.*;
import il.ac.wis.cs.playgo.playtoolkit.*;


public aspect MSDAspectLSC6 extends MSDAspect
{


	//Constants for instances, locations and variables
	static final int Sensor_INST_sensor = 0;
	static final int Car_INST_car = 1;

	static final int String_arg_String_exact_String_arg10 = 0;


	private final String niceName = "LSC6";

	MSDAspectLSC6()
	{
		addMinimalEvent(MSDMethods.Sensor_Sensor_damage);
		setHotCut(2,1);
		setLastCut(2,2);
		numberOfLifeLines = 2;
		numberOfInstances = 2;
		numberOfVariables = 1;
		interactionId = "1611514501496";
		setCutsExpressions();
	}

	//Pointcuts and advices:
	pointcut setCut() : execution(* *.setCut(..));

	after():setCut()
	{
		ArrayList<ActiveMSDAspect> tempActiveArr = new ArrayList<ActiveMSDAspect>();
		tempActiveArr.addAll(getActiveMSDArray());

		for(ActiveMSDAspect liveCopy:tempActiveArr){
			evaluateWaitConditions(liveCopy);	//re-evaluate wait conditions
		}
	}

	//re-evaluate dynamic-universal binding expressions
	pointcut changeActiveMSDCutState() : execution(* *.changeActiveMSDCutState(..));

	after():changeActiveMSDCutState()
	{
		ArrayList<ActiveMSDAspect> tempActiveArr = new ArrayList<ActiveMSDAspect>();
		tempActiveArr.addAll(getActiveMSDArray());

		for(ActiveMSDAspect liveCopy:tempActiveArr){
			if(unboundObjectExists(liveCopy))
			{
				doBindings(liveCopy);				//try to bind objects
				if( ! unboundObjectExists(liveCopy)){
					setUpToDate(false);
				}
			}
		}
		setUpToDate(false);
	}

	private boolean unboundObjectExists(ActiveMSDAspect activeMSD)
	{
	
			return false;
	}

	//this pointcut definition is identical to pointcut Clock_Clock_tick, aspectj does not allow
	//declaring on identical pointcuts, therefore this pointcut must be defined within the method
	after(Object clock):execution(void tick(..))
		&& if(clock instanceof Clock)
		&& target(clock)
	{
		boolean coordinated = false;

		ArrayList<ActiveMSDAspect> tempActiveArr = new ArrayList<ActiveMSDAspect>();
		tempActiveArr.addAll(getActiveMSDArray());

		for(ActiveMSDAspect liveCopy:tempActiveArr){
			evaluateWaitConditions(liveCopy);	//re-evaluate wait conditions
			coordinated = true;
		}

		if (!coordinated) {
			MSDCoordinatorAspect.getInstance().coordinate(null);
		}
	}

	pointcut Car_Car_call(Car _carSource, Object _car,String String_exact_String_arg10):
		call(* call(..))
		&& if(_car instanceof Car)
		&& if(_carSource instanceof Car)
		&& target(_car) && this(_carSource)  && args(String_exact_String_arg10);

	after(Car _carSource,Object _car,String String_exact_String_arg10):Car_Car_call(_carSource,_car, String_exact_String_arg10)
	{
		ArrayList<Object> args = getArgsList(String_exact_String_arg10);
		changeCutState(MSDMethods.Car_Car_call,
					_car,_car,args);
	}

	pointcut Sensor_Sensor_damage(Sensor _sensorSource, Object _sensor):
		call(* damage(..))
		&& if(_sensor instanceof Sensor)
		&& if(_sensorSource instanceof Sensor)
		&& target(_sensor) && this(_sensorSource) ;

	after(Sensor _sensorSource,Object _sensor):Sensor_Sensor_damage(_sensorSource,_sensor)
	{
		changeCutState(MSDMethods.Sensor_Sensor_damage,
					_sensor,_sensor,null);
	}

	protected void  setPrivateVariables(int MSDm, Object sourceObject, Object targetObject,ActiveMSDAspect activeMSD,
		ArrayList args)
	{
		switch (MSDm)
		{
		}
	}

	// MSD Logic:
	protected void  changeActiveMSDCutState(int MSDm, Object sourceObject, Object targetObject,ActiveMSDAspect activeMSD,
		ArrayList args)
	{

		boolean unification=false;
		switch (MSDm)
		{
			case MSDMethods.Car_Car_call:
				if(activeMSD.instancesEquals(Car_INST_car,sourceObject)
					&& activeMSD.instancesEquals(Car_INST_car,targetObject)
					&& activeMSD.variableEquals(String_arg_String_exact_String_arg10,args.get(0)))
				{
					unification=true;
					if(activeMSD.isInCut(2,1))
					{
						activeMSD.setCut(2,2);
						break;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			case MSDMethods.Sensor_Sensor_damage:
				if(activeMSD.instancesEquals(Sensor_INST_sensor,sourceObject)
					&& activeMSD.instancesEquals(Sensor_INST_sensor,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,0))
					{
						activeMSD.setCut(1,0);
						if(evaluateCondition(2,activeMSD))
						{
							activeMSD.setCut(2,1);
							return;
						}
						break;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			}
		if(activeMSD.checkViolation())
			activeMSD.completion();
	}

	@SuppressWarnings("unused")
	private boolean evaluateCondition(int conditionNumber,ActiveMSDAspect activeMSD)
	{
		Sensor sensor = (Sensor)bindObjectByExpression(activeMSD,Sensor_INST_sensor,null, true);;
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car,null, true);;

		String arg10 = null;
		if(activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10)!=null){
			arg10 = (String) activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10);
		}

		switch (conditionNumber)
		{
			case 2: 
				return true;
		}
		return false;
	}


	protected void setCutsExpressions()
	{
		this.setExpressionForCut("2,1" , "SYNC0");

	}


	@SuppressWarnings("unused")
	protected void doBindings(ActiveMSDAspect activeMSD)
	{
		activeMSD.setLineInstance(Sensor_INST_sensor,AppObjects.getObject("sensor","Sensor"));
		activeMSD.setLineInstance(Car_INST_car,AppObjects.getObject("car","Car"));
		Sensor sensor = (Sensor)bindObjectByExpression(activeMSD,Sensor_INST_sensor, null, false );
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car, null, false );

		String arg10 = null;
		if(activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10)!=null){
			arg10 = (String) activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10);
		}

		try{
			activeMSD.setPrivateVariable(String_arg_String_exact_String_arg10, (String)"TowTruck");
		}catch(Exception e){}
	}


	protected void  evaluateWaitConditions(ActiveMSDAspect activeMSD)
	{
		for(Integer cond:activeMSD.getWaitingConditions()){
			switch(cond)
			{
			}
		}
	}

	protected void getActiveMSDCutState(MSDMethodSet ME,MSDMethodSet EE,
			MSDMethodSet CV,MSDMethodSet HV,ActiveMSDAspect activeMSD)
	{
		Sensor sensor = (Sensor)bindObjectByExpression(activeMSD,Sensor_INST_sensor,null, true);;
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car,null, true);;

		String VAR_String_exact_String_arg10 = null;
		if(activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10)!=null){
			VAR_String_exact_String_arg10 = (String) activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10);
		}

		ArrayList<Object>  args19 = getArgsList(VAR_String_exact_String_arg10);
		MSDMethod MSDm19 = new MSDMethod(car,car,
			MSDMethods.Car_Car_call,args19,"Car:Car:call",niceName,activeMSD.getId());// call() Execute
		MSDMethod MSDm20 = new MSDMethod(sensor,sensor,
			MSDMethods.Sensor_Sensor_damage,null,"Sensor:Sensor:damage",niceName,activeMSD.getId());// damage() Monitored

		 if(activeMSD.isInCut(0,0))
		{
				ME.add(MSDm20);
				CV.add(MSDm19);
				return;
		}
		 if(activeMSD.isInCut(2,1))
		{
				if(MSDm19.sourceInstance!=null && MSDm19.targetInstance!=null){
					EE.add(MSDm19);
				}
				HV.add(MSDm20);
				return;
		}
	}
	
	@SuppressWarnings("unused")
	public Object bindObjectByExpression (ActiveMSDAspect activeMSD,int lifelineIndex, 
			Object obj, boolean retrieveOnly){

		String arg10 = null;
		if(activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10)!=null){
			arg10 = (String) activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10);
		}

		Object result = null;
		// in case the object is already bounded returning the bounded object
		result = activeMSD.getLineInstance(lifelineIndex);
		if (result == null){
			Sensor sensor = (Sensor) activeMSD.getLineInstance(Sensor_INST_sensor);
			Car car = (Car) activeMSD.getLineInstance(Car_INST_car);
			switch (lifelineIndex){
			}
		}
		return result;
	}
	
	
	public boolean validateBoundedObject(ActiveMSDAspect activeMSD, int lifelineIndex, Object object){
		boolean result = false;
		try{
			Object bounded = bindObjectByExpression(activeMSD, lifelineIndex, object, true);
			if (bounded != null){
				result = bounded.equals(object);
			}else if (object == null){
				result = true;
			}
		}catch(NullPointerException npe){
			result = false; // parent object not bounded yet
		}
		return result;
	}
	
}
