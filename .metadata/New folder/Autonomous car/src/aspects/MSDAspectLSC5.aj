//  The file MSDAspectLSC5.aj was automatically generated using S2A 2.0.0.201512210921.
//  For information see http://www.wisdom.weizmann.ac.il/~maozs/s2a/

package aspects;

import playgo.systemmodel.classes.*;
import playgo.systemmodel.types.*;
import java.util.ArrayList;
import il.ac.wis.cs.s2a.runtime.lib.*;
import il.ac.wis.cs.playgo.playtoolkit.*;


public aspect MSDAspectLSC5 extends MSDAspect
{


	//Constants for instances, locations and variables
	static final int Env_INST_User = 0;
	static final int Car_INST_car = 1;

	static final int String_arg_String_symbolic_var_Police = 0;


	private final String niceName = "LSC5";

	MSDAspectLSC5()
	{
		addMinimalEvent(MSDMethods.Env_Car_AttempToSeal);
		setHotCut(3,5);
		setHotCut(2,2);
		setLastCut(4,6);
		numberOfLifeLines = 2;
		numberOfInstances = 2;
		numberOfVariables = 1;
		interactionId = "1611514221090";
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

	pointcut Car_Car_call(Car _carSource, Object _car,String String_symbolic_var_Police):
		call(* call(..))
		&& if(_car instanceof Car)
		&& if(_carSource instanceof Car)
		&& target(_car) && this(_carSource)  && args(String_symbolic_var_Police);

	after(Car _carSource,Object _car,String String_symbolic_var_Police):Car_Car_call(_carSource,_car, String_symbolic_var_Police)
	{
		ArrayList<Object> args = getArgsList(String_symbolic_var_Police);
		changeCutState(MSDMethods.Car_Car_call,
					_car,_car,args);
	}

	pointcut Car_Car_access(Car _carSource, Object _car):
		call(* access(..))
		&& if(_car instanceof Car)
		&& if(_carSource instanceof Car)
		&& target(_car) && this(_carSource) ;

	after(Car _carSource,Object _car):Car_Car_access(_carSource,_car)
	{
		changeCutState(MSDMethods.Car_Car_access,
					_car,_car,null);
	}

	pointcut Env_Car_AttempToSeal(Env _user, Object _car):
		call(* AttempToSeal(..))
		&& if(_car instanceof Car)
		&& target(_car) && this(_user) ;

	after(Env _user,Object _car):Env_Car_AttempToSeal(_user,_car)
	{
		changeCutState(MSDMethods.Env_Car_AttempToSeal,
					_user,_car,null);
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
					&& activeMSD.symbolicVariableEquals(String_arg_String_symbolic_var_Police,args.get(0)))
				{
					unification=true;
					if(activeMSD.isInCut(2,2))
					{
						activeMSD.setPrivateVariable(String_arg_String_symbolic_var_Police,args.get(0));
						activeMSD.setCut(2,3);
						if(evaluateCondition(1,activeMSD))
						{
							activeMSD.setCut(3,4);
							return;
						}
						break;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			case MSDMethods.Car_Car_access:
				if(activeMSD.instancesEquals(Car_INST_car,sourceObject)
					&& activeMSD.instancesEquals(Car_INST_car,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(3,4))
					{
						activeMSD.setCut(3,5);
						if(evaluateCondition(3,activeMSD))
						{
							activeMSD.setCut(4,6);
							break;
						}
						break;
					}
				}
				if(!unification)//No unification...
					return;
				break;

			case MSDMethods.Env_Car_AttempToSeal:
				if(activeMSD.instancesEquals(Car_INST_car,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(0,0))
					{
						activeMSD.setCut(1,1);
						if(evaluateCondition(1,activeMSD))
						{
							activeMSD.setCut(2,2);
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
		Env User = (Env)bindObjectByExpression(activeMSD,Env_INST_User,null, true);;
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car,null, true);;

		String Police = null;
		if(activeMSD.getPrivateVariable(String_arg_String_symbolic_var_Police)!=null){
			Police = (String) activeMSD.getPrivateVariable(String_arg_String_symbolic_var_Police);
		}

		switch (conditionNumber)
		{
			case 1: 
				return true;
			case 3: 
				return false;
		}
		return false;
	}


	protected void setCutsExpressions()
	{
		this.setExpressionForCut("2,2" , "SYNC0");
		this.setExpressionForCut("3,4" , "SYNC");
		this.setExpressionForCut("4,6" , "Forbid");

	}


	@SuppressWarnings("unused")
	protected void doBindings(ActiveMSDAspect activeMSD)
	{
		activeMSD.setLineInstance(Env_INST_User,AppObjects.getObject("User","Env"));
		activeMSD.setLineInstance(Car_INST_car,AppObjects.getObject("car","Car"));
		Env User = (Env)bindObjectByExpression(activeMSD,Env_INST_User, null, false );
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car, null, false );

		String Police = null;
		if(activeMSD.getPrivateVariable(String_arg_String_symbolic_var_Police)!=null){
			Police = (String) activeMSD.getPrivateVariable(String_arg_String_symbolic_var_Police);
		}

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
		Env User = (Env)bindObjectByExpression(activeMSD,Env_INST_User,null, true);;
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car,null, true);;

		String VAR_String_symbolic_var_Police = null;
		if(activeMSD.getPrivateVariable(String_arg_String_symbolic_var_Police)!=null){
			VAR_String_symbolic_var_Police = (String) activeMSD.getPrivateVariable(String_arg_String_symbolic_var_Police);
		}

		MSDMethod MSDm16 = new MSDMethod(User,car,
			MSDMethods.Env_Car_AttempToSeal,null,"Env:Car:AttempToSeal",niceName,activeMSD.getId());// AttempToSeal() Monitored
		ArrayList<Object>  args17 = getArgsList(VAR_String_symbolic_var_Police);
		MSDMethod MSDm17 = new MSDMethod(car,car,
			MSDMethods.Car_Car_call,args17,"Car:Car:call",niceName,activeMSD.getId());// call() Execute
		MSDMethod MSDm18 = new MSDMethod(car,car,
			MSDMethods.Car_Car_access,null,"Car:Car:access",niceName,activeMSD.getId());// access() Monitored

		 if(activeMSD.isInCut(0,0))
		{
				ME.add(MSDm16);
				CV.add(MSDm17,MSDm18);
				return;
		}
		 if(activeMSD.isInCut(2,2))
		{
				if(MSDm17.sourceInstance!=null && MSDm17.targetInstance!=null){
					EE.add(MSDm17);
				}
				HV.add(MSDm18,MSDm16);
				return;
		}
		 if(activeMSD.isInCut(3,4))
		{
				ME.add(MSDm18);
				CV.add(MSDm17,MSDm16);
				HV.add(MSDm18);
				return;
		}
	}
	
	@SuppressWarnings("unused")
	public Object bindObjectByExpression (ActiveMSDAspect activeMSD,int lifelineIndex, 
			Object obj, boolean retrieveOnly){

		String Police = null;
		if(activeMSD.getPrivateVariable(String_arg_String_symbolic_var_Police)!=null){
			Police = (String) activeMSD.getPrivateVariable(String_arg_String_symbolic_var_Police);
		}

		Object result = null;
		// in case the object is already bounded returning the bounded object
		result = activeMSD.getLineInstance(lifelineIndex);
		if (result == null){
			Env User = (Env) activeMSD.getLineInstance(Env_INST_User);
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
