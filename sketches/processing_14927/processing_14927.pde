
Face myFace;

void setup() {

size(500,500);
smooth();
strokeWeight(15);
stroke(0,100);
frameRate(3);
myFace = new Face();
}

void draw() {
  
  background(226);
  
  myFace.drawLeftEye();
  myFace.drawRightEye();
  myFace.drawLeftPupille();
  myFace.drawRightPupille();
  myFace.drawNose();
  myFace.drawMouth();
  myFace.drawEyebrows(); 
}

class Face {
 
//left eye 

void drawLeftEye() {
  ellipse(100,100,110,55);
}
//right eye

void drawRightEye() {
ellipse(240,100,110,55);
}
//linke Pupille
void drawLeftPupille() {
int m=constrain(mouseX,80,120);

int n=constrain(mouseY,96,104);

ellipse(m,n,20,20);
}
//rechte Pupille

void drawRightPupille() {
int o=constrain(mouseX,220,260);

int p=constrain(mouseY,96,104);

ellipse(o,p,20,20);
}
//Nose
void drawNose() {
triangle(170,130,210,180,130,180);
}
//Mouth
void drawMouth() {
ellipse(170,230,70,15);
}
//Eyebrows
void drawEyebrows() {
rectMode(CENTER);
rect(100,40,70,0);
rect(240,40,70,0);
}

}

void mousePressed() {
ellipse(170,270,60,90);
}

