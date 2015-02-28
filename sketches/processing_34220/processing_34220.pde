

//refrences//
//I recieved help and  suggestions for bootcamp teachers
//kENNY RORABACK
//NIDHI MALHOTRA
//AND of course TAMI EVNIN<woot woot!>
//Some of the texts//sites that I read and reviewed were 
//http://processing.org/reference/
//http://www.ai.mit.edu/projects/cog/VisionSystem/motion_detection.html#Our%20Approach
//mit text
//MIT.Press.Programming.Handbook
//Processing  a programming Handbook for Visual Designers and Artist
//by
//Ben Fry 
//and Casey Reas 
//computer vision and art by Golan Levin
//elementary computer vision techniques
//http://www.bureauit.org/sbox/
//http://www.wired.com/culture/lifestyle/news/2004/08/64720

import processing.video.*;
//importing the video library

Capture isight;
//I named the capture isight b/c thats the name of 
//the built in mac book webcam
// The last frame is actually called as an image
PImage lastFrame;
//PShape a;
//PShape b; 
//PImage mytry;


// threshold is like the threshold feature on photoediting
//basically the light and dark values of a photo
float threshold = 50;

void setup() {
//    mytry= loadImage("tri.gif");
//  a = loadShape("print1.svg");
//  b = loadShape("print2.svg"); 
//the bigger the size the slower it runs....thats alot of pixel values
  size(520,440);
  ///                                     dont go above 30...your processing will crash
  ///note to self try on a more powerful computer. 
  isight = new Capture(this, width, height, 15);
  
  //the last frame is captured as an image that is the 
  //same deminsons as the original 
  lastFrame = createImage(isight.width,isight.height,RGB);
}

void draw() {
  //the beackground is removed so that the shapes appear to be drawing
  //it leaves a water effect
 // background(255,255,255);
  
//the millis function takes images every 10 seconds
//I wanted a photo booth effect
if(millis()%10==0){
  saveFrame("img-####.jpg");

} 
    
  if (isight.available()) {
    
    //saving a copy of the last frame image
    lastFrame.copy(isight,0,0,isight.width,isight.height,0,0,isight.width,isight.height);
   lastFrame.updatePixels();
   //reading the updated pixels
   isight.read();
  }
  
  loadPixels();
  isight.loadPixels();
  lastFrame.loadPixels();
  
  
  float motionData = 0;

 // pixel color change
    for (int i = 0; i < isight.pixels.length; i ++ ) {
    
//defining the color "now"
    color current = isight.pixels[i];
   
    color previous = lastFrame.pixels[i];
    
//motion isnt actually detected but the color values are 
//compared triggering the float diff 

//current color values
float rojo1 = red(current); 
float verde1 = green(current);
float azul1 = blue(current);


//old color values
float rojo2 = red(previous); 
float verde2 = green(previous);
float azul2 = blue(previous);
    
//kenny helped me with fine tuning the distance function
//I am compairing the RGB values  the old and the new

// (x1,y1,z1,x2,y2,z2)    
float diff = dist(rojo1,verde1,azul1,rojo2,verde2,azul2);
    
    
     
   motionData += diff; 
    //By using the dist function I was able to speed the computer up....when 
    //I made color values that were defined as (previous - current) the program 
    //became very slow : (
    //so I used this new approach. 
  }
  
   
  float avgMotion = motionData / isight.pixels.length; 
  // averageMotion =  (the complete or total motion) motiondata /pixels picked up 
  
  
  
  //painted background
  
  
  
  smooth();
  stroke(0);
  strokeWeight(3);
  noFill();
  float r2 = avgMotion*6;
  //shape(a,height/2,width/2,r2,r2);
  //i was experimenting with differnt shapes
  arc(width/2,0, r2, r2, 0,300);
  //I am experimenting with different filters
  filter(BLUR, 4);
  
    smooth();
  stroke(0);
  strokeWeight(3);
  noFill();
  float r0 = avgMotion*6;
  //shape(a,height/2,width/2,r2,r2);
  //i was experimenting with differnt shapes
  arc(width/2,0, r0, r0, 0,300);
  //I am experimenting with different filters
  filter(BLUR, 4);
  
  
  
  
  
  
   
  smooth();
  stroke(0);
  strokeWeight(3);
  noFill();
  float r4 = avgMotion*6;
  //shape(a,height/2,width/2,r2,r2);
  //i was experimenting with differnt shapes
  arc(140,height/2, r4, r4, 0,300);
  //I am experimenting with different filters
  filter(BLUR, 6);
  
  
  
   
  smooth();
  stroke(255,255,255);
  strokeWeight(3);
  noFill();
  float r7 = avgMotion*6;
  //shape(a,height/2,width/2,r2,r2);
  //i was experimenting with differnt shapes
  arc(320,height/2, r7, r7, 0,300);
  //I am experimenting with different filters
  filter(BLUR, 4);
  
  
  
  
  
 smooth();
  stroke(255,255,255);
  strokeWeight(3);
  noFill();
  float r4a= avgMotion*6;
  arc(0,height/2, r4a, r4a, 0,300);
 // shape(a,100,100,r4,r4)
 
 
 smooth();
  stroke(0);
  strokeWeight(3);
  noFill();
  float r5 = avgMotion*6;
  arc(520,height/2, r5, r5, 0,300);
 // shape(a,100,100,r4,r4)
 
 
 smooth();
  stroke(0);
  strokeWeight(3);
  fill(0,0,0,90);
  float r6 = avgMotion*6;
  arc(width/2,440, r6, r6, 0,300);
 // shape(a,100,100,r4,r4)



}


///thanks for all your help Tami

