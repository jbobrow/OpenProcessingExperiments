
/*
Wheel of Life
Meditation on Movement
by David Muslimov

To 'activate' the image in order to stir our soul
A reminder that life is all movement at all levels

load images called circle, rims, and yama
circles rotate at different speeds,
clockwise and counter clockwise according
to X and Y position of mouse, 

rims fluctuate in color with random()
yama will be a static background

perhaps a vector-based, rebuilt wheel of life
with all sections moving and interactive (expandable sections?)
would be really cool; making modern visions of mandalas, gods, etc

image from--
http://tibettalk.wordpress.com/2007/11/01/the-tibetan-wheel-of-life/
*/

PImage circle1crop;
PImage circle2crop;
PImage circle3;
PImage rims;
PImage yama;
float h, m, s;
float a, b, c;
 

void setup(){
  
  


  size(450,650);
  imageMode(CENTER);
yama = loadImage("yama.png");
image(yama,225,275,width*1.50,height*1.45);
}



void draw(){

  
  circle1crop = loadImage("circle1crop.png");
  circle2crop = loadImage("circle2crop.png");
  circle3 = loadImage("circle3.png");
  rims = loadImage("rims.png");
  
 
  
  h = hour();
  m = minute();
  s = second();
  
  a = s * 6;
  pushMatrix();
  imageMode(CENTER);
  translate(width/2, height/2);
  
  rotate(radians(a));
 image(circle3,0,0,450,450);
  popMatrix();                 //End of symbolic six worlds
  
  pushMatrix();
  
  translate(225, 325);
  imageMode(CENTER);
  rotate(radians(-a));
  
  
 image(circle2crop,0,0,125,125);
  
  
  popMatrix();
  
   pushMatrix();
  imageMode(CENTER);
  translate(width/2, height/2);
  
  rotate(radians(a));
  image(circle1crop,0,0,75,75);
  popMatrix();
  
 //Phew! This ended up becoming a simple abstract clock,
 //but now that i have the images placed i can alter how they rotate
}
  
  
  

  



















