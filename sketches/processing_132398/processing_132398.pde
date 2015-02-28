
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallDiam;
int mouthWidth;
int hairColor;
void setup(){
size(300,300);
background(0,155,200);
//repositions 0 x,y
}

void draw (){
  if (flipFlop == false){
    eyeBallDiam = 10;
    mouthWidth = 70;
    hairColor = 160;
    background(79,80,90);
  }
  if (flipFlop == true){
    eyeBallDiam = 40;
    mouthWidth = 35;
    hairColor = 26;
    background(20,85,140);
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
   translate(150,150);
   
rectMode(CENTER);
noStroke();
//hair
fill(hairColor,hairColor,hairColor);
ellipse(-75,10,50,50);
ellipse(75,10,50,50);
ellipse(85,-35,70,70);
ellipse(-85,-35,70,70);
noStroke();
//head
fill(245,245,220);
ellipse(0,0,150,150);
//eyes
fill(199,21,133);
ellipse(-50,0,eyeBallDiam,eyeBallDiam);
ellipse(50,0,eyeBallDiam,eyeBallDiam);
fill(0);
ellipse(50,0,30,30);
ellipse(-50,0,30,30);
//mouth 
fill(36,25,130);
ellipse(0,50,mouthWidth,30);
fill(245,245,220);
ellipse(0,40,95,30);
}



