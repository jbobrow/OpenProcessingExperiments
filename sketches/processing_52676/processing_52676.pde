
float Dir;
float Bx; //bot's x location
float By; //bot's y location

float targetX, targetY;
float easing = 0.05;

void setup() {
  size (500,500);
  smooth ();
  //noStroke();
}


void draw(){

  background(255);

targetX = mouseX;
targetY = mouseY;

float dx = targetX - Bx;

if (abs (dx) > 1) {
  Bx += dx * easing;
}

targetY = mouseY;
float dy = targetY - By;
if (abs(dy) > 1) {
  By += dy * easing;
}

bot(Bx,By);

//botBody(50,50,PI);

//botFwheels(

//botRwheels(

}

void bot(float x,float y){
  pushMatrix();
  translate(x, y);
  float a = atan2(mouseY-y,mouseX-x);
  rotate(a);
  //rectMode(CENTER);
  botBody(0,0);
  popMatrix();

}


void botBody (float x,float y){

pushMatrix();
translate(x,y);
//pushMatrix();
rotate(-PI/2);
rectMode(CENTER);
rect(0,0,30,60);
beginShape(LINES); //wheel axles
  vertex(-18,25);
  vertex(-15,25);
  vertex(15,25);
  vertex(18,25);
  vertex(-18,-25);
  vertex(-15,-25);
  vertex(15,-25);
  vertex(18,-25);
 endShape();
 
 
beginShape(TRIANGLES); //DIRECTION MARKER
 vertex(0,25);
  vertex(-5,20);
  vertex(5,20);
endShape();

botFwheel(-18,25,-1);
botFwheel(18,25,1);
botRwheels(0,-25,1);  
popMatrix();
//popMatrix();

}


void botFwheel(float x,float y,float RL){
  pushMatrix();
  translate(x, y);
  //TODO - notworking yet
  //rotate wheels to get them to point in the direction you want
  //float a = atan2(mouseY-y, mouseX-x);
  //rotate(a);
  rectMode(CENTER);
  rect(5*RL,0, 10*RL, 20);
  popMatrix();
}

void botRwheels(float x, float y, float Dir){
  pushMatrix();
  translate(x,y);
  rectMode(CENTER);
  rect(-24,0,10,20);
  rect(24,0,10,20);
  popMatrix();
  
}

