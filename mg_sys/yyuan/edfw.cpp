#include "edfw.h"

#include <binder/IServiceManager.h>
#include <binder/IPCThreadState.h>

namespace android {

       static struct sigaction oldact;
       static pthread_key_t sigbuskey;

       int TCLService::instantiate() {
              LOGW("TCLService instantiate");

              int r = defaultServiceManager()->addService(
                            String16("TCL.portal"), new TCLService());

              LOGW("TCLService r = %d\n", r);
              return r;
       }

       TCLService::TCLService()
	{
		LOGW("TCLService created");
		mNextConnId = 1;
		pthread_key_create(&sigbuskey, NULL);
	}

       TCLService::~TCLService()
       {
		pthread_key_delete(sigbuskey);
		LOGW("TCLService destroyed");
       }

       status_t TCLService::onTransact(
                uint32_t code, const Parcel& data, Parcel* reply, uint32_t flags){

              switch(code) {

                     case 0: {
                                   pid_t pid = data.readInt32();
                                   int num = data.readInt32();
                                   num = num + 1000;
                                   reply->writeInt32(num);
                                   return NO_ERROR;
                            } break;

                     default:
                            return BBinder::onTransact(code, data, reply, flags);
              }
       }
};
