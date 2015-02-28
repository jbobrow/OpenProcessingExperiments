
import processing.pdf.*;
   
int x=0;
   
float eyeBallDiam= 20;
float whiteeye = 193;
float whiteeye2 = 90;
float eyeline =241;
float eyeline2=241;
float mouthR=230;
float mouthB=80;
float mouthG=20;
float tonguemove=141;
float tongueline=139;
float tongueR=232;
float tongueG=115;
float tongueB=164;
float liplift=100;
float jawlift=45;
   
void setup(){
  size(4050,5150);
  beginRecord(PDF, "kermit.pdf");
  background(180,8,58);
  translate(270.875,30);
  noStroke();
  repeatShape();
  endRecord();
}
   
void draw(){
   
}
   
void makeShape(){
fill(60,206,68);
noStroke();
ellipse( 139, 129, 226, 160);
scale(1, -1);
//translate(0,-height);
smooth();
triangle(39, 133, 237, 133, 150, 30);
smooth();
//eyeball
fill(255, 255, 255);
//right eyeball
ellipse(whiteeye, 240, 80, 60);
//left eyeball
ellipse(whiteeye2, 240, 80, 60);
//pupils
fill(0,0,0);
ellipse(190, 240, eyeBallDiam, eyeBallDiam);
ellipse(90, 241, eyeBallDiam, eyeBallDiam);
//mouth
fill(mouthR,mouthG,mouthB);
triangle(57, 133, 220, 133, 147, 50);
//tongue
fill(tongueR, tongueG, tongueB);
ellipse(tonguemove,123, 68, 90);
//translate(145, 135);
fill(60,206,68);
ellipse(138,165, 180,liplift);
fill(229,67,157);
rect(tongueline,100,5,15,40);
stroke(0,0,0);
strokeWeight(6);
line(70,eyeline,112,eyeline);
stroke(0,0,0);
strokeWeight(6);
line(170,eyeline2,210, eyeline2);
scale(1, -1);
  
  
  
   
   
     
}
   
void repeatShape(){
  for (int i=0; i < 216; i++){
    println("MEH" + i);
    makeShape();
    translate(293.75,0);
     x++;
    if (x==12){ //rows
      x=0;
      translate(-3525,300);
    }
  //-3524
   whiteeye = random(195, 215);
   whiteeye2= random(65,90);
   eyeline = random(241,300);
   eyeline2 = random(241,300);
   mouthR=random(10,255);
   mouthG=random(47,255);
   mouthB=random(90,255);
   tongueline=random(120,130);
   tongueR=random(200,255);
   tongueG=random(100,255);
   tongueB=random(20,255);
   jawlift= random(50,80);
   liplift=random(90,135);
   tonguemove=random(120,140);
   eyeBallDiam=random(10,40);
  }
}
