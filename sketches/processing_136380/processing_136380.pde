
//boolean flipFlop = false;
String keyPrompt = "press any key";

float noseWidth = 40;
float eyeBallDiam = 25;
float pupilDiam = 20;
float irisColorR = 0;
float irisColorG = 0;
float irisColorB = 0;
void setup(){
  size(300,300);
  background(#25E3DE);
  textSize(12);
}

void draw(){
  makeFace();
  text(keyPrompt,42,135);
}
void keyPressed(){
  noseWidth = random(35, 50);
  eyeBallDiam = random(10, 50);
  pupilDiam = random (15, 40);
  irisColorR = random(0,255);
  irisColorG = random(0,255);
  irisColorB = random(0,255);
  
  keyPrompt = ("");
}

void makeFace(){
  background(#FA3030);
  translate(150,150);
   
  rectMode(CENTER);
  noStroke();
  
  //ears
  fill(0);
  ellipse(-90,-65,60,60);
  ellipse(90,-65,60,60);
  
  //head
  fill(255);
  ellipse(0,0,220,190);
  
  //eyes
  fill(0);
  ellipse(-60,0,80,80);
  ellipse(60,0,80,80);
  ellipse(-60,0,50,40);
  ellipse(60,0,50,40);
  fill( irisColorR, irisColorG, irisColorB);
  ellipse(60,0,eyeBallDiam,eyeBallDiam);
  fill(irisColorR,irisColorG,irisColorB);
  ellipse(-60,0,eyeBallDiam,eyeBallDiam);
  fill(0);
  ellipse(-60,0, pupilDiam, pupilDiam);
  fill(0);
  ellipse(60,0, pupilDiam, pupilDiam);
  fill(255);
  ellipse(60,-2,5,5);
  ellipse(-60,-2,5,5);
  
  //nose
  fill(0);
  ellipse(1,30,noseWidth,20);
  fill(255);
  ellipse(4,29,4,2);
  
  //mouth
  strokeWeight(2);
  stroke(0);
  line(0,20,0,65);
  noFill();
  arc(-20,60,40,40,0,PI);
  arc(20,60,40,40,0,PI);
}












