
//Outline [] outlines = new Outline
float angle = 0;   
float aVelocity = 0.05;
float aAcceleration = 0.01;


PVector location;
PVector velocity;

void setup() {
size(900,500);
background(#C4C5B5);
smooth();

location = new PVector(170,280);
velocity = new PVector(5,5);

//for (int i = 0; i < outline.length ; i++);{
//  ouline[i] = new Outline(
}
 
void draw() {
//for(int i = 0; i < outline.length ; i++);{
//  ouline[i].location();
//  outline[i].display();
float amplitude =130;

float a = amplitude* sin(angle);
float b = amplitude* cos(angle);
angle += aVelocity;

location.add(velocity);
if((location.x>850)||(location.x<=0)){
  velocity.x = velocity.x*-1;
}
if((location.y>400)||(location.y<=100)){
  velocity.y = velocity.y*-1;
}

pushMatrix();  
fill(0,54,99);
translate(location.x,location.y);
rotate(angle);
ellipse(a,b,a,b);
popMatrix();

pushMatrix(); 
fill(#C4C5B5);
translate(width/2,height/2);
rotate(-angle);
ellipse(b,a,b+10,3);
popMatrix();

aVelocity += aAcceleration;
angle += aVelocity;

}

//class Outline{
// float angle = 0;   
// float aVelocity = 0.05;
// float aAcceleration = 0.01;
 
// float amplitude =30;
// float a = amplitude * sin(angle);
// float b = amplitude * cos(angle);
// angle += aVelocity;
 
// Outline(  


