
 // reference code borrowed from Minsung Kwak : http://www.openprocessing.org/sketch/70194

int rad = 50;
int x = 10;
float angle = 1;
float speedX = 4;
 
PImage img;

void setup(){
 size(700, 500);
  noStroke();
  smooth();
   img = loadImage("theater2.jpg");
}
 
 
void draw(){
   image(img,0,0);

   
  x += speedX;
   
  if(x >  690 || x < 7) {
    speedX*=-1;
  }
   
   angle += radians(7);
   float y = height/2 + cos(angle) * rad;
   ellipse(x,y,200,200);
   fill(225,225,225,70);
  
    
      
  }



