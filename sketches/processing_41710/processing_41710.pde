
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim yehbro;
AudioPlayer beep;

float broX = mouseX;
float broY = mouseY;
float ball1X = 600;
float ball1Y = 300;

float ballwidth1 = 75;
boolean hasmouseP = false;

float imagex = width/2; 
float imagey = height/2; 
float rotate1 = 0; 
float rotate2 = 0; 
float rotate3 = 0; 

int speedX = 0;
int speedY = 0;

int pressed = 0;

int distX;
int distY;


boolean shrink = false;

PImage b;



void setup() {
  size(700,400);
  frameRate(50);

  yehbro = new Minim(this);
  beep = yehbro.loadFile("pitchchange.wav");
  smooth();
   
  b = loadImage("data/gradient.jpg");
  
  
}

void draw() {
  //background(255,255,255);

  //GRADIENT
  pushMatrix(); 
  imageMode(CENTER); 
  translate(width/2,height/2); 
  rotate(radians( rotate2)); 

  image(b, imagex, imagey);
  strokeWeight(5);
  stroke(200,200,200,0);
  line(0, 0, 0, -350);

  popMatrix();

  rotate2 = rotate2+8;
  if(rotate2 >= 360){
    rotate2 = 0;
  }

  
  float angle1 = degrees(atan2(sin(radians( rotate2-90)),cos(radians( rotate2-90))));
  float angle2 = degrees(atan2(ball1Y-height/2,ball1X-height/2));

  float dif = abs(angle1 - angle2);
  
  if(dif < 5){
    shrink = true;
  }
  //BALL AND LINE
  strokeWeight(2);
  stroke(0,0,0);
  fill(0,0,0);
  ellipse(width/2, height/2, 25, 25);
  ellipse(ball1X, ball1Y, ballwidth1, ballwidth1); 

  line(ball1X, ball1Y, width/2, height/2);
  if(hasmouseP) {

    ball1X= mouseX;
    ball1Y= mouseY;
  }

  ballwidth1 = dist(ball1X, ball1Y, width/2, height/2)/5+20;

  if(shrink == true) {
        beep.play();
    if(dist(ball1X, ball1Y, width/2, height/2) > (25/2 + ballwidth1/2+3)){
      
      float distX = 350 - ball1X;
      ball1X = ball1X + (distX/15);
      float distY = 200 - ball1Y;
      ball1Y = ball1Y + (distY/15);
            
    }
    if(dist(ball1X, ball1Y, width/2, height/2) < (25/2 + ballwidth1/2+3)){
      shrink = false;
          }
  

    
    
      //beep.pause();
      //beep.rewind();
    
   
    //1.Play sound
    //2.change playpos
  }
   if(shrink == false){
     
     beep.pause();
    beep.rewind();
   }

if(pressed == 1){
 shrink = false; 
  
}

  
}

void mousePressed() {
  if(dist(ball1X, ball1Y, mouseX, mouseY)<ballwidth1/2) {
    hasmouseP = true;
    shrink = false;
    pressed = 1;
    
  }
  
}

void mouseReleased() {
  hasmouseP = false;
  //shrink = false; 
  pressed = 0;
}

  
  




