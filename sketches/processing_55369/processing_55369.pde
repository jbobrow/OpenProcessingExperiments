
import processing.video.*;
int numPixels;
int[] backgroundPixels;

PFont fontA;
 
 
import ddf.minim.*;
Minim minim;
AudioInput in;
int i = 0;
 
 
 
Capture video;
int newx=0;
int newy=0;
int videoWidth=320;
int videoHeight=240;

int savedTime;
int totalTime=8000;

boolean colorCounter=false;
int frameCounter=0;
int frameCounterTotal= 0;

boolean colorAnalysis1=false;
boolean colorAnalysis2=false;
boolean colorAnalysis3=false;
boolean colorAnalysis4=false;
boolean colorAnalysis5=false;
 
 
 
 
void setup() {
 
  size(800, 800, P2D);
   background(0);
  video = new Capture(this, videoWidth, videoHeight, 15);
  
  savedTime=millis();
   
 
  loadPixels();
  
     fontA=loadFont("ArialMT-32.vlw");
       textFont(fontA,18);
  
  
 
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
 //println(sumAvg);
   
 
  
 
   
for(int i = 0; i < in.bufferSize() - 1; i++){
   
    if((in.left.get(i)*1000)<=-5 ){
    background(c);
    colorCounter=true;
}
  else if((in.left.get(i)*1000)> -5 && (in.left.get(i)*1000)<3){
  background(0);
  colorCounter=false;
}
  
   else {
   background(c);
   colorCounter=true;
 }
 
 
 
 
 
 if(colorCounter==true){
     frameCounter++;
     frameCounterTotal=frameCounter/in.bufferSize();
    
  
 }
  
     //  println("sound="+(in.left.get(i)*1000)+",frameCounterTotal="+frameCounterTotal);
 
 
     
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
  
 
  
  int passedTime = millis() - savedTime;
  if(passedTime>totalTime){
   
      
      //stuff happens
      
      
        
        
      if(frameCounterTotal<10){
      colorAnalysis1=true;
      colorAnalysis2=false;
      colorAnalysis3=false;
     colorAnalysis4=false;
     colorAnalysis5=false;
      
    }
    
    
      else if (frameCounterTotal>=10  && frameCounterTotal<50){
      colorAnalysis2=true;
        colorAnalysis1=false;
      
      colorAnalysis3=false;
     colorAnalysis4=false;
     colorAnalysis5=false;
      
    }
    
        else if(frameCounterTotal>=50  && frameCounterTotal<75){
        colorAnalysis3=true;
         colorAnalysis1=false;
      colorAnalysis2=false;
      
     colorAnalysis4=false;
     colorAnalysis5=false;
    }
    
        else if(frameCounterTotal>=75  && frameCounterTotal<100){
        colorAnalysis4=true;
              colorAnalysis1=false;
      colorAnalysis2=false;
      colorAnalysis3=false;
  
     colorAnalysis5=false;
    }
    
      else if(frameCounterTotal>=100){
      colorAnalysis5=true;
            colorAnalysis1=false;
      colorAnalysis2=false;
      colorAnalysis3=false;
     colorAnalysis4=false;

    }
    
     savedTime = millis();
println("7 seconds have passesed,frameCounterTotal="+frameCounterTotal);
      
  }

   
            
      if(colorAnalysis1==true){
           fill(255);
           smooth();
  text("Are you sure your mic is on?",400, 400);
  textAlign(CENTER);
      
    }
    
    
      else if (colorAnalysis2==true){
           fill(255);
           smooth();
  text("Speak up! I am trying to test my processing project",400, 400);
  textAlign(CENTER);
   
      
    }
    
        else if(colorAnalysis3==true){
          fill(255);
          smooth();
  text("I like the way you talk.",400, 400);
  textAlign(CENTER);
      
    }
    
        else if(colorAnalysis4==true){
           fill(255);
           smooth();
  text("Alright.  Your getting a little obnoxious now.",400, 400);
  textAlign(CENTER);
     
    }
    
      else if(colorAnalysis5==true){
          fill(255);
          smooth();
  text("Wow, really?  What does a girl have to do to get some black screen around here?",400, 400);
  textAlign(CENTER);
      
    }
    




   
     
 
 
  strokeWeight(5);
  stroke(255);
  point(newx,newy);
   
 
updatePixels();
   
 
   
   
   
}

