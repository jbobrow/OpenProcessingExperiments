
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
AudioRecorder recorder;
float[] buffer;

int countname; //change the name
int name = 000000; //set the number in key's' function

void newFile()
{      
 countname =( name + 1);
 recorder = minim.createRecorder(in, "file/A08May" + countname + ".wav", true);
 // println("file/" + countname + ".wav");
}



void setup() {
  //size(screenWidth,screenHeight);
  size(1000,1000);
  minim = new Minim(this);
    in = minim.getLineIn(Minim.STEREO, 2048);
    
    


}

 void draw() {

 stroke(0); 
 
 //background(255,255,255,10);

  
  
  for(int i = 0; i < in.bufferSize() - 1; i++)
 {
 
   line(i, 500+ in.left.get(i)*10000, i+1,  500+in.left.get(i+1)*10000);
   
   
   noFill();
stroke(0,0,0,2);
bezier(0, height/2, width/2,height/2-in.left.get(i)*2000, width/2, height/2-in.right.get(i)*2000,width, height/2);
 }
 
 
 
// newFile();
 
 }
  






void stop() {
in.close();
  minim.stop();
  super.stop();
}



