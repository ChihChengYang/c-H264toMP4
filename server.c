 
#include "va_ff.h"

#define FILE_PATH_NAME_LENGTH 256

//--------------------------------------- 
int va_server_transformH264IntoMp4(char *in_filepath, char *in_filename); /* Single file */
//---------------------------------------

int va_server_transformH264IntoMp4(char *in_filepath, char *in_filename){
    int ret=0;
	char inputFilePathAndName[FILE_PATH_NAME_LENGTH];
	sprintf(inputFilePathAndName, "%s/%s",in_filepath,in_filename); 
	char outputFilePathAndName[FILE_PATH_NAME_LENGTH];
	sprintf(outputFilePathAndName, "%s/%s.mp4",in_filepath, in_filename); 
	ret = va_ff_muxer(inputFilePathAndName,outputFilePathAndName);
 	if(ret!=0){
		printf ("Transform H.264 Into Mp4 Error!!!!!!!!\n");  
	}
	return ret;
}

int main(int argc, char *argv[]){
   
    va_server_transformH264IntoMp4("./", "test.264");

    getchar();
    return 0;
}
