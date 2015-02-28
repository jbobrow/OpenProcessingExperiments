
class Recorder{
  String dir,name;
  int cntr = 0;

	
  Recorder(String _dir,String _name){
    dir = _dir;
    name= _name;
    //btrt = _btrt;
  }

  void add(){
    save(dir+"/screen"+nf(cntr,4)+".png");
    cntr++;
  }

  void finish(){
    String Path = sketchPath+"/"+dir;
    try{     
      String bitrate="8000k";//+(((int)(50*25*width*height)/256)*2);
      Runtime.getRuntime().exec("xterm -e png2vid "+Path+" "+name+" "+width+"x"+height+" "+bitrate);
      println("finishing");
    }
    catch(java.io.IOException e){
      println(e); 
    }  
  }
}

