
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallDiam;
int eyeBallColorR;
int eyeBallColorG;
int eyeBallColorB;
int mouthHeight;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);
  smooth();
}
 
void draw(){
  if (flipFlop == false){
    eyeBallDiam = 50;
    eyeBallColorR = 103;
    eyeBallColorG = 30;
    eyeBallColorB = 119;
    mouthHeight = 30;
  }
  if (flipFlop == true){
    eyeBallDiam = 80;
    eyeBallColorR = 119;
    eyeBallColorG = 179;
    eyeBallColorB = 155;
    mouthHeight = 50;
  }
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}
 
void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}
void makeFace(){
  background(255);
  noStroke();
  rectMode(CENTER);
  // this is important - changes zero location for all future coordinates
  translate(150,150);
   
rectMode(CENTER);
fill(135,129,189);
noStroke();
rect(0,0,200,180);

fill(135,111,189);
ellipse(0,0,115,115);

fill(255);
ellipse(0,0,100,100);

fill(103,30,119);
ellipse(0,0,eyeBallDiam,eyeBallDiam);

fill(0,0,0);
ellipse(0,0,25,25);

fill(0,0,0);
ellipse(0,74,30,mouthHeight);

fill(135,129,189);
noStroke();
rect(-90,0,40,40);

fill(135,129,189);
noStroke();
rect(90,0,40,40);

fill(95,65,152);
noStroke();
rect(-103,0,5,25);

fill(95,65,152);
noStroke();
rect(103,0,5,25);

fill(0);
noStroke();
rect(0,-110,5,40);

fill(0);
noStroke();
rect(0,-98,40,5);

fill(0);
noStroke();
rect(0,-110,28,5);

fill(0);
noStroke();
rect(0,-120,20,5);

fill(255,205,3);
ellipse(0,-135,12,12);

fill(93,44,128);
ellipse(-85,-72,10,10);

fill(93,44,128);
ellipse(85,-72,10,10);

fill(93,44,128);
ellipse(0,-72,10,10);
}


