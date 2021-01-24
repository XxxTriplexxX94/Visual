//  The file MSDAspectLSC2.aj was automatically generated using S2A 2.0.0.201512210921.
//  For information see http://www.wisdom.weizmann.ac.il/~maozs/s2a/

package aspects;

import playgo.systemmodel.classes.*;
import playgo.systemmodel.types.*;
import java.util.ArrayList;
import il.ac.wis.cs.s2a.runtime.lib.*;
import il.ac.wis.cs.playgo.playtoolkit.*;


public aspect MSDAspectLSC2 extends MSDAspect
{


	//Constants for instances, locations and variables
	static final int Car_INST_car = 0;
	static final int Computer_INST_computer = 1;

	static final int String_arg_String_exact_String_arg10 = 0;


	private final String niceName = "LSC2";

	MSDAspectLSC2()
	{
		addMinimalEvent(MSDMethods.Car_Car_park);
		setHotCut(3,3);
		setHotCut(2,1);
		setLastCut(3,4);
		numberOfLifeLines = 2;
		numberOfInstances = 2;
		numberOfVariables = 1;
		interactionId = "1611517258089";
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

	pointcut Computer_Computer_search(Computer _computerSource, Object _computer,String String_exact_String_arg10):
		call(* search(..))
		&& if(_computer instanceof Computer)
		&& if(_computerSource instanceof Computer)
		&& target(_computer) && this(_computerSource)  && args(String_exact_String_arg10);

	after(Computer _computerSource,Object _computer,String String_exact_String_arg10):Computer_Computer_search(_computerSource,_computer, String_exact_String_arg10)
	{
		ArrayList<Object> args = getArgsList(String_exact_String_arg10);
		changeCutState(MSDMethods.Computer_Computer_search,
					_computer,_computer,args);
	}

	pointcut Car_Car_park(Car _carSource, Object _car):
		call(* park(..))
		&& if(_car instanceof Car)
		&& if(_carSource instanceof Car)
		&& target(_car) && this(_carSource) ;

	after(Car _carSource,Object _car):Car_Car_park(_carSource,_car)
	{
		changeCutState(MSDMethods.Car_Car_park,
					_car,_car,null);
	}

	pointcut Computer_Computer_park(Computer _computerSource, Object _computer):
		call(* park(..))
		&& if(_computer instanceof Computer)
		&& if(_computerSource instanceof Computer)
		&& target(_computer) && this(_computerSource) ;

	after(Computer _computerSource,Object _computer):Computer_Computer_park(_computerSource,_computer)
	{
		changeCutState(MSDMethods.Computer_Computer_park,
					_computer,_computer,null);
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
			case MSDMethods.Computer_Computer_search:
				if(activeMSD.instancesEquals(Computer_INST_computer,sourceObject)
					&& activeMSD.instancesEquals(Computer_INST_computer,targetObject)
					&& activeMSD.variableEquals(String_arg_String_exact_String_arg10,args.get(0)))
				{
					unification=true;
					if(activeMSD.isInCut(2,1))
					{
						activeMSD.setCut(2,2);
						if(evaluateCondition(1,activeMSD))
						{
							activeMSD.setCut(3,3);
							return;
						}
						break;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			case MSDMethods.Car_Car_park:
				if(activeMSD.instancesEquals(Car_INST_car,sourceObject)
					&& activeMSD.instancesEquals(Car_INST_car,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,0))
					{
						activeMSD.setCut(1,0);
						if(evaluateCondition(1,activeMSD))
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

			case MSDMethods.Computer_Computer_park:
				if(activeMSD.instancesEquals(Computer_INST_computer,sourceObject)
					&& activeMSD.instancesEquals(Computer_INST_computer,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(3,3))
					{
						activeMSD.setCut(3,4);
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
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car,null, true);;
		Computer computer = (Computer)bindObjectByExpression(activeMSD,Computer_INST_computer,null, true);;

		String arg10 = null;
		if(activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10)!=null){
			arg10 = (String) activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10);
		}

		switch (conditionNumber)
		{
			case 1: 
				return true;
		}
		return false;
	}


	protected void setCutsExpressions()
	{
		this.setExpressionForCut("2,1" , "SYNC0");
		this.setExpressionForCut("3,3" , "SYNC");

	}


	@SuppressWarnings("unused")
	protected void doBindings(ActiveMSDAspect activeMSD)
	{
		activeMSD.setLineInstance(Car_INST_car,AppObjects.getObject("car","Car"));
		activeMSD.setLineInstance(Computer_INST_computer,AppObjects.getObject("computer","Computer"));
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car, null, false );
		Computer computer = (Computer)bindObjectByExpression(activeMSD,Computer_INST_computer, null, false );

		String arg10 = null;
		if(activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10)!=null){
			arg10 = (String) activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10);
		}

		try{
			activeMSD.setPrivateVariable(String_arg_String_exact_String_arg10, (String)"2km radius");
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
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car,null, true);;
		Computer computer = (Computer)bindObjectByExpression(activeMSD,Computer_INST_computer,null, true);;

		String VAR_String_exact_String_arg10 = null;
		if(activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10)!=null){
			VAR_String_exact_String_arg10 = (String) activeMSD.getPrivateVariable(String_arg_String_exact_String_arg10);
		}

		MSDMethod MSDm35 = new MSDMethod(car,car,
			MSDMethods.Car_Car_park,null,"Car:Car:park",niceName,activeMSD.getId());// park() Monitored
		MSDMethod MSDm36 = new MSDMethod(computer,computer,
			MSDMethods.Computer_Computer_park,null,"Computer:Computer:park",niceName,activeMSD.getId());// park() Execute
		ArrayList<Object>  args37 = getArgsList(VAR_String_exact_String_arg10);
		MSDMethod MSDm37 = new MSDMethod(computer,computer,
			MSDMethods.Computer_Computer_search,args37,"Computer:Computer:search",niceName,activeMSD.getId());// search() Execute

		 if(activeMSD.isInCut(0,0))
		{
				ME.add(MSDm35);
				CV.add(MSDm37);
				return;
		}
		 if(activeMSD.isInCut(2,1))
		{
				if(MSDm37.sourceInstance!=null && MSDm37.targetInstance!=null){
					EE.add(MSDm37);
				}
				HV.add(MSDm35,MSDm36);
				return;
		}
		 if(activeMSD.isInCut(3,3))
		{
				if(MSDm36.sourceInstance!=null && MSDm36.targetInstance!=null){
					EE.add(MSDm36);
				}
				HV.add(MSDm37);
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
			Car car = (Car) activeMSD.getLineInstance(Car_INST_car);
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
