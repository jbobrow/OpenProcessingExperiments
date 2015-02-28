
//jahaira

boolean change = false;
String keyPrompt = "press any key";
float eyeSize = 25;
float eyeSizeHeight = 30;
float pupilWidth = 15;
float pupilHeight = 20;
float icingColor = 0;
float icingColor2 = 255;
float tongue1 = 255;
float tongue2 = 255;
float cherryR = 255;
float cherryB = 0;
float backgroundColor = 200;
float mouthWidth = 40;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);
}
 
void draw(){
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}
 
void keyPressed(){
eyeSize = random(25,35);
eyeSizeHeight = random(30,40);
pupilWidth = random(15,20);
pupilHeight = random(20,25);
icingColor = random(0,150);
icingColor2 = random(50,255);
tongue1 = random(100,255);
tongue2 = random(200,255);
cherryR = random(175,255);
cherryB = random(0,255);
backgroundColor = random(175,255);
mouthWidth = random(35,50);
   
  keyPrompt = ("");
}
 
void makeFace(){
background(255,backgroundColor,100);
rectMode(CENTER);
noStroke();
translate(150,150); 

//cupcake bottom
fill(80,200,160);
rect(0,70,120,120,15);
fill(100,220,180);
rect(0,70,90,100,0,0,15,15);
fill(120,240,200);
rect(0,70,70,80,15);
fill(140,255,220);
rect(0,70,40,60,15);

//icing three
fill(icingColor2,icingColor,200);
rect(0,-63,90,40,20);
//icing two
rect(0,-35,130,40,30);
//icing one
rect(0,0,160,50,30);

//cherry
fill(cherryR,0,cherryB);
ellipse(0,-95,50,50);
fill(255);
ellipse(-10,-105,15,15);

//eyes
fill(255);
ellipse(-20, -40,eyeSize,eyeSizeHeight);
ellipse(20, -40,eyeSize,eyeSizeHeight);
fill(0);
ellipse(-20,-35,pupilWidth,pupilHeight);
ellipse(20,-35,pupilWidth,pupilHeight);
//mouth
fill(0);
arc(0, -10, mouthWidth, 40, 0, HALF_PI+HALF_PI);
fill(tongue1,tongue2,50);
ellipse(0,5,20,10);
}
