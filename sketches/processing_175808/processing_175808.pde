
import processing.pdf.*;
JitterBug[] bugs = new JitterBug[40];
int a=0,u=0;
float q=100;
void setup() {
  
  background(#DBFCEB);
  size(900,300);
  smooth();
  //beginRecord(PDF, "everything6.pdf");
  for (int i = 0; i < bugs.length; i++) {
float x = random(width);
float y = random(height);
float r = random(5,40);
bugs[i] = new JitterBug(x, y, r);
}
}

void draw() {
 
 for (int i = 0; i < bugs.length; i++) {
bugs[i].move();
bugs[i].display();
}}
class JitterBug {
float x;
float y;
float diameter;
float speed = 2.5;
JitterBug(float tempX, float tempY, float tempDiameter) {
x = tempX;
y = tempY;
diameter = tempDiameter;
}
void move() {
x += random(-speed, speed);
y += random(-speed, speed);
}
void display() {
strokeWeight(random(0.1,1));  
stroke(50,40,random(0,50)); 
//noStroke();

if(keyPressed)
{if(key=='w')q=(random(0,250));
if(key=='q')background(#DBFCEB);}

fill(random(200,255),q,random(0,255));
ellipse(x, y, diameter, diameter);
/*if(u==254) a=0;
if(u==0)a=1;
if(u<255 && a==1)
  u+=1;
else u-=1;
if(u>0 && a==0)
  u-=1;
else u+=1;*/
    
}}



