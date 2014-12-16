#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"


using namespace openflurry;



static void openflurry_init(value apiKey, value verbose) {
	init(val_string(apiKey), val_bool(verbose));
}
DEFINE_PRIM (openflurry_init, 2);

static void openflurry_logEvent(value eventName, value keys, value values, value timed){
	logEvent(val_string(eventName), val_string(keys), val_string(values), val_bool(timed));
}
DEFINE_PRIM (openflurry_logEvent, 4);

static void openflurry_endTimedEvent(value eventName, value keys, value values){
	endTimedEvent(val_string(eventName), val_string(keys), val_string(values));
}
DEFINE_PRIM(openflurry_endTimedEvent, 3);

static void openflurry_onPageView(){
	onPageView();
}
DEFINE_PRIM(openflurry_onPageView, 0);

extern "C" void openflurry_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (openflurry_main);


extern "C" int openflurry_register_prims () { return 0; }