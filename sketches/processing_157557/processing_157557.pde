
import gab.opencv.*;
import processing.video.*;
import java.awt.*;
Capture video;
OpenCV opencv;

Oscillator[] oscillators = new Oscillator[200];
Oscillator2[] oscillators2 = new Oscillator2[100];


fOscillator[] foscillators = new fOscillator[50];
fOscillator2[] foscillators2 = new fOscillator2[100];

float px;
float py;
float x;
float y;

boolean observed;

void setup() {
  size(800,600);
  background(255);
  noSmooth();
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator(); 
  }
    for (int i = 0; i < oscillators2.length; i++) {
    oscillators2[i] = new Oscillator2(); 
  }
  for (int i = 0; i < foscillators.length; i++) {
    foscillators[i] = new fOscillator(); 
  }
    for (int i = 0; i < foscillators2.length; i++) {
    foscillators2[i] = new fOscillator2(); 
  }
  px=0;
  py=0;
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video.start();
}

void draw() {
  //Debug Mode//
  if (keyPressed) {
    if (key == 'd') {
     debug(); 
  }
  }
    if (keyPressed) {
    if (key == 's') {
      saveFrame("screen-#####.jpg");
    }
     }
  //
  else{
  opencv.loadImage(video);
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  if (faces.length >0){
  observed=true;}
  else {
  observed =false;}
  println(observed);
  background(0);
 if (observed==true){

     for (int i = 0; i < foscillators.length; i++) {
    foscillators[i].foscillate();
    foscillators[i].fdisplay();
  }
   for (int i = 0; i < foscillators2.length; i++) {
    foscillators2[i].foscillate2();
    foscillators2[i].fdisplay2();
  }
 
  
  }
/*else {
   fill(255,90);
   stroke(255,90);
   ellipse(width/2,height/2,6,6);
}*/
else {

 for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].oscillate();
    oscillators[i].display();
  }
   for (int i = 0; i < oscillators2.length; i++) {

    oscillators2[i].oscillate2();
    oscillators2[i].display2();
  }

}
}
}

void debug(){
      pushMatrix();
      //scale(2);
      opencv.loadImage(video);
      image(video, 0, 0 );
      noFill();
      stroke(0, 255, 0);
      //strokeWeight(3);
      Rectangle[] faces = opencv.detect();
      println(faces.length);
      for (int i = 0; i < faces.length; i++) {
      println(faces[i].x + "," + faces[i].y);
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
     popMatrix(); 
}
class Oscillator {
  PVector angle;
  PVector velocity;
  PVector amplitude;
  
    

 
  
  Oscillator() {
    angle = new PVector();
    velocity = new PVector(random(-0.03,0.03),random(-0.03,0.03));
    amplitude = new PVector(random(width/2),random(height/2)); 
  }
  
  void oscillate() {
    angle.add(velocity);
  }
  
  void display() {
    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

    float d= dist(x, y, px, py);
    

    
    pushMatrix();
    translate(width/2,height/2);
    if (d<300){
    stroke(255,50);
    line(x,y,px,py);
   }
    fill(255,90);
    stroke(255,90);
    ellipse(x,y,6,6);
    popMatrix();
    
    px=x;
    py=y;
    
  }
}

class Oscillator2 {
  PVector angle2;
  PVector velocity2;
  PVector amplitude2;
  
    

 
  
  Oscillator2() {
    angle2 = new PVector();
    velocity2= new PVector(random(-0.03,0.03),random(-0.03,0.03)); 
    amplitude2 = new PVector(random(width/2),random(height/2)); 
  }
  
  void oscillate2() {
    angle2.add(velocity2);
  }
  
  void display2() {
    float x2 = sin(angle2.x)*amplitude2.x;
    float y2 = sin(angle2.y)*amplitude2.y;

    float d= dist(x2, y2, px, py);
    

    
    pushMatrix();
    translate(width/2,height/2);
    if (d<200){
    stroke(255,50);
    line(x2,y2,px,py);
   }
    fill(255,90);
    stroke(255,90);
    ellipse(x2,y2,6,6);
    popMatrix();
  }
}

class fOscillator {
  PVector angle;
  PVector velocity;
  PVector amplitude;
  
    

 
  
  fOscillator() {
    angle = new PVector();
    velocity = new PVector(random(-0.01,0.01),random(-0.01,0.01));
    amplitude = new PVector(random(20),random(30)); 
  }
  
  void foscillate() {
    angle.add(velocity);
  }
  
  void fdisplay() {
    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

    float d= dist(x, y, px, py);
    

    
    pushMatrix();
    translate(width/2,height/2);
    stroke(255,50);
    line(x,y,px,py);
    fill(255,90);
    stroke(255,90);
    ellipse(x,y,6,6);
    popMatrix();
    
    px=x;
    py=y;
    
  }
}

class fOscillator2 {
  PVector angle2;
  PVector velocity2;
  PVector amplitude2;

  
  fOscillator2() {
    angle2 = new PVector();
    velocity2= new PVector(random(-0.03,0.03),random(-0.03,0.03)); 
    amplitude2 = new PVector(random(70),random(70)); 
  }
  
  void foscillate2() {
    angle2.add(velocity2);
  }
  
  void fdisplay2() {
    float x2 = sin(angle2.x)*amplitude2.x;
    float y2 = sin(angle2.y)*amplitude2.y;

    float d= dist(x2, y2, px, py);
    

    
    pushMatrix();
    translate(width/2,height/2);
   if (d<68 && d>20 ){
    stroke(255,50);
    line(x2,y2,px,py);
    }
    fill(255,90);
    stroke(255,90);
    ellipse(x2,y2,6,6);
    popMatrix();
  }
}

void captureEvent(Capture c) {
c.read();
}

/*void mousePressed(){
  setup();
  if (observed ==true){
  observed =false;}
  else {
  observed = true;
  }
  println(observed);
}*/




