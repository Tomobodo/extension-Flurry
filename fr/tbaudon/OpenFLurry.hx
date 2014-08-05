package fr.tbaudon ;

#if (android && openfl)
import openfl.utils.JNI;
#end


class OpenFLurry {
	
	/**************************************************************/
	// JNI LINKING
	/*
	 * jni type cheat sheet :
	 * parameter type beetween (), return type after ()
	 * nonBasicObject : Lpath/to/class;
	 * void : V
	 * bool : Z
	 * int : I
	 * Sample : (Ljava/lang/String;I)Z = function(String, Int) : bool
	 */
	// STATIC METHOD
	private static var startSession_jni = JNI.createStaticMethod("fr.tbaudon.OpenFLurry", "init", "(Ljava/lang/String;)V");
	private static var logEvent_jni = JNI.createStaticMethod("fr.tbaudon.OpenFLurry", "logEvent", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V");
	private static var endTimedEvent_jni = JNI.createStaticMethod("fr.tbaudon.OpenFLurry", "endTimedEvent", "(Ljava/lang/String;)V");
	
	public static function initSession(apiKey : String) {
		startSession_jni(apiKey);
	}
	
	public static function logEvent(eventName : String, params : Map<String, String> = null, timed : Bool = false) {
		var keys : String = "";
		var values : String = "";
		
		if (params != null) {
			for (key in params.keys()) {
				keys += key + ';';
				values += params[key] + ";";
			}
			
			keys = keys.substr(0, keys.length - 1);
			values = values.substr(0, values.length - 1);
			trace(keys, values);
		}	
			
		logEvent_jni(eventName, keys, values, timed);
	}
	
	public static function endTimedEvent(eventName :String) {
		endTimedEvent_jni(eventName);
	}
}