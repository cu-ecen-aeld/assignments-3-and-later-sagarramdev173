/*
One difference from the write.sh instructions in Assignment 1:  You do not need to make your "writer" utility create directories which do not exist.  
You can assume the directory is created by the caller.
Setup syslog logging for your utility using the LOG_USER facility.
Use the syslog capability to write a message “Writing <string> to <file>” where <string> is the text string written to file (second argument) and <file> is the file created by the script.  
This should be written with LOG_DEBUG level.
Use the syslog capability to log any unexpected errors with LOG_ERR level.
*/

#include <syslog.h>
#include <stdio.h>


int main(int argc, char const *argv[])
{
    if (argc != 3)
    {
        syslog(LOG_ERR, "Usage: %s <string> <file>", argv[0]);
        return 1;
    }
    const char *filedir, *writestr;    
    filedir=argv[1];
    writestr=argv[2];    
    FILE *fp = fopen(filedir, "w");
    if (fp == NULL)
    {
        syslog(LOG_ERR, "Could not open %s for writing", writestr);
        return 1;
    }
    fprintf(fp, "%s", writestr);   
    syslog(LOG_DEBUG, "Writing %s to %s where %s is the text string written to file and %s is the file created by the script", argv[1], argv[2],argv[1],argv[2]);    
    fclose(fp);
    

    return 0;
}
