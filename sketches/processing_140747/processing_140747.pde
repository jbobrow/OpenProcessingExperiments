
//declare global variables

int eyeSize = 15;
int pupilSize = 6;
int mouthSize = 20;
int noseWidth = -5;
int noseLength = 7;
int rightearSize = 20;
int leftearSize = 20;
int leftbrowUp = 20;
int rightbrowUp = 20;
boolean clicked = false;

//runs once
void setup(){
  size(300,300);
  background(255,255,255);
}
void keyPressed() {
  clicked =! clicked;

if (clicked == false){
  eyeSize = 15;
  pupilSize = 6;
  mouthSize = 20;
  noseWidth = -10;
  noseLength = 7;
  rightearSize = 40;
  leftearSize = 40;
  leftbrowUp = 50;
  rightbrowUp = 50;}
if (clicked == true){
  eyeSize = 30;
  pupilSize = 15;
  mouthSize = 40;
  noseWidth = -5;
  noseLength = 9;
  rightearSize = 20;
  leftearSize = 20;
  leftbrowUp = 20;
  rightbrowUp = 20;}
}
    
 //runs forever
void draw(){
  translate(150,150);
//hair2
pushMatrix();
translate(-60,-50);
fill(0,0,0);
rect(0,0,125,150);
popMatrix();
//face
noStroke();
fill(201,185,152);
ellipse(0,0,100,150);
//right ear
pushMatrix();
translate(48,0);
fill(201,185,152);
ellipse(0, 0, 30, rightearSize);
popMatrix();
//left ear
pushMatrix();
translate(-48,0);
fill(201,185,152);
ellipse(0, 0, 30, leftearSize);
popMatrix();
//left eye
fill(255,255,255);
ellipse(25,-25,eyeSize,eyeSize);
//left pupil
fill(0,0,0);
ellipse(25,-25,pupilSize,pupilSize);
//nose
pushMatrix();
fill(255,255,255);
translate(0,0);
triangle(0,-5,-5,7,7,7);
popMatrix();
//big nose
pushMatrix();
fill(255,255,255);
translate(0,0);
triangle(0,noseWidth,noseWidth,noseLength,noseLength,noseLength);
popMatrix();
//right eye
fill(255,255,255);
ellipse(-25,-25,eyeSize,eyeSize);
//right pupil
fill(0,0,0);
ellipse(-25,-25,pupilSize,pupilSize);
//big mouth
pushMatrix();
rotate(PI/-6.0);
translate(-15,20);
fill(255,255,255);
arc(10,10,mouthSize,mouthSize,0,PI+QUARTER_PI,OPEN); 
popMatrix();
//hair
translate(-60,-95);
fill(0,0,0);
rect(0,0,126,50);
//right brow
pushMatrix();
translate(0, 5);
fill(110,120,132);
rect(20, rightbrowUp, 30, 10);
popMatrix();
//left brow
pushMatrix();
translate(0, 5);
fill(110,120,132);
rect(70, leftbrowUp, 30, 10);
popMatrix();

}






