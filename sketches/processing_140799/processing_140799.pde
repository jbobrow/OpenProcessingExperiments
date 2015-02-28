
//declare global variables

float eyeSize;
float pupilSize;
float mouthSize;
int noseWidth = -5;
int noseLength = 7;
int rightearSize = 20;
int leftearSize = 20;
int leftbrowUp = 20;
int rightbrowUp = 20;
float faceColor [] = {0,255,0,255,0,255};
float faceColorR =0;
float faceColorG =0;
float faceColorB =0;
float earColor [] = {0,255,0,255,0,255};
float earColorR =0;
float earColorG =0;
float earColorB =0;
float hairColor [] = {0,255,0,255,0,255};
float hairColorR =0;
float hairColorG =0;
float hairColorB =0;
float browColor [] = {0,255,0,255,0,255};
float browColorR =0;
float browColorG =0;
float browColorB =0;
float noseColor [] = {0,255,0,255,0,255};
float noseColorR =0;
float noseColorG =0;
float noseColorB =0;
float pupilColor [] = {0,255,0,255,0,255};
float pupilColorR =0;
float pupilColorG =0;
float pupilColorB =0;
float eyeColor [] = {0,255,0,255,0,255};
float eyeColorR =0;
float eyeColorG =0;
float eyeColorB =0;


boolean clicked = false;

//runs once
void setup(){
  size(300,300);
  background(255,255,255);
}
void keyPressed() {
  clicked =! clicked;

if (clicked == false){
  eyeColorR = random (eyeColor[0], eyeColor[1]);
  eyeColorG = random (eyeColor[2], eyeColor[3]);
  eyeColorB = random (eyeColor[4], eyeColor[5]);
  pupilColorR = random (pupilColor[0], pupilColor[1]);
  pupilColorG = random (pupilColor[2], pupilColor[3]);
  pupilColorB = random (pupilColor[4], pupilColor[5]);
  noseColorR = random (noseColor[0], noseColor[1]);
  noseColorG = random (noseColor[2], noseColor[3]);
  noseColorB = random (noseColor[4], noseColor[5]);
  browColorR = random (browColor[0], browColor[1]);
  browColorG = random (browColor[2], browColor[3]);
  browColorB = random (browColor[4], browColor[5]);
  hairColorR = random (hairColor[0], hairColor[1]);
  hairColorG = random (hairColor[2], hairColor[3]);
  hairColorB = random (hairColor[4], hairColor[5]);
  faceColorR = random (faceColor[0], faceColor[1]);
  faceColorG = random (faceColor[2], faceColor[3]);
  faceColorB = random (faceColor[4], faceColor[5]);
  earColorR = random (faceColor[0], faceColor[1]);
  earColorG = random (faceColor[2], faceColor[3]);
  earColorB = random (faceColor[4], faceColor[5]);
  eyeSize = random (5,40);
  pupilSize = random (5,15);
  mouthSize = random (15,50);
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
  background(255,255,255);
  translate(150,150);
//hair2
pushMatrix();
translate(-60,-50);
fill(hairColorR,hairColorG,hairColorB);
rect(0,0,125,150);
popMatrix();
//face
noStroke();
fill(faceColorR,faceColorG,faceColorB);
ellipse(0,0,100,150);
//right ear
pushMatrix();
translate(48,0);
fill(earColorR,earColorG,earColorB);
ellipse(0, 0, 30, rightearSize);
popMatrix();
//left ear
pushMatrix();
translate(-48,0);
fill(earColorR,earColorG,earColorB);
ellipse(0, 0, 30, leftearSize);
popMatrix();
//left eye
fill(eyeColorR,eyeColorG,eyeColorB);
ellipse(25,-25,eyeSize,eyeSize);
//left pupil
fill(pupilColorR,pupilColorG,pupilColorB);
ellipse(25,-25,pupilSize,pupilSize);
//nose
pushMatrix();
fill(noseColorR,noseColorG,noseColorB);
translate(0,0);
triangle(0,-5,-5,7,7,7);
popMatrix();
//big nose
pushMatrix();
fill(noseColorR,noseColorG,noseColorB);
translate(0,0);
triangle(0,noseWidth,noseWidth,noseLength,noseLength,noseLength);
popMatrix();
//right eye
fill(eyeColorR,eyeColorG,eyeColorB);
ellipse(-25,-25,eyeSize,eyeSize);
//right pupil
fill(pupilColorR,pupilColorG,pupilColorB);
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
fill(hairColorR,hairColorG,hairColorB);
rect(0,0,126,50);
//right brow
pushMatrix();
translate(0, 5);
fill(browColorR,browColorG,browColorB);
rect(20, rightbrowUp, 30, 10);
popMatrix();
//left brow
pushMatrix();
translate(0, 5);
fill(browColorR,browColorG,browColorB);
rect(70, leftbrowUp, 30, 10);
popMatrix();

}






