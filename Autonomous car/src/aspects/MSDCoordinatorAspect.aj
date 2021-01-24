//  The file MSDCoordinatorAspect.aj was automatically generated using S2A 2.0.0.201512210921.
//  For information see http://www.wisdom.weizmann.ac.il/~maozs/s2a/

package aspects;

import playgo.systemmodel.classes.*;
import playgo.systemmodel.types.*;
import java.util.ArrayList;
import java.util.Vector;
import java.util.Stack;
import il.ac.wis.cs.s2a.runtime.Utils;
import il.ac.wis.cs.s2a.runtime.lib.*;


public aspect MSDCoordinatorAspect extends MSDCoordinator
{
	declare precedence: MSDCoordinatorAspect, *;
	ICoordinatorStrategy strategy = null;

	TraceVisHandler traceVisHandler = null;

	private static final int ENV_MESSAGE_ID = 777;
	private Vector<MSDMethod> history;

	private boolean lock = false;
	private static Stack<MSDMethod> coordinateStack = new Stack<MSDMethod>();
	private static boolean firstTime = true;
	private static MSDCoordinatorAspect instance = null;

		public static MSDCoordinatorAspect getInstance(){
		return instance;
	}

	pointcut strategyInit()
		: (execution(playgo.systemmodel.SystemModelMain.new()) && if(firstTime));

	before() : strategyInit()
	{
		instance=this;

		firstTime=false;

		new AdditionalInfo(Utils.getModelFilesPaths(),
				MSDSPOStaticInfo.getInteractionLifelines(),
				MSDSPOStaticInfo.getInteractionVariables(),
				Utils.getRuntimePropertiesPath(),
				Utils.isConcreteLSc());

		traceVisHandler = TraceVisHandler.getSingleton();

		if(strategy == null){
			strategy = StrategyFactory.createStrategy(
				Utils.getRuntimePropertiesPath());
			history = new Vector<MSDMethod>();

		}

		boolean initSucceed = strategy.init();
		if (!initSucceed)
		{
			MSDPlayoutView.setStrategyInitFailed();
		}
	}

	pointcut EnvNoop():
		execution(void il.ac.wis.cs.systemmodel.SMEnvBaseClass+.noop());

	after (): EnvNoop(){

		MSDMethod envMeth = new MSDMethod(
			null,	//src (env)
			null,	//tgt (env)
			-1,		//messageId (not in use here)
			null);	//args

		envMeth.messageIdStr="env:env:noop";
		history.add(envMeth);

		coordinate(envMeth);
	}

	public void Sensor.Wrapperdamage(Sensor _sensor)
	{
		_sensor.damage();
	}

	public void Wheel.Wrappermove(Wheel _wheel)
	{
		_wheel.move();
	}

	public void Car.Wrapperaccess(Car _car)
	{
		_car.access();
	}

	public void Env.WrapperLookForPark(Car _car)
	{
		_car.LookForPark();
	}

	public void Sensor.Wrapperwork(Sensor _sensor)
	{
		_sensor.work();
	}

	public void Env.WrapperAttempToSeal(Car _car)
	{
		_car.AttempToSeal();
	}

	public void Car.Wrappercall(Car _car,String String_symbolic_var_Police)
	{
		_car.call(String_symbolic_var_Police);
	}

	public void Computer.Wrappersearch(Computer _computer,String String_exact_String_arg10)
	{
		_computer.search(String_exact_String_arg10);
	}

	public void Computer.Wrapperfinish(Computer _computer)
	{
		_computer.finish();
	}

	public void GasPaddle.Wrapperpress(GasPaddle _gasPaddle)
	{
		_gasPaddle.press();
	}

	public void Car.Wrapperpark(Car _car)
	{
		_car.park();
	}

	public void Computer.Wrapperpark(Computer _computer)
	{
		_computer.park();
	}

	pointcut MSDMessage():
	call(* search(..))
	|| call(* press(..))
	|| call(* work(..))
	|| call(* move(..))
	|| call(* access(..))
	|| call(* LookForPark(..))
	|| call(* damage(..))
	|| call(* finish(..))
	|| call(* call(..))
	|| call(* AttempToSeal(..))
	|| call(* park(..));


	after (): MSDMessage()
	{
		ArrayList<Object> args = null;
		if(thisJoinPoint.getArgs()!=null){
			args = new ArrayList<Object>();
			for(int i=0;i<thisJoinPoint.getArgs().length;i++){
				args.add(thisJoinPoint.getArgs()[i]);
			}	
		}
		MSDMethod envMeth = new MSDMethod(
				null,	//src (env)
				thisJoinPoint.getTarget(),
				ENV_MESSAGE_ID, //messageId (not in use here)
				args);

		envMeth.messageIdStr="env:"+
			thisJoinPoint.getTarget().getClass().getSimpleName()+":"+
			thisJoinPoint.getSignature().getName();

		if(history==null)return;	//called before strategyInit, probably via irrelevant caught call
		history.add(envMeth);

		MSDAspect.handlingEvent(thisJoinPoint);
		coordinate(envMeth);
	}

	public void coordinate(MSDMethod envMeth)
	{
		if (lock)
		{
			coordinateStack.push(envMeth);
			return;
		}
		else
		{
			lock = true;
			afterImpl(envMeth);
			lock = false;
		}
		if(coordinateStack.size() > 0)
		{
			coordinate(coordinateStack.pop());
		}
	}

	private void afterImpl(MSDMethod envMeth) 
	{
		ArrayList<MSDAspect> aspects = new ArrayList<MSDAspect>();

		MSDMethodSet monitoringEnabled = new MSDMethodSet();
		MSDMethodSet executingEnabled = new MSDMethodSet();
		MSDMethodSet coldViolation = new MSDMethodSet();
		MSDMethodSet hotViolation = new MSDMethodSet();

		MSDAspectTempLSC1.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		aspects.add(MSDAspectTempLSC1.aspectOf());

		MSDAspectLSC3.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		aspects.add(MSDAspectLSC3.aspectOf());

		MSDAspectLSC5.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		aspects.add(MSDAspectLSC5.aspectOf());

		MSDAspectLSC6.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		aspects.add(MSDAspectLSC6.aspectOf());

		MSDAspectLSC4.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		aspects.add(MSDAspectLSC4.aspectOf());

		MSDAspectLSC2.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		aspects.add(MSDAspectLSC2.aspectOf());

		 // Coordinate all execution engines:
		playgo.systemmodel.SystemModelMain.getInstance().coordinateAll();

		MSDMethod MSDm = strategy.chooseMethod(monitoringEnabled, executingEnabled, coldViolation, hotViolation
				,history,aspects);

		history.add(MSDm);
		dealWithTraceVis(MSDm, envMeth);
		wrapperCallPoint(MSDm);
	}

	private void dealWithTraceVis(MSDMethod MSDm, MSDMethod envMeth) {
		TraceVisMSDMethodSet monitoringEnabled = new TraceVisMSDMethodSet();
		TraceVisMSDMethodSet executingEnabled = new TraceVisMSDMethodSet();
		TraceVisMSDMethodSet coldViolation = new TraceVisMSDMethodSet();
		TraceVisMSDMethodSet hotViolation = new TraceVisMSDMethodSet();

		MSDAspectTempLSC1.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		MSDAspectLSC3.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		MSDAspectLSC5.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		MSDAspectLSC6.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		MSDAspectLSC4.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);
		MSDAspectLSC2.aspectOf().getCutState(monitoringEnabled, executingEnabled, coldViolation, hotViolation);

	if (envMeth != null && MSDm != null && envMeth.messageID == ENV_MESSAGE_ID) {
		envMeth = null;
	}

		traceVisHandler.notify(monitoringEnabled, executingEnabled, coldViolation, hotViolation, MSDm, envMeth);
	}


	protected void wrapperCall(MSDMethod MSDm)
	{
		if(MSDm==null){
			return;
		}
		switch (MSDm.messageID)
		{
			case MSDMethods.Car_Car_call:
			 ((Car)MSDm.sourceInstance).Wrappercall(
				(Car)MSDm.targetInstance
				,(String)MSDm.args.get(0));
			break;
			case MSDMethods.Sensor_Sensor_damage:
			 ((Sensor)MSDm.sourceInstance).Wrapperdamage(
				(Sensor)MSDm.targetInstance);
			break;
			case MSDMethods.Wheel_Wheel_move:
			 ((Wheel)MSDm.sourceInstance).Wrappermove(
				(Wheel)MSDm.targetInstance);
			break;
			case MSDMethods.Computer_Computer_search:
			 ((Computer)MSDm.sourceInstance).Wrappersearch(
				(Computer)MSDm.targetInstance
				,(String)MSDm.args.get(0));
			break;
			case MSDMethods.Car_Car_access:
			 ((Car)MSDm.sourceInstance).Wrapperaccess(
				(Car)MSDm.targetInstance);
			break;
			case MSDMethods.Sensor_Sensor_work:
			 ((Sensor)MSDm.sourceInstance).Wrapperwork(
				(Sensor)MSDm.targetInstance);
			break;
			case MSDMethods.Computer_Computer_finish:
			 ((Computer)MSDm.sourceInstance).Wrapperfinish(
				(Computer)MSDm.targetInstance);
			break;
			case MSDMethods.GasPaddle_GasPaddle_press:
			 ((GasPaddle)MSDm.sourceInstance).Wrapperpress(
				(GasPaddle)MSDm.targetInstance);
			break;
			case MSDMethods.Car_Car_park:
			 ((Car)MSDm.sourceInstance).Wrapperpark(
				(Car)MSDm.targetInstance);
			break;
			case MSDMethods.Computer_Computer_park:
			 ((Computer)MSDm.sourceInstance).Wrapperpark(
				(Computer)MSDm.targetInstance);
			break;
		}
	}

}

