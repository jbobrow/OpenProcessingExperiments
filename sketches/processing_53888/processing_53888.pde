
/* This is a template for bus-tops contest on OpenProcessing.org.
*  Bus-Tops (http://bus-tops.com) is a public art project
*  in London where we have placed 30 monochromatic red LED screens
*  on the roofs of bus shelters across the city. Sketches from
*  OpenProcessing Collections will be selected to be exhibited
*  on these screens.
*  For contest information and example sketches and submission:
*  http://www.openprocessing.org/collections/?collectionID=1337
*/
 
float angle = 10;   
float aVelocity = 0.05;
float aAcceleration = 0.01;

PVector location;
PVector velocity;

public void setup() {
 //do not change, this is fixed for LED screens.
size(512, 160); 
//do not change, this is the refresh rate of LEDs.
frameRate(8);   
background(0); 
location = new PVector(0,100);
velocity = new PVector(10,10);

}
 
void draw() {
//keep background black (LEDs are brightness based)
// stroke(255,0,0); //LEDs are on the scale of red
// fill(255,0,0);   //LEDs are on the scale of red
//----DO WHATEVER YOU LIKE BELOW-----
//(do not make it interactive, since people won't be able to use mouse/keyboard on a bus stop----


float amplitude =49;

float a = amplitude* sin(angle);
float b = amplitude* cos(angle);
angle += aVelocity;

location.add(velocity);
if((location.x>512)||(location.x<=0)){
  velocity.x = velocity.x*-1;
}
if((location.y>120)||(location.y<=0)){
  velocity.y = velocity.y*-1;
}

pushMatrix();  
fill(255,0,0);
translate(location.x,location.y);
rotate(angle);
ellipse(a,b+1,a,b+10);
popMatrix();

pushMatrix(); 
fill(0);
translate(width/3,height/3-10);
rotate(angle);
ellipse(b,a,10,10);
popMatrix();

pushMatrix(); 
fill(0);
translate(width/2,height/2-10);
rotate(angle);
ellipse(b,a,10,10);
popMatrix();

pushMatrix(); 
fill(0);
translate(width*2/3,height*2/3-10);
rotate(angle);
ellipse(b,a,10,10);
popMatrix();


pushMatrix(); 
fill(0);
translate(width/3+10,height/3+70);
rotate(angle);
ellipse(b,a,10,10);
popMatrix();

pushMatrix(); 
fill(0);
translate(width/2+35,height/2+70);
rotate(angle);
ellipse(b,a,10,10);
popMatrix();

aVelocity += aAcceleration;
angle += aVelocity;

}  


