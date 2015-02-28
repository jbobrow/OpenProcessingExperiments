
//Song of the flower
import ddf.minim.*;
PImage blue;

Minim minim;
AudioSample Christmas;

void setup() {
  size(800, 600);
  blue = loadImage("blue.jpg");
  minim = new Minim(this) ;
  Christmas = minim.loadSample("Christmas.wav");
}

void draw() {
 background(700);
 image( blue, 0, 0, 800, 600);
 stroke(mouseX,mouseY, 50);
  fill(mouseX,mouseY, 75);
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount /-200.0);
  star(0, 0, 5, 70, 3); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.3, height*0.4);
  rotate(frameCount /200.0);
  star(0, 0, 5,170,3); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / 200.0);
  star(0, 0, 5, 60, 3); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.3, height*0.4);
  rotate(frameCount /-200.0);
  star(0, 0, 5,100,3);
  popMatrix();
  

}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

 


