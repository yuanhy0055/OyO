#ifndef ANDROID_EDFW_SERVICE_H
#define ANDROID_EDFW_SERVICE_H

//#include <utils.h>
#include <utils/RefBase.h>
#include <binder/IInterface.h>
#include <binder/Parcel.h>
#include <utils/threads.h>

namespace android
{
       class TCLService : public BBinder
       {
              mutable Mutex mLock;
              int32_t mNextConnId;

              public: 
              static int instantiate();
              TCLService();
              virtual ~TCLService();
              virtual status_t onTransact(uint32_t, const Parcel&, Parcel*, uint32_t);
       };
}
#endif
