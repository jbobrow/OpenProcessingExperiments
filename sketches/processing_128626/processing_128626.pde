

PImage img;
int x = 20;



void setup() {
  size(800, 600);  
 background (255,255,255); 
  img = loadImage("sun.jpg");
  
}

void draw() {
 
  while (x < 100){
  

  //image(img, 90, 80, width/2, height/2);
  
  image(img, random(0, width), random (0,height), random (0,width/2), random (0,height/2));
 
 
  x = x + 1;
}
}


