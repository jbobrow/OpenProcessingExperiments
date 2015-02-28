
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeColor;
int leftFoot;
int rightFoot;
int backGround;
int snow; 
int leftArm;
int rightArm;
int Xfootprints;
int Yfootprints;
int eyes;
int textColor;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);
}
 
void draw(){
  if (flipFlop == false){
    eyeColor = 0;
    leftFoot = 85;
    rightFoot = 85;
    backGround = 255;
    snow = 0;
    leftArm = -50;
    rightArm = 50;
    Xfootprints = 0;
    Yfootprints = 0;
    eyes = 20;
    textColor = 255;
  
  }
  
  if (flipFlop == true){
    eyeColor = 255;
    leftFoot = 90;
    rightFoot = 90;
    backGround = 0;
    snow = 15;
    leftArm = -60;
    rightArm = 60;
    Xfootprints = 40;
    Yfootprints = 10;
    eyes = 30;
    textColor = 0;

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
size(300,300);
background(backGround,backGround,255);
translate(150,150);

//hill
fill(255);
ellipse(0,240,400,300);

    textSize(19);
    fill(255,textColor,255);
    text("WOO!",-140,147);
    
//feet
noStroke();
fill(250,170,0);
ellipse(-30,leftFoot,40,10);
fill(250,170,0);
ellipse(30,rightFoot,40,10);

//body
fill(0,0,0);
ellipse(0,0,100,175);

//white belly and head
fill(255,255,255);
ellipse(0,0,75,150);
fill(0,0,0);
ellipse(0,-90,85,85);

//beak
fill(250,170,0);
triangle(-20,-80,20,-80,0,-55);

//eye balls
fill(255,255,255);
noStroke();
ellipse(-16,-95,eyes,eyes);
fill(eyeColor,0,eyeColor);
noStroke();
ellipse(-16,-91,12,12);

fill(255,255,255);
ellipse(15,-95,eyes,eyes);
fill(eyeColor,0,eyeColor);
ellipse(15,-91,12,12);

//snow
fill(255,255,255);
ellipse(100,-100,snow,snow);
ellipse(125,-20,snow,snow);
ellipse(95,50,snow,snow);
ellipse(-100,-110,snow,snow);
ellipse(-120,-10,snow,snow);
ellipse(-95,55,snow,snow);

//footprints
noStroke();
fill(225,225,255);
ellipse(-30,145,Xfootprints,Yfootprints);
ellipse(30,150,Xfootprints,Yfootprints);
ellipse(-30,115,Xfootprints,Yfootprints);
ellipse(30,120,Xfootprints,Yfootprints);

//arms
fill(0,0,0);
rotate(PI/8);
ellipse(leftArm,0,28,115);
rotate(-.75);
ellipse(rightArm,0,28,115);

//text

}


