

float angle = 360;
 
void setup() {
  size(600, 600);
}
 
void draw() {
 
  smooth();
  strokeWeight(2);
  background(500,500);

float x=5;
float y=100;
float z=15;
float ne=250;
float limbs=225;
float haandfe=10;

fill(242,7,35);
ellipse(mouseX +2.5*y,mouseY +y,y,y); //head

fill(14,155,36);
ellipse(mouseX +ne,mouseY +y+65, 6*x, 6*x); //neck 1
ellipse(mouseX +ne,mouseY +y+87, z, z); //neck 2
line(mouseX +limbs-10,mouseY +(limbs*2)-10,mouseX + 2.3*y, mouseY +346); //leg
line(mouseX +limbs+60,mouseY +(limbs*2)-10,mouseX + 2.7*y,mouseY + 346); //leg
line(mouseX +limbs-25,mouseY +limbs,mouseX +1.4*y,mouseY +limbs); //arm
line(mouseX +limbs+75,mouseY +limbs,mouseX +3.6*y,mouseY +limbs); //arm
line(mouseX +1.4*y,mouseY +limbs,mouseX +1.4*y,mouseY +2.6*y); //forearm
line(mouseX +3.6*y,mouseY +limbs,mouseX +3.6*y,mouseY + 1.9*y); //forearm

fill(15,15,15);
ellipse(mouseX +14*haandfe,mouseY +26*haandfe,haandfe,3*haandfe); //hand
ellipse(mouseX +36*haandfe,mouseY +19*haandfe,haandfe,3*haandfe); //hand

fill(14,155,36);
ellipse(mouseX +2*y,mouseY +45*x,z,z); //arm joint
ellipse(mouseX +3*y,mouseY +45*x,z,z); //arm joint
ellipse(mouseX +2.3*y,mouseY +3.5*y,z,z); //leg joint
ellipse(mouseX +2.7*y,mouseY +3.5*y,z,z); //leg joint

fill(15,15,15);
ellipse(mouseX +2.1*y,mouseY +4.4*y,45,z); //foot
ellipse(mouseX +2.9*y,mouseY +4.4*y,45,z); //foot

fill(242,7,35);
rect(mouseX +2*y,mouseY +z*13,y,z*10); //body

fill(15,15,15);
rect(mouseX +238,mouseY +25*x,z+10,y/10); //mouth
triangle(mouseX +2*y,mouseY +345,mouseX +2.5*y,mouseY +2.4*y,mouseX +3*y,mouseY +345); //belly
ellipse(mouseX +2.5*y,mouseY +y-30,y-30,y-60); //hat


}



