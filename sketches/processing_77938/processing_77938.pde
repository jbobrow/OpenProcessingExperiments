
Creature [] jack =new Creature[20];

void setup() {
  size(7*width, 5*height);
  smooth();
  ellipseMode(CENTER);
  rectMode(CORNER);
  frameRate(30);
  
  for(int i=0; i<jack.length; i++){
jack[i]=new Creature();
}
}

void draw() {

  if(mouseX<width/4){
    background(17, 98, 167);
  }else if (mouseX<2*width/4){
    background(255,169,8);
  }else if (mouseX<3*width/4){
    background(2,214,109);
  }else {
    background(141,4,201);
  }

 for(int i=0;i<jack.length;i++){
  jack[i].move();
  jack[i].bounce();
  jack[i].display();
}
}

void mousePressed() {
  println("Hello World! We are stupid...");
}

class Creature{
  
  
float xpos;
float ypos;
float w;
float h;
float Xspeed;
float Yspeed;
int cS; //creature size

Creature(){                     //constructor 1
  xpos=random(100,width-100);
  ypos=random(100,height-100);
  w=10;
  h=70;
  Xspeed=random(-5,5);
  Yspeed=random(-5,5);
  cS=9;//creature size
}
void move() {
    //change the x and y position of the creature by speed
    xpos=xpos+Xspeed;
    ypos=ypos+Yspeed;
  }


void bounce() {
  // reverse speed at edges
  if (xpos > width-2*cS || xpos<50/9*cS) {
    Xspeed = -1*Xspeed;
  }

  if (ypos > height-(6*cS+5) || ypos<0+100/9*cS) {
    Yspeed = -1*Yspeed;
  }
}


  void display() {
    //legs
    fill(108, 69, 11);
    noStroke();
    triangle(xpos+cS, ypos+3*cS, xpos+cS, ypos+7*cS,xpos+3*cS, ypos+7*cS);
    triangle(xpos-cS, ypos+3*cS, xpos-cS, ypos+7*cS, xpos-3*cS, ypos+7*cS);
    
    stroke(40, 57, 39);
    fill(21, 103, 18);
    for(int i=0;i<6.1*cS;i+=6*cS){
    //arms
    rect(xpos-4*cS+i, ypos-2*cS, 2*cS, 5*cS, 0.7*cS);
       }
    //body
    stroke(40, 57, 39);
    fill(95, 209, 4);
    ellipse(xpos, ypos, 6*cS, 10*cS);
    //hat
    stroke(0);
    fill(random(255), random(255), random(255));
    triangle(xpos, ypos-12*cS, xpos-2*cS, ypos-8*cS, xpos+2*cS, ypos-8*cS);
    //head
    stroke(247, 161, 0);
    fill(255, 202, 103);
    ellipse(xpos, ypos-6*cS, 6*cS, 6*cS);
    stroke(75);
    //eyes
    for(int i =0;i<2.1*cS;i+=2*cS){
    strokeWeight(3);
    stroke(0);
    fill(xpos, xpos, xpos);
    ellipse(xpos+-cS+i, ypos-7*cS, cS, cS);
    }
    //mouth
    stroke(157, 10, 88);
    fill(216, 2, 117);
    ellipse(xpos, ypos-4.5*cS, 3*cS, cS);
    //nose
    noStroke();
    fill(198, 110, 22);
    ellipse(xpos, ypos-6*cS, 0.5*cS, 0.5*cS);
  }
}


