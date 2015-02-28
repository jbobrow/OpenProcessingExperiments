
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeH;
int mouth;
int noseOne; 
int noseTwo;
int back;
int backTwo;
int head;
int hat;
int cheeks;
int chkc;
int top;
void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);
}
 
void draw(){
  if (flipFlop == false){
    eyeH = 30;
    mouth = 42;
    noseOne=32;
    noseTwo=222;
    back=52;
    backTwo=52;  
    head=255;
    hat=89;
    cheeks=10;
    chkc=90;
    top=246;
  }
  if (flipFlop == true){
   eyeH=60;
   mouth=52;
   noseOne=300;
   noseTwo=150;
   back=10;
   backTwo=125;
   head=215;
   hat=240;
   cheeks=20;
   chkc=0;
   top=10;
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
    //head
size(300,300);
background(backTwo,back,100);
translate(150,150);
ellipseMode(CENTER);
fill(255,head,255);
noStroke();
ellipse(0,0,145,150);
//eyes
fill(255);
stroke(0);
ellipse(-25,-25,20,eyeH);
ellipse(25,-25,20,eyeH);
fill(0);
ellipse(-25,-22,15,25);
fill(0);
ellipse(25,-22,15,25);
//nose
noStroke();
ellipseMode(CENTER);
fill(noseTwo,12,noseOne);
ellipse(0,0,30,30);
 
//mouth
fill(90);
stroke(0);
ellipse(0,mouth,72,40);
 
//mouth
fill(255,head,255);
stroke(255,head,255);
ellipse(0,25,65,20);
 
//hat
noStroke();
fill(161,hat,228);
triangle(0,-120,-54,-58,50,-60);
 
//hat on top
fill(top,243,5);
ellipse(0,-130,-30,30);
 
//cheeks
fill(247,chkc,175);
ellipse(-40,cheeks,25,25);
ellipse(40,cheeks,25,25);
}



