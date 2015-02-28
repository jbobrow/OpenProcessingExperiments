
Sphere [] spheres = new Sphere[100];
PImage violet;
Sphere p;



void setup() {
  size(1000, 334);
  violet = loadImage("Obstructed_Violet.jpg");
  smooth();
  frameRate(50);

  for (int i = 0; i < 100; i++) {
     spheres[i] = new Sphere(random(-1, 1), random(-1, 1));
  
                             
  }
} 

void draw() {
  imageMode(CORNER);
  image(violet, 0, 0, 1000, 334);
 for (int i = 0; i < 100; i++) {
     spheres[i].display();
                             
  }
  }
  
//Here I was trying to coordinate the 
//mouse with the spheres, but I couldn't get it to work
//  void mousePressed() {
//  spheres[currentSphere].start(mouseX, mouseY);
//  Sphere++;
//  if(currentSphere >= 100) {
//    Sphere = 0;
//  }
//  }


class Sphere {

  float angle = 0.0;
  float speed = 0.02;
  float radius = 50;
  float sx = 2.0;
  float sy = 2.0;
  float pct = 0.0;
  float distX;
  float distY;

Sphere(float myX, float myY ){
  sx = myX;
  sy = myY;
}

void display() {
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 30 + (cosval * radius) + width;
  float y = 30 + (sinval * radius) + height;
  float x2 = x + cos(angle * sx) * width - 30;
  float y2 = y + sin(angle * sy) * height - 30;
  angle += speed;
  
 

  stroke(220, 220, 220, 110);
  strokeWeight(1);
  fill(191);
  ellipse(x, y, 2, 2);

  stroke(220, 220, 220, 100);
  strokeWeight(2);
  ellipse(x2, y2, 6, 6);
  }
}



