
color brushcolor;
int weight = 10;
PImage ghost;
PImage colors;
PImage jay1;
PImage jay2;
PImage jay3;

void setup(){
  size(760,650);
  background(255);
  smooth();
  ghost = requestImage("ghost.png");
  colors = requestImage("colorselector.png");
  jay1 = requestImage("jay1.jpg");
  jay2 = requestImage("jay2.jpg");
  jay3 = requestImage("jay3.jpg");
}

void draw(){

  float size = 50;
  
  if(mousePressed == true){
    if (mouseButton == LEFT){
      stroke(brushcolor);
    line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
      image(colors,0,600,760,50);
//================================================= color selector
if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {brushcolor = get(mouseX,mouseY);}
  }
  if(keyPressed){
//================================================= z - Erase all
      if (key == 'z') {
        background(255);
      }
//================================================= x - con jay
      if (key == 'x') {
        image(jay1,0,0);
      }
//================================================= c - wonka jay
      if (key == 'c') {
        background(0);
        image(jay2,130,0);
      }
//================================================= v - hat jay
      if (key == 'v') {
        background(0);
        image(jay3,140,60);
      }
//================================================= q = INVERT
      if (key == 'q') {
        filter(INVERT);
      }
//================================================= w = Gray
      if (key == 'w') {
        filter(GRAY);
      }
//================================================= e = THRESHOLD
      if (key == 'e') {
        filter(THRESHOLD);
      }
//================================================= r = blur
      if (key == 'r') {
        filter(BLUR, 1);
      }
//================================================= t = POSTERIZE
      if (key == 't') {
        filter(POSTERIZE, 2);
      }
//================================================= a - random color out of order
//      if (key == 'a') {
//        fill(random(255),random(255),random(255));
//      }
//================================================= 1 = Spray
float x1 = random(weight*2);
float x2 = random(weight*2);
    if (key == '1') {
      stroke(brushcolor);
      line(mouseX+x1-(weight/2), mouseY+x2-(weight/2), mouseX+x1-(weight/2), mouseY+x2-(weight/2));
    }
//================================================= 2 = GHOST STAMP
    if (key == '2') {
      image(ghost,mouseX-(weight/2),mouseY-(weight/2),weight,weight);
    }  
//================================================= 3 = Arc brush  
    if (key == '3') {
      noFill();
      stroke(brushcolor);
      arc(mouseX,mouseY,60+weight*2,60+weight*2,.4,4.5);
    }
//================================================= 4 = thing
//    if (key == '4') {
//      line(mouseX,mouseY,mouseX+weight*2,mouseY+weight*2);
//    }
//================================================= + - size 
if (key == '+') {
       strokeWeight(weight++);
    }
    if (weight == 0) {
       weight = 0;
    } else if (key == '-'){
      strokeWeight(weight--);
    }
  }
}
//================================================= Screen shot

void keyPressed() {
if (key == 's' || key == 'S') {
    saveFrame("screen-##.jpg");
  }}
//=================================================  
//  Left Mouse to Draw
//  Right Mouse to Select Color
//  - Makes Pen Smaller
//  + Makes Pen Bigger
//  1 Spray Paint
//  2 Ghost Stamp
//  3 Curve Brush
//  Q Invert Filter
//  W Gray Filter
//  E Threshold Filter
//  R Blur Filter
//  T Posterize Filter
//  Z Erase All
//  X Draw on Jay
//  C Draw on Jay
//  V Draw on Jay
//  S Save a Screen Shot of Your Awesome Art!!!
//    - Saves as a .jpg
//    - Some times it takes a bit of time to load
//    - You might have to disable pop-up blocker



