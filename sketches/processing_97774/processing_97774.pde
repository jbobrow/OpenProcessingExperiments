
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim miaudio;

AudioPlayer repro; 
      float m=0;


void setup(){
  size(400,400);
  background(0);
   miaudio=new Minim(this);
   repro= miaudio.loadFile("cancion1.mp3");
   repro.play();
   frameRate(30);

}
  
  void draw(){
  background(0);
  

 for(int i=0; i<repro.bufferSize()-1; i++){
   if(abs(repro.mix.get(i))>m){
     m=abs(repro.mix.get(i));
   }
   strokeWeight(4);
    noFill();
    stroke(255,0,0);
    bezier(85*4, 20*4,repro.right.get(i)+100,repro.left.get(i)*300,repro.right.get(i)+400,repro.left.get(i)+600,  15*4, 80*4);
    
    noFill();
    stroke(0,255,0);
    bezier(20*4,80*4, repro.right.get(i)+100,repro.left.get(i)*300,repro.right.get(i)+400,repro.left.get(i)+600, 80*4,15*4);
    
    noFill();
    stroke(0,0,255);
    ellipse(40*5,40*5,350,350);
    

 } 


}



//repro.right.get(i)+100,repro.left.get(i)*300,repro.right.get(i)+400,repro.left.get(i)+600

/*   strokeWeight(4);
    noFill();
    stroke(255,0,0);
    bezier(85*4, 20*4, 10*4,  m*400, 90*4, m*400, 15*4, 80*4);
    
    noFill();
    stroke(0,255,0);
    bezier(20*4,80*4, 10*4,  m*400, 90*4,  m*400, 80*4,15*4);
    
    */
