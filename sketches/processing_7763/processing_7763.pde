
//Processing combined effort
//This is a basic template suggested by bit.craft from the processing.org forums
//Others have expressed interest in working on a combined processing effort.
//The premise is that we are achieve to stitch multiple sketches together after 150 frames
//Using passing parameters between sketches to allow smoth transition.
//This is a very basic sketch template of what we are trying to achieve
//If you have any comments are sketches to submit reply here or post at the following links
//
//http://processing.org/discourse/yabb2/YaBB.pl?num=1266418665/0
//
//http://processing.org/discourse/yabb2/YaBB.pl?num=1266769552/0#0

import java.lang.reflect.Constructor;
public boolean forward = true;
public boolean up = false;
public int px=0;
public int py =0;
public int ly=0;
public int lx=0;

final int W = 640, H = 480, BG = #000000, fps = 30, seconds = 6;
boolean export = false; //cannot be used with online version
PApplet[] sketches;
String[] names;
int s;
public PFont font1; 

void setup() {
  
  size(640, 480,P3D);
   font1 = createFont("arial",12);
  Class[] classes = getClass().getDeclaredClasses();
  int n = classes.length;
  sketches = new PApplet[n];
  names = new String[n];
  
  for(int i=0; i<n; i++) {
    try {
      Constructor c = classes[i].getDeclaredConstructor(getClass());
      sketches[i] = (PApplet) c.newInstance(this);
      sketches[i].init();  
      names[i] = split(c.getName(), "$")[1];    
    } catch (Exception e) {}
  }
  textFont(font1, 12);
  frameRate(fps);
}


void draw() {
 bounce(true, 3, 1, 5);
  if(frameCount % (seconds * fps) == 1) {
    
    // stop running sketch
    if(frameCount>1) {
      println("stopping " + names[s]);
      sketches[s].stop();
      s = (s+1) % sketches.length;
    }
    
    // start next sketch
  //  println("starting " + names[s]);
  
  
    sketches[s].run();
    text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
  }

  sketches[s].handleDraw();
  PImage img = sketches[s].get();
  img.loadPixels();
  image(img, 0, 0);
  if(export && frameCount <= fps*seconds*sketches.length) saveFrame("showreel-#####.png");
     
}


class Sketch1 extends PApplet {
  void setup() {
    size(640, 480,JAVA2D);
    smooth();
    textFont(font1, 12);
  }
  void draw()  {
    background(BG); 
    ellipse(px, py, 20, 20);
    text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
  } 
}

class Sketch2 extends PApplet {
  void setup() {
    size(W, H, JAVA2D);
        smooth();
        textFont(font1, 12);
  }
  void draw()  {
    background(BG); 
 //   ellipse(W/2, H/2, 20, 20);
    ellipse(px, py, 20, 20);
   text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
  } 
}


class Sketch3 extends PApplet {
  void setup() {
    size(640, 480, P3D); 
        smooth();
        textFont(font1, 12);
  }
  void draw()  {
    background(BG); 
    lights(); 
    noStroke(); 
   // translate(W/2, H/2, 0); 
    translate(px,py, 0); 
    sphere(10);
  text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
  } 
}


void bounce(boolean rnd, int by, int lo, int hi){
 if (forward){
  if (rnd)px+=random(lo,hi); 
   if (!rnd){
    px+=by; 
   }
 } 
 
 
   if (!forward){
     if(rnd)px-=random(lo,hi);  
     if (!rnd){
      px-=by; 
     }
     }
   
   if (up){
    if (rnd)py-=random(lo,hi*2); 
     if (!rnd){
       py+=by;
     }
     }
     
     if (!up){
      if(rnd)py+=random(lo,hi*2); 
     if (!rnd){
       py-=by;
     }  
       
     }
   
   
   if (px>width)forward = false;
   if (px<0)    forward = true;
   if (py>height)up     = true;
   if (py<0     )up     = false;
  }  
  
 
  
  

