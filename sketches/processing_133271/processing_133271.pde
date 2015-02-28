
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage hook;
PShader blur;

Minim minim;
AudioPlayer player;

Animation animation1;



float xpos;
float ypos;
float drag = 20.0;
float x = 100;
float y = 100;
float a;

float angle = 0;
float targetAngle = 0;
float easing = 0.1;

void setup() {
  size(1024, 500);
  blur = loadShader("blur.glsl");
  background(77, 193, 222);
  frameRate(19);
  animation1 = new Animation("frame_", 23);
  ypos = height * 0.25;
  
   
 minim = new Minim(this);
  player = minim.loadFile("underwater.mp3.mp3");
  player.play();
  
  
  hook = loadImage("hook1.png");



}

void draw() { 

 filter(blur);
  noCursor();
 
  float xdx = mouseX - xpos;
    float ydx = mouseY - ypos;
  xpos = xpos + xdx/drag;
  ypos = ypos + ydx/drag;

  angle = atan2 (mouseY-86, mouseX -124/20);
  targetAngle += (angle - targetAngle)*easing;
  
  //if (mousePressed) {
    background(77,193,222);
    stroke(60,176,205);
    line(a, 0, a-50, height);  
    a = a - 5;
    if (a < 0) { 
    a = width; }
    
    stroke(70,186,215);
    strokeWeight (5);    
    line(a-80, 0, a-50-80, height);  
    a = a - 15;
    if (a < 0) { 
    a = width; }
    
    stroke(70,186,215);
    strokeWeight (3);    
    line(a-30, 0, a-50-30, height);  
    a = a - 20;
    if (a < 0) { 
    a = width; }
    
 

 // animation1.display(xpos-animation1.getWidth()/2, ypos/drag);
 // }else{
    pushMatrix();
    filter(blur);
    translate(-50,50);
    rectMode(CENTER);
      rotate(targetAngle);
     animation1.display(xpos-animation1.getWidth()/2, ypos/drag);
  
    popMatrix();
    
    pushMatrix();
    filter(blur);
    stroke(0);
    strokeWeight(1);
    line(mouseX, 0, 10+mouseX, mouseY);
    image(hook, mouseX, mouseY);
    popMatrix();
    
 // }

}
 

// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 3) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}


