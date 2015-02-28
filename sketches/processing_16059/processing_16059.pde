

PImage yo; 
float x,y;   
float rot;   

void setup() {
  size(800,600);
  
  yo = loadImage("yo.tif");
  x = 0.0;
  y = width/2.0;
  rot = 1.0;
}

void draw() {
  background(0);
 // image (yo, 200,150, 400, 300);
translate(x,y);
  rotate(rot);
  image(yo, 100,10,300,200 ); 
 
  
  
  x += 1.0;
  rot += 0.02;
  if (x > width+yo.width) {
    x = -yo.width;
  }
}


