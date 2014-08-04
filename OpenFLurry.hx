package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class OpenFLurry {
	
	
	public static function sampleMethod (inputValue:Int):Int {
		
		#if (android && openfl)
		
		var resultJNI = openflurry_sample_method_jni(inputValue);
		var resultNative = openflurry_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;
		
		#else
		
		return openflurry_sample_method(inputValue);
		
		#end
		
	}
	
	
	private static var openflurry_sample_method = Lib.load ("openflurry", "openflurry_sample_method", 1);
	
	#if (android && openfl)
	private static var openflurry_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.OpenFLurry", "sampleMethod", "(I)I");
	#end
	
	
}