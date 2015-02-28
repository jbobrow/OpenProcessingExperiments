
import processing.video.*;
int numPixels;
int[] backgroundPixels;


import ddf.minim.*;
Minim minim;
AudioInput in;
int i = 0;



Capture video;
int newx=0;
int newy=0;
int videoWidth=320;
int videoHeight=240;




void setup() {

  size(800, 800, P2D);
  video = new Capture(this, videoWidth, videoHeight, 15);
  

  loadPixels();
 

  smooth();
  video.crop(0, 0, videoHeight,videoHeight);
  
  minim = new Minim(this);
  minim.debugOn();
   
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 64);


 
}



void draw() {


   

    int loc=newx + newy * video.width;
    color c=video.pixels[loc];
    
  //variability in color of video effects frame rate
  video.loadPixels();  
 
 int sum = 0;
 int sumAvg = 0;
 for(int ii=0; ii<video.pixels.length;ii++){
   sum += brightness(video.pixels[ii]);
   sumAvg= sum/(videoHeight*videoHeight);
 }
 println(sumAvg);
  

  if(sumAvg>50){
    frameRate(5);
  }
  
   if(sumAvg>=50 && sumAvg<=120){
    frameRate(12);
 
  }
   if(sumAvg>=120 && sumAvg<=160){
    frameRate(24);
  }

    if(sumAvg>160){
    frameRate(40);
    }
  

  
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
  image(video, -videoHeight, 0);
  popMatrix();
  
    


  strokeWeight(5);
  stroke(255);
  point(newx,newy);
  

updatePixels();
  

  
  
  
}
  
 

   






