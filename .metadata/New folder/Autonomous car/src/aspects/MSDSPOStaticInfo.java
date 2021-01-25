package aspects;

import java.util.ArrayList;
import java.util.HashMap;

public class MSDSPOStaticInfo {

	private static HashMap<String,HashMap<Integer,String>> interactionsLifelines=null;
	private static HashMap<String,HashMap<Integer,String>> interactionsVariables=null;


	public static HashMap<String,HashMap<Integer,String>>
		getInteractionLifelines()
	{
		if(interactionsLifelines==null){
			buildInteractionsLifelines();
		}
		return interactionsLifelines;
	}

	private static void buildInteractionsLifelines()
	{
		interactionsLifelines=new HashMap<String,HashMap<Integer,String>>();
		HashMap<Integer,String> lifelines = null;

		lifelines = new HashMap<Integer,String>();
		lifelines.put(0,"computer");
		lifelines.put(1,"GasPaddle");
		lifelines.put(2,"wheel");
		lifelines.put(3,"sensor");
		interactionsLifelines.put("LSC3", lifelines);

		lifelines = new HashMap<Integer,String>();
		lifelines.put(0,"car");
		lifelines.put(1,"computer");
		interactionsLifelines.put("LSC2", lifelines);

		lifelines = new HashMap<Integer,String>();
		lifelines.put(0,"User");
		lifelines.put(1,"car");
		interactionsLifelines.put("LCS7", lifelines);

		lifelines = new HashMap<Integer,String>();
		lifelines.put(0,"sensor");
		lifelines.put(1,"car");
		interactionsLifelines.put("LSC6", lifelines);

		lifelines = new HashMap<Integer,String>();
		lifelines.put(0,"User");
		lifelines.put(1,"car");
		interactionsLifelines.put("LSC5", lifelines);

		lifelines = new HashMap<Integer,String>();
		lifelines.put(0,"GasPaddle");
		lifelines.put(1,"wheel");
		lifelines.put(2,"sensor");
		lifelines.put(3,"computer");
		interactionsLifelines.put("LSC4", lifelines);

		lifelines = new HashMap<Integer,String>();
		lifelines.put(0,"User");
		lifelines.put(1,"car");
		interactionsLifelines.put("TempLSC1", lifelines);
	}


	public static HashMap<String,HashMap<Integer,String>>
		getInteractionVariables()
	{
		if(interactionsVariables==null){
			buildInteractionsVariables();
		}
		return interactionsVariables;
	}

	private static void buildInteractionsVariables()
	{
		interactionsVariables=new HashMap<String,HashMap<Integer,String>>();
		HashMap<Integer,String> variables = null;

		variables = new HashMap<Integer,String>();
		variables.put(0,"PickUp");
		interactionsVariables.put("MSDAspectLCS7", variables);

		variables = new HashMap<Integer,String>();
		variables.put(0,"Police");
		interactionsVariables.put("MSDAspectLSC5", variables);
	}

}

