
boolean flipFlop = false;
int eyeballDiam;
float randNum;
float randNum2;
float randColor;
float randColor2;

void setup(){
  size(500,500);
}
 
void draw(){
  background(randColor2,randColor2,randColor); 
  if (flipFlop == false) {
    eyeballDiam = 50;
  }
  else{
    eyeballDiam = 59;
  }
 //Horns
 pushMatrix();
 translate(140,80);
 fill(24,randColor2,25);
 triangle(30, 75, 58, 20, 86, 75);
 popMatrix();
 //Horns2
  pushMatrix();
 translate(240,80);
 fill(randColor2,randColor,randColor2);
 triangle(30, 75, 58, 20, 86, 75);
 popMatrix();
  //Head
fill(24,randColor,25);
noStroke();
ellipse(250,250,250,250);
//eyelid
fill(randColor,randColor,randColor2);
ellipse(247,230,150,200);
fill(24,randColor,25);
ellipse(247,240,150,200);
//Eye
translate(100,150);
fill(255,255,255);
ellipse(150,50,randNum2,randNum2);
fill(0,0,0);
ellipse(150,50,randNum,randNum);
//Pupil
translate(50,75);
fill(16,125,196);
ellipse(100,-30,eyeballDiam,eyeballDiam);
fill(255,183,75);
//Mouth
fill(randColor,randColor,randColor2);
arc(88,89, 80, 80, 0, PI/1.0);
}
 
void keyPressed(){
  flipFlop =! flipFlop;
  randNum = random(70,80);
 randNum2 = random(83,100);
 randColor = random (50,250);
 randColor2 = random (50,100);
}


