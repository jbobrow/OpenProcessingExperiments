
// Joseph Kotay. Project 2 Dance Party. Arch 4050 Computational Methods. Spring 2011.

// This sketch is was inspired by the soundBoxes code provided for our class as a resource.
//Even though the background is 2d, the spheres, representing dancelights, are actually rotating in 3d space.  This can on be noticed if you turn on the stroke of the spheres.
//In this sketch, I was having trouble exporting the sketch frames as a simple jpg or pdf, so I'm using screen shots for the time being.




import ddf.minim.*; //Import minim library into code.
import ddf.minim.signals.*;

//import processing.pdf.*;
boolean record;

Minim minim;    
AudioPlayer fullMoon; 

int w = 100; // spacing of the spheres
int h = 200;  
float a;

PImage img;

void setup() {
  size(1200,800,P3D);
  //size(1200,800,PDF, "danceparty.pdf");
  img= loadImage("party_scene.jpg"); //add background image
  
 
  frameRate(100);

  minim = new Minim(this);                      //  load Minum
  fullMoon = minim.loadFile("05 Full Moon featuring Common.mp3");   //  load track into minim library
  fullMoon.loop();
 
  smooth();
  noStroke();  //turn off to get a differnent effect. Must turn on the stroke coe below.
  }

// Not sure how or where these frames are exporting at the moment, but the sketch still works. 
void draw() {
  if(record){
    beginRecord(PDF, "frame-####.pdf");
     if(record){
    endRecord();
    record = false;
    }
  }
  lights();
  smooth();
  background(img);
  set(1200,800,img);
 
  //stroke(115,80,40,random(80,150));
  fill(115,80,40,random(80,150));
  
 
// camera settings, displacement, and ratational settings.

  translate(width/2,height/2,500);
  camera(width/2,-900,-150,width/2,(height/2)-1000,-50,0,-1,0);
  rotateX(frameCount*PI/5*0.05);

  rotateY(PI/80);
  translate(0,0,h);

  for (int j = 0; j < height; j+=h) {
    translate(30,50,h/3);  //when a row is done, move down to the next one in the z-dimension
    pushMatrix();
    for (int i = 0; i < width; i+=w) {
      translate(w,0,0); //move over in the x-dimension
      pushMatrix();

      a = 350* fullMoon.mix.get(i * fullMoon.bufferSize()/width); //get the sound

      translate(0,-a/2,0); 
      sphere(a);
      
      popMatrix();
    }
    popMatrix(); // when the row is done, pop the stack and return to the starting coordinates
    save("danceparty.jpg");
    
 // PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
  //pdf.nextPage();  // Tell it to go to the next page

  // When finished drawing, quit and save the file
  //if (frameCount == 4) {
   // exit();
  }
    
}

// Apply stop and mute settings  
void stop(){
  fullMoon.close();
  minim.stop();
  super.stop();
}
  
//mute out
void keyPressed(){
  if ( key == 'm'|| key == 'M' ){
    if ( fullMoon.isMuted() ){
      fullMoon.unmute();
    }
else{
    fullMoon.mute();
  }
 
  }
}

















