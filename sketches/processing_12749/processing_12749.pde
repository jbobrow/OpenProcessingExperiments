
 // Assignment #3 part 2
 // Name: Emelie Curl
 // E-mail: ecurl@brynmwr.edu
 // Date: 09/22/10
 // This version of my drawing does not use variables
 // however it does generate many different ballerinas 
 // of different colors.
float x,y;
void setup() {
  size (500,500);
  smooth();
  background(255,218,185);
 x = random(1,500);
 y = random(1,500);
}
void draw(){
  float x, y, w, h;
   x=75;
   y=180;
   w=140;
   h=180;
   drawBallerina (x,y,w,h);
}   
 void drawBallerina(float x,float y,float w,float h){
  beginShape();
  curveVertex(75+x,180+y);
  curveVertex(75+x,180+y);
  curveVertex(72+x,162+y);
  curveVertex(72+x,120+y);
  curveVertex(70+x,110+y);
  curveVertex(62+x,102+y);
  curveVertex(55+x,90+y);
  curveVertex(12+x,75+y);
  curveVertex(0+x,65+y);
  curveVertex(20+x,72+y);
  curveVertex(50+x,80+y);
  curveVertex(54+x,70+y);
  curveVertex(55+x,62+y);
  curveVertex(60+x,55+y);
  curveVertex(82+x,78+y);
  curveVertex(90+x,60+y);
  curveVertex(60+x,30+y);
  curveVertex(80+x,40+y);
  curveVertex(95+x,58+y);
  curveVertex(80+x,30+y);
  curveVertex(92+x,45+y);
  curveVertex(100+x,60+y);
  curveVertex(103+x,62+y);
  curveVertex(105+x,56+y);
  curveVertex(106+x,53+y);
  curveVertex(106+x,52+y);
  curveVertex(105+x,50+y);
  curveVertex(103+x,47+y);
  curveVertex(103+x,43+y);
  curveVertex(105+x,40+y);
  curveVertex(103+x,38+y);
  curveVertex(104+x,37+y);
  curveVertex(105+x,35+y);
  curveVertex(107+x,35+y);
  curveVertex(112+x,35+y);
  curveVertex(113+x,37+y);
  curveVertex(114+x,38+y);
  curveVertex(117+x,39+y);
  curveVertex(118+x,43+y);
  curveVertex(117+x,44+y);
  curveVertex(118+x,47+y);
  curveVertex(120+x,48+y);
  curveVertex(118+x,50+y);
  curveVertex(117+x,52+y);
  curveVertex(116+x,53+y);
  curveVertex(113+x,55+y);
  curveVertex(112+x,57+y);
  curveVertex(112+x,60+y);
  curveVertex(110+x,70+y);
  curveVertex(90+x,93+y);
  curveVertex(100+x,110+y);
  curveVertex(95+x,112+y);
  curveVertex(86+x,120+y);
  curveVertex(80+x,120+y);
  curveVertex(75+x,165+y);
  curveVertex(75+x,180+y);
  endShape(CLOSE);
}
void mousePressed(){
   float x,y,w,h;
   x = random(1,500);
   y = random(1,500);
   w = 140;
   h = 180;
   drawBallerina (x,y,w,h);
   fill(random(255),random(255), random(255),random(255));
}

