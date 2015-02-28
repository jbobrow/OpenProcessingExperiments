
boolean flipFlop = false;
int eyeBallDiam = 30;

float randNum;
float randNum2;
float randNum3;
float randNum4;
float randNum5;
float randColor;
float randColor2;
float randColor3;
float randColor4;


void setup (){
  size(300,300);
}
void draw(){
  
  if (flipFlop == false){
  eyeBallDiam = 30;
}
else{
  eyeBallDiam = 35 ;
}

translate(150,150);
noStroke();
fill(250,218,212);
ellipse(0,0,randNum,randNum2);
fill(87,146,222);
ellipse(-37.5,-15,15,eyeBallDiam);
ellipse(37.5,-15,15,eyeBallDiam);
fill(255,255,255);
ellipse(-37.5,-15,10,10);
ellipse(37.5,-15,10,10);
fill(1,3,5);
ellipse(-37.5,-15,5,5);
ellipse(37.5,-15,5,5);
fill(237,189,189);

fill(randColor3,randColor2,randColor);
rectMode(CENTER);
rect(0,-100,-15,-45);

fill(0,0,0);
arc(0,randNum3,eyeBallDiam,40,-20, PI / 2.0);
fill(255,255,255);
fill(237,189,189);
triangle(0,-10,-10,40,10,40);
fill(255,45,3);
ellipse(0,80,25,20);
fill(255,255,255);
rect(-5,55,5,7);
rectMode(CENTER);
rect(5,55,5,7);
rectMode(CENTER);
fill(250,218,212);
ellipse(-77,-15,-15,25);
ellipse(77,-15,-15,25);
noFill();

stroke(3,0,0);
ellipse(-37,-14,-35,35);
noFill();
stroke(3,0,0);
ellipse(37,-14,-35,35);
line(-20,-15,20,-15);
fill(3,0,0);
line(-78,-28,-55,-17);
fill(3,0,0);
line(78,-28,55,-17);

}

void keyPressed (){
  flipFlop =! flipFlop;
  randNum = random (150,150);
  randNum2 = random (100,200);
  randNum3 = random (0,70);
  randColor = random (0,255);
  randColor2 = random (73,173);
  randColor3 = random (123,222);
}


