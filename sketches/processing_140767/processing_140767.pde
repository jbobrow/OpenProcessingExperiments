
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallDiam;
int mouthR;
int mouthG;
int mouthB;
int liplift;
int tongue;
int tongueline;
int eyeLine;
int eyeLine2;

  
void setup(){
size (300, 300);
background(165, 8, 58);
textSize(12);
}
   
void draw(){
 if (flipFlop == false){
 eyeBallDiam=20;
 mouthR=219;
 mouthG=0;
 mouthB=0;
 liplift=30;
 tongue=123;
 tongueline=60;
 eyeLine=-8;
 eyeLine2=8;
 
 }
  if(flipFlop==true){
    eyeBallDiam=40;
     mouthR=95;
     mouthG=1;
     mouthB=0;
     liplift=44;
     tongue=140; 
     tongueline=74;
     eyeLine=40;
     eyeLine2=53;

 }
 makeFace();
 smooth();
 text(keyPrompt,-145,-135);
 }
   
 void keyPressed(){
   flipFlop=! flipFlop;
   keyPrompt = ("");
 }
   
 void makeFace(){
  background(165,8,58);
  noStroke();
  translate(10,10);
    
//face shape 
fill(60, 206, 68);
noStroke();
ellipse( 139, 129, 226, 160);
scale(1, -1);
translate(0, -height);
smooth();
triangle(39, 133, 237, 133, 150, 30);
smooth();
   
   
//eyeball
fill(255, 255, 255);
ellipse(190, 239, 80, 60);
ellipse(90, 240, 80, 60);
   
   
//pupils
fill(0,0,0);
ellipse(190, 240, eyeBallDiam, eyeBallDiam);
ellipse(90, 241, eyeBallDiam, eyeBallDiam);
   
//mouth
fill(mouthR,mouthG,mouthB);
triangle(57, 133, 220, 133, 147, 50);
   
//tongue
fill(232, 115, 164);
ellipse(142, tongue, 68, 90);
translate(145, 135);
fill(60, 206, 68);
ellipse (-8, liplift , 180, 100);
translate(-85,-96);
fill(229, 67, 157);
rect(79, tongueline, 5, 16, 40);
   
   
//eye lines
pushMatrix();
stroke(0,0,0);
strokeWeight(6);
translate(120,211);
line(-12,eyeLine,30,eyeLine);
popMatrix();
   
translate(9,197);
pushMatrix();
stroke(0,0,0);
strokeWeight(6);
line(0,eyeLine2,45,eyeLine2);
popMatrix();
   
//Smile lines
pushMatrix();
stroke(13,157,38);
strokeWeight(4);
translate(148,-99);
line(-15,1,7,-7);
popMatrix();
strokeWeight(4);
translate(9,-99);
line(-6,0,-26,-7);
  
}
