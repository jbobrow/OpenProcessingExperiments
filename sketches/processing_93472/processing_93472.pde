
import processing.pdf.*;
boolean saveOneFrame=false;
float x =320;
float y = 320;
float a = random(0,200);
float speed = .01;
int directionx = 1;
int directiony =1;
PImage motif1; 
PImage motif2; 
PImage motif3; 
PImage motif4;
PImage motif5;
PImage motif6;
 
float aspect; boolean paused = false;

void setup() {
  size(1500, 1500);
  smooth();
  motif1 = loadImage("nayon_motif1.png");
  motif2 = loadImage("nayon_motif2.png");
  motif3 = loadImage("nayon_motif3.png");
  motif4 = loadImage("nayon_motif4.png");
  motif5 = loadImage("nayon_motif5.png");
  motif6 = loadImage("nayon_motif6.png");
  background(225);
}

void draw() {
   variableEllipse(mouseX, mouseY, pmouseX,pmouseY);
   
  if(!paused){
    aspect = random(0,.15);
    image(motif1, random(width), random(height), motif1.width*aspect, motif1.height*aspect);
 
  aspect = random (0, 0.2);
image(motif2, random(width), random(height), motif1.width*aspect, motif1.height*aspect);
}
fill(255,5);
rect(0,0,1500,1500);

  translate(750,750);
  stroke(0.1);
  fill(random(0,255),random(0,255),random(0,255));
  x += speed*directionx;
  y += speed*directiony;
  if ((x > width-20) || (x < 20)) {
    directionx = -directionx;
  }
  if ((y > height-20) || (y<20)) {
    directiony = -directiony;
  }
  
  for(int i = 0; i <= width; i += 20) {
    float r = random(0, 255);
    float g = random(0, 255);
    float b = random(0, 255);
    float a = random(0, 255);
    float e = random(0, height);
    float o = random(0, width);
    float f = random(0, 10);
    float j = random(0, 100);
    stroke (r, g, b, a);
    noFill();
    strokeWeight(f);
    
    rotate(j);
    ellipse(x,y,mouseX,mouseY);
  }
}
 
void keyPressed(){
  if(key == 'c'|| key == 'C'){
    background (0);
  }
   
  if(key == 'a'){
    if (paused){paused = false;}
    else{paused = true;}
  }
   
  if(key == '1'){
save("picture1.jpg");  // whole screen of program
 }}
 
void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x,y,speed,speed);
}
  


