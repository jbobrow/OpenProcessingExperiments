
int circleA= 100;
int circleB= 95;
int circleC= 95; 
int circleD= 130;
int circleE= 190;
int lineF= 230;
int lineG= 230;


void setup ()
{ 
  size(400,400);
  background(442);
}

void draw () {
  stroke(0);
 fill(210,302,103);
 ellipseMode(CENTER);
 ellipse(115,circleA,100,100); //head 
  
 fill(100,203,102);
 ellipseMode(CENTER);
 ellipse(90,circleB,25,25); //right eye
 
 fill(100,203,102);
 ellipseMode(CENTER);
 ellipse(140,circleC,25,25); //left eye
 
 fill(100,203,102);
 ellipseMode(CENTER);
 ellipse(115,circleD,20,20); 
 
 fill(203,102,321);
 rectMode(CENTER);
 rect(115,circleE,40,80); // body
 
 stroke(255);
 line(95,lineF,55,270); // legs
 line(135,lineG,175,270);

circleA = circleA-1;
circleB = circleB-1;
circleC = circleC-1;
circleD = circleD-1;
circleE = circleE-1;
lineF = lineF-1; 
lineG = lineG-1;
 
 
 }

