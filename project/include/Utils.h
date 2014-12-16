#ifndef OPENFLURRY_H
#define OPENFLURRY_H


namespace openflurry {
	
	
	void init(const char * apiKey, bool verbose);
	
	void logEvent(const char * name, const char * keys, const char * values, bool timed);

	void endTimedEvent(const char * name, const char * keys, const char * values);

	void onPageView();
}


#endif