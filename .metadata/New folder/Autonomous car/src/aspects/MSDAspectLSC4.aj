//  The file MSDAspectLSC4.aj was automatically generated using S2A 2.0.0.201512210921.
//  For information see http://www.wisdom.weizmann.ac.il/~maozs/s2a/

package aspects;

import playgo.systemmodel.classes.*;
import playgo.systemmodel.types.*;
import java.util.ArrayList;
import il.ac.wis.cs.s2a.runtime.lib.*;
import il.ac.wis.cs.playgo.playtoolkit.*;


public aspect MSDAspectLSC4 extends MSDAspect
{


	//Constants for instances, locations and variables
	static final int GasPaddle_INST_GasPaddle = 0;
	static final int Wheel_INST_wheel = 1;
	static final int Sensor_INST_sensor = 2;
	static final int Computer_INST_computer = 3;



	private final String niceName = "LSC4";

	MSDAspectLSC4()
	{
		addMinimalEvent(MSDMethods.GasPaddle_GasPaddle_press);
		addMinimalEvent(MSDMethods.Wheel_Wheel_move);
		addMinimalEvent(MSDMethods.Sensor_Sensor_work);
		setHotCut(2,2,2,1);
		setHotCut(3,3,3,3);
		setLastCut(3,3,4,3);
		numberOfLifeLines = 4;
		numberOfInstances = 4;
		numberOfVariables = 0;
		interactionId = "1611514608012";
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

	pointcut Wheel_Wheel_move(Wheel _wheelSource, Object _wheel):
		call(* move(..))
		&& if(_wheel instanceof Wheel)
		&& if(_wheelSource instanceof Wheel)
		&& target(_wheel) && this(_wheelSource) ;

	after(Wheel _wheelSource,Object _wheel):Wheel_Wheel_move(_wheelSource,_wheel)
	{
		changeCutState(MSDMethods.Wheel_Wheel_move,
					_wheel,_wheel,null);
	}

	pointcut Sensor_Sensor_work(Sensor _sensorSource, Object _sensor):
		call(* work(..))
		&& if(_sensor instanceof Sensor)
		&& if(_sensorSource instanceof Sensor)
		&& target(_sensor) && this(_sensorSource) ;

	after(Sensor _sensorSource,Object _sensor):Sensor_Sensor_work(_sensorSource,_sensor)
	{
		changeCutState(MSDMethods.Sensor_Sensor_work,
					_sensor,_sensor,null);
	}

	pointcut Computer_Computer_finish(Computer _computerSource, Object _computer):
		call(* finish(..))
		&& if(_computer instanceof Computer)
		&& if(_computerSource instanceof Computer)
		&& target(_computer) && this(_computerSource) ;

	after(Computer _computerSource,Object _computer):Computer_Computer_finish(_computerSource,_computer)
	{
		changeCutState(MSDMethods.Computer_Computer_finish,
					_computer,_computer,null);
	}

	pointcut GasPaddle_GasPaddle_press(GasPaddle _gasPaddleSource, Object _gasPaddle):
		call(* press(..))
		&& if(_gasPaddle instanceof GasPaddle)
		&& if(_gasPaddleSource instanceof GasPaddle)
		&& target(_gasPaddle) && this(_gasPaddleSource) ;

	after(GasPaddle _gasPaddleSource,Object _gasPaddle):GasPaddle_GasPaddle_press(_gasPaddleSource,_gasPaddle)
	{
		changeCutState(MSDMethods.GasPaddle_GasPaddle_press,
					_gasPaddle,_gasPaddle,null);
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
			case MSDMethods.Sensor_Sensor_damage:
				if(activeMSD.instancesEquals(Sensor_INST_sensor,sourceObject)
					&& activeMSD.instancesEquals(Sensor_INST_sensor,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(3,3,3,3))
					{
						activeMSD.setCut(3,3,4,3);
						break;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			case MSDMethods.Wheel_Wheel_move:
				if(activeMSD.instancesEquals(Wheel_INST_wheel,sourceObject)
					&& activeMSD.instancesEquals(Wheel_INST_wheel,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(1,0,0,0))
					{
						activeMSD.setCut(1,1,0,0);
						return;
					}
				}
				if(activeMSD.instancesEquals(Wheel_INST_wheel,sourceObject)
					&& activeMSD.instancesEquals(Wheel_INST_wheel,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(1,0,1,0))
					{
						activeMSD.setCut(1,1,1,0);
						if(evaluateCondition(3,activeMSD))
						{
							activeMSD.setCut(2,2,2,1);
							return;
						}
						break;
					}
				}
				if(activeMSD.instancesEquals(Wheel_INST_wheel,sourceObject)
					&& activeMSD.instancesEquals(Wheel_INST_wheel,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,0,0,0))
					{
						activeMSD.setCut(0,1,0,0);
						return;
					}
				}
				if(activeMSD.instancesEquals(Wheel_INST_wheel,sourceObject)
					&& activeMSD.instancesEquals(Wheel_INST_wheel,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,0,1,0))
					{
						activeMSD.setCut(0,1,1,0);
						return;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			case MSDMethods.Sensor_Sensor_work:
				if(activeMSD.instancesEquals(Sensor_INST_sensor,sourceObject)
					&& activeMSD.instancesEquals(Sensor_INST_sensor,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(1,1,0,0))
					{
						activeMSD.setCut(1,1,1,0);
						if(evaluateCondition(3,activeMSD))
						{
							activeMSD.setCut(2,2,2,1);
							return;
						}
						break;
					}
				}
				if(activeMSD.instancesEquals(Sensor_INST_sensor,sourceObject)
					&& activeMSD.instancesEquals(Sensor_INST_sensor,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(1,0,0,0))
					{
						activeMSD.setCut(1,0,1,0);
						return;
					}
				}
				if(activeMSD.instancesEquals(Sensor_INST_sensor,sourceObject)
					&& activeMSD.instancesEquals(Sensor_INST_sensor,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,1,0,0))
					{
						activeMSD.setCut(0,1,1,0);
						return;
					}
				}
				if(activeMSD.instancesEquals(Sensor_INST_sensor,sourceObject)
					&& activeMSD.instancesEquals(Sensor_INST_sensor,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,0,0,0))
					{
						activeMSD.setCut(0,0,1,0);
						return;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			case MSDMethods.Computer_Computer_finish:
				if(activeMSD.instancesEquals(Computer_INST_computer,sourceObject)
					&& activeMSD.instancesEquals(Computer_INST_computer,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(2,2,2,1))
					{
						activeMSD.setCut(2,2,2,2);
						if(evaluateCondition(3,activeMSD))
						{
							activeMSD.setCut(3,3,3,3);
							return;
						}
						break;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			case MSDMethods.GasPaddle_GasPaddle_press:
				if(activeMSD.instancesEquals(GasPaddle_INST_GasPaddle,sourceObject)
					&& activeMSD.instancesEquals(GasPaddle_INST_GasPaddle,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,0,0,0))
					{
						activeMSD.setCut(1,0,0,0);
						return;
					}
				}
				if(activeMSD.instancesEquals(GasPaddle_INST_GasPaddle,sourceObject)
					&& activeMSD.instancesEquals(GasPaddle_INST_GasPaddle,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,1,0,0))
					{
						activeMSD.setCut(1,1,0,0);
						return;
					}
				}
				if(activeMSD.instancesEquals(GasPaddle_INST_GasPaddle,sourceObject)
					&& activeMSD.instancesEquals(GasPaddle_INST_GasPaddle,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,1,1,0))
					{
						activeMSD.setCut(1,1,1,0);
						if(evaluateCondition(3,activeMSD))
						{
							activeMSD.setCut(2,2,2,1);
							return;
						}
						break;
					}
				}
				if(activeMSD.instancesEquals(GasPaddle_INST_GasPaddle,sourceObject)
					&& activeMSD.instancesEquals(GasPaddle_INST_GasPaddle,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,0,1,0))
					{
						activeMSD.setCut(1,0,1,0);
						return;
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
		GasPaddle GasPaddle = (GasPaddle)bindObjectByExpression(activeMSD,GasPaddle_INST_GasPaddle,null, true);;
		Wheel wheel = (Wheel)bindObjectByExpression(activeMSD,Wheel_INST_wheel,null, true);;
		Sensor sensor = (Sensor)bindObjectByExpression(activeMSD,Sensor_INST_sensor,null, true);;
		Computer computer = (Computer)bindObjectByExpression(activeMSD,Computer_INST_computer,null, true);;

		switch (conditionNumber)
		{
			case 3: 
				return true;
		}
		return false;
	}


	protected void setCutsExpressions()
	{
		this.setExpressionForCut("2,2,2,1" , "SYNC0");
		this.setExpressionForCut("3,3,3,3" , "SYNC");

	}


	@SuppressWarnings("unused")
	protected void doBindings(ActiveMSDAspect activeMSD)
	{
		activeMSD.setLineInstance(GasPaddle_INST_GasPaddle,AppObjects.getObject("GasPaddle","GasPaddle"));
		activeMSD.setLineInstance(Wheel_INST_wheel,AppObjects.getObject("wheel","Wheel"));
		activeMSD.setLineInstance(Sensor_INST_sensor,AppObjects.getObject("sensor","Sensor"));
		activeMSD.setLineInstance(Computer_INST_computer,AppObjects.getObject("computer","Computer"));
		GasPaddle GasPaddle = (GasPaddle)bindObjectByExpression(activeMSD,GasPaddle_INST_GasPaddle, null, false );
		Wheel wheel = (Wheel)bindObjectByExpression(activeMSD,Wheel_INST_wheel, null, false );
		Sensor sensor = (Sensor)bindObjectByExpression(activeMSD,Sensor_INST_sensor, null, false );
		Computer computer = (Computer)bindObjectByExpression(activeMSD,Computer_INST_computer, null, false );

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
		GasPaddle GasPaddle = (GasPaddle)bindObjectByExpression(activeMSD,GasPaddle_INST_GasPaddle,null, true);;
		Wheel wheel = (Wheel)bindObjectByExpression(activeMSD,Wheel_INST_wheel,null, true);;
		Sensor sensor = (Sensor)bindObjectByExpression(activeMSD,Sensor_INST_sensor,null, true);;
		Computer computer = (Computer)bindObjectByExpression(activeMSD,Computer_INST_computer,null, true);;

		MSDMethod MSDm21 = new MSDMethod(GasPaddle,GasPaddle,
			MSDMethods.GasPaddle_GasPaddle_press,null,"GasPaddle:GasPaddle:press",niceName,activeMSD.getId());// press() Monitored
		MSDMethod MSDm25 = new MSDMethod(wheel,wheel,
			MSDMethods.Wheel_Wheel_move,null,"Wheel:Wheel:move",niceName,activeMSD.getId());// move() Monitored
		MSDMethod MSDm29 = new MSDMethod(sensor,sensor,
			MSDMethods.Sensor_Sensor_damage,null,"Sensor:Sensor:damage",niceName,activeMSD.getId());// damage() Execute
		MSDMethod MSDm30 = new MSDMethod(computer,computer,
			MSDMethods.Computer_Computer_finish,null,"Computer:Computer:finish",niceName,activeMSD.getId());// finish() Execute
		MSDMethod MSDm31 = new MSDMethod(sensor,sensor,
			MSDMethods.Sensor_Sensor_work,null,"Sensor:Sensor:work",niceName,activeMSD.getId());// work() Monitored

		 if(activeMSD.isInCut(0,0,0,0))
		{
				ME.add(MSDm21);
				ME.add(MSDm25);
				ME.add(MSDm31);
				CV.add(MSDm30,MSDm29);
				return;
		}
		 if(activeMSD.isInCut(0,1,0,0))
		{
				ME.add(MSDm21);
				ME.add(MSDm31);
				CV.add(MSDm25,MSDm30,MSDm29);
				return;
		}
		 if(activeMSD.isInCut(0,0,1,0))
		{
				ME.add(MSDm21);
				ME.add(MSDm25);
				CV.add(MSDm31,MSDm30,MSDm29);
				return;
		}
		 if(activeMSD.isInCut(0,1,1,0))
		{
				ME.add(MSDm21);
				CV.add(MSDm31,MSDm25,MSDm30,MSDm29);
				return;
		}
		 if(activeMSD.isInCut(1,0,0,0))
		{
				ME.add(MSDm25);
				ME.add(MSDm31);
				CV.add(MSDm21,MSDm30,MSDm29);
				return;
		}
		 if(activeMSD.isInCut(1,1,0,0))
		{
				ME.add(MSDm31);
				CV.add(MSDm21,MSDm25,MSDm30,MSDm29);
				return;
		}
		 if(activeMSD.isInCut(1,0,1,0))
		{
				ME.add(MSDm25);
				CV.add(MSDm21,MSDm31,MSDm30,MSDm29);
				return;
		}
		 if(activeMSD.isInCut(2,2,2,1))
		{
				if(MSDm30.sourceInstance!=null && MSDm30.targetInstance!=null){
					EE.add(MSDm30);
				}
				HV.add(MSDm21,MSDm31,MSDm25,MSDm29);
				return;
		}
		 if(activeMSD.isInCut(3,3,3,3))
		{
				if(MSDm29.sourceInstance!=null && MSDm29.targetInstance!=null){
					EE.add(MSDm29);
				}
				HV.add(MSDm21,MSDm31,MSDm25,MSDm30);
				return;
		}
	}
	
	@SuppressWarnings("unused")
	public Object bindObjectByExpression (ActiveMSDAspect activeMSD,int lifelineIndex, 
			Object obj, boolean retrieveOnly){

		Object result = null;
		// in case the object is already bounded returning the bounded object
		result = activeMSD.getLineInstance(lifelineIndex);
		if (result == null){
			GasPaddle GasPaddle = (GasPaddle) activeMSD.getLineInstance(GasPaddle_INST_GasPaddle);
			Wheel wheel = (Wheel) activeMSD.getLineInstance(Wheel_INST_wheel);
			Sensor sensor = (Sensor) activeMSD.getLineInstance(Sensor_INST_sensor);
			Computer computer = (Computer) activeMSD.getLineInstance(Computer_INST_computer);
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
