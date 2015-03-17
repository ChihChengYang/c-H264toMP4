#ifndef __VA_FF_H__
#define __VA_FF_H__
 
#ifdef __cplusplus
extern "C"{
#endif
	#include "libavcodec/avcodec.h"
	#include "libavformat/avformat.h"
	#include "libswscale/swscale.h"
 	#include "libavutil/avutil.h"

	//va_server_ffMuxer("/home/imgs/Jeff/REC/5566/2014/12/16/1418720482085.265");
	int va_ff_muxer(char *in_filename_v, char *out_filename);

#ifdef __cplusplus
}
#endif
 
int va_ff_muxer_cplusplus(char *in_filename_v, char *out_filename);
 
 
 

#endif  