
import processing.video.*;


import ddf.minim.*;
Minim minim;
AudioInput in;
int i = 0;



Capture video;
int newx=0;
int newy=0;

int frameCounter=0;


void setup() {

  size(800, 800, P2D);
  video = new Capture(this, 320, 240, 15);
 
  frameRate(24);
  smooth();
  video.crop(0, 0, 240,240);
  
  minim = new Minim(this);
  minim.debugOn();
   
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 64);
 //fft.forward(in.left); 

 
}



void draw() {


   

    int loc=newx + newy * video.width;
    color c=video.pixels[loc];
  //sound speeds up frame rate?
  
for(int i = 0; i < in.bufferSize() - 1; i++){
  
    if((in.left.get(i)*1000)<-5 ){
    background(c); 
}
  if((in.left.get(i)*1000)> -5 && (in.left.get(i)*1000)<3){
  background(0);
}
 
   if((in.left.get(i)*1000)>3){
   background(c); 
 }
 


    
   // println(in.left.get(i)*1000);
  
 
    
}
  
  if(newx < video.width){
    newx++;
  }
    if(newx == video.width){
    newx=0;
    newy=newy+10;
  }
   if(newy == video.height){
    newx=0;
    newy=0;
  }
  
  

  video.read(); 
  pushMatrix();
  scale(-1,1);
  image(video, -240, 0);
  popMatrix();
  
    


  strokeWeight(5);
  stroke(255);
  point(newx,newy);
  

  
  
  
}
  
 

   

//void captureEvent(Capture c) 
//c.read();
//}
 





