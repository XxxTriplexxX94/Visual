//  The file MSDAspectLCS7.aj was automatically generated using S2A 2.0.0.201512210921.
//  For information see http://www.wisdom.weizmann.ac.il/~maozs/s2a/

package aspects;

import playgo.systemmodel.classes.*;
import playgo.systemmodel.types.*;
import java.util.ArrayList;
import il.ac.wis.cs.s2a.runtime.lib.*;
import il.ac.wis.cs.playgo.playtoolkit.*;


public aspect MSDAspectLCS7 extends MSDAspect
{


	//Constants for instances, locations and variables
	static final int Env_INST_User = 0;
	static final int Car_INST_car = 1;

	static final int String_arg_String_symbolic_var_PickUp = 0;


	private final String niceName = "LCS7";

	MSDAspectLCS7()
	{
		addMinimalEvent(MSDMethods.Env_Car_call);
		setHotCut(2,2);
		setLastCut(2,3);
		numberOfLifeLines = 2;
		numberOfInstances = 2;
		numberOfVariables = 1;
		interactionId = "1611560333836";
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

	pointcut Env_Car_call(Env _user, Object _car,String String_symbolic_var_PickUp):
		call(* call(..))
		&& if(_car instanceof Car)
		&& target(_car) && this(_user)  && args(String_symbolic_var_PickUp);

	after(Env _user,Object _car,String String_symbolic_var_PickUp):Env_Car_call(_user,_car, String_symbolic_var_PickUp)
	{
		ArrayList<Object> args = getArgsList(String_symbolic_var_PickUp);
		changeCutState(MSDMethods.Env_Car_call,
					_user,_car,args);
	}

	pointcut Car_Car_drive(Car _carSource, Object _car):
		call(* drive(..))
		&& if(_car instanceof Car)
		&& if(_carSource instanceof Car)
		&& target(_car) && this(_carSource) ;

	after(Car _carSource,Object _car):Car_Car_drive(_carSource,_car)
	{
		changeCutState(MSDMethods.Car_Car_drive,
					_car,_car,null);
	}

	protected void  setPrivateVariables(int MSDm, Object sourceObject, Object targetObject,ActiveMSDAspect activeMSD,
		ArrayList args)
	{
		switch (MSDm)
		{
			case MSDMethods.Env_Car_call:
						activeMSD.setPrivateVariable(String_arg_String_symbolic_var_PickUp,args.get(0));

				break;

		}
	}

	// MSD Logic:
	protected void  changeActiveMSDCutState(int MSDm, Object sourceObject, Object targetObject,ActiveMSDAspect activeMSD,
		ArrayList args)
	{

		boolean unification=false;
		switch (MSDm)
		{
			case MSDMethods.Env_Car_call:
				if(activeMSD.instancesEquals(Car_INST_car,targetObject)
					&& activeMSD.symbolicVariableEquals(String_arg_String_symbolic_var_PickUp,args.get(0)))
				{
					unification=true;
					if(activeMSD.isInCut(0,0))
					{
						activeMSD.setPrivateVariable(String_arg_String_symbolic_var_PickUp,args.get(0));
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

			case MSDMethods.Car_Car_drive:
				if(activeMSD.instancesEquals(Car_INST_car,sourceObject)
					&& activeMSD.instancesEquals(Car_INST_car,targetObject))
				{
					unification=true;
					if(activeMSD.isInCut(2,2))
					{
						activeMSD.setCut(2,3);
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

		String PickUp = null;
		if(activeMSD.getPrivateVariable(String_arg_String_symbolic_var_PickUp)!=null){
			PickUp = (String) activeMSD.getPrivateVariable(String_arg_String_symbolic_var_PickUp);
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
		this.setExpressionForCut("2,2" , "SYNC0");

	}


	@SuppressWarnings("unused")
	protected void doBindings(ActiveMSDAspect activeMSD)
	{
		activeMSD.setLineInstance(Env_INST_User,AppObjects.getObject("User","Env"));
		activeMSD.setLineInstance(Car_INST_car,AppObjects.getObject("car","Car"));
		Env User = (Env)bindObjectByExpression(activeMSD,Env_INST_User, null, false );
		Car car = (Car)bindObjectByExpression(activeMSD,Car_INST_car, null, false );

		String PickUp = null;
		if(activeMSD.getPrivateVariable(String_arg_String_symbolic_var_PickUp)!=null){
			PickUp = (String) activeMSD.getPrivateVariable(String_arg_String_symbolic_var_PickUp);
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

		String VAR_String_symbolic_var_PickUp = null;
		if(activeMSD.getPrivateVariable(String_arg_String_symbolic_var_PickUp)!=null){
			VAR_String_symbolic_var_PickUp = (String) activeMSD.getPrivateVariable(String_arg_String_symbolic_var_PickUp);
		}

		MSDMethod MSDm38 = new MSDMethod(car,car,
			MSDMethods.Car_Car_drive,null,"Car:Car:drive",niceName,activeMSD.getId());// drive() Execute
		ArrayList<Object>  args39 = getArgsList(VAR_String_symbolic_var_PickUp);
		MSDMethod MSDm39 = new MSDMethod(User,car,
			MSDMethods.Env_Car_call,args39,"Env:Car:call",niceName,activeMSD.getId());// call() Monitored

		 if(activeMSD.isInCut(0,0))
		{
				ME.add(MSDm39);
				CV.add(MSDm38);
				return;
		}
		 if(activeMSD.isInCut(2,2))
		{
				if(MSDm38.sourceInstance!=null && MSDm38.targetInstance!=null){
					EE.add(MSDm38);
				}
				HV.add(MSDm39);
				return;
		}
	}
	
	@SuppressWarnings("unused")
	public Object bindObjectByExpression (ActiveMSDAspect activeMSD,int lifelineIndex, 
			Object obj, boolean retrieveOnly){

		String PickUp = null;
		if(activeMSD.getPrivateVariable(String_arg_String_symbolic_var_PickUp)!=null){
			PickUp = (String) activeMSD.getPrivateVariable(String_arg_String_symbolic_var_PickUp);
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
