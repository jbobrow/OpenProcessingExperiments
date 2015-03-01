
/* @pjs preload="rallos.png";
@pjs preload="THEOtools.jpg";
 */

PImage theo,rallos;
float x, y;
float v = 3;

void setup(){
  size (400,950);
  theo = loadImage("THEOtools.jpg");
  rallos = loadImage ("rallos.png");
  imageMode(CORNER);
  image(theo,0,0,width,height);
  y = height; 
  image(rallos,0,0,300,50);
  
  
}

void draw () {
   
  image(theo, 0,0,width,height);
  
  y = y + random(-v,+v);
  
  if((y<900)||(y>width)){
  image(rallos, 0,0,width,y);
  }
  
}


