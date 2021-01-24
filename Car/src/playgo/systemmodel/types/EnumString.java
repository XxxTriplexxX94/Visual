
package playgo.systemmodel.types;



/**
 * This file was automatically generated using PlayGo system-model.
 * This class shouldn't be changed. Any change to this class will be overridden!!!
 * 
 */
public enum EnumString {

    _empty ("empty"),
	_on ("on");

	private String displayString;

	EnumString(String displayString){
		this.displayString = displayString;
	}
	public String toString(){
		return this.displayString;
	}
	public boolean equals(String str) {
		return str.equals(this.toString());
	}

}
