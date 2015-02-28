
int logLevel = 2;
int SILENT = 0;
int DEBUG = 1;
int INFO = 2;

void info(String message){
  if(logLevel >= INFO){
   println("LOG: " + message);
  } 
}

void debug(String message){
  if( logLevel >= DEBUG){
    println("DBG: " + message);
  }
}

