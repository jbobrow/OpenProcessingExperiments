

import ddf.minim.*;
Minim minim;
AudioSample holly;
PImage tree;
void setup() {
  minim = new Minim(this);
  holly = minim.loadSample("holly.wav");
  size(800, 600);
  tree = loadImage("tree.JPG");
}

void draw() {
  image(tree, 0, 0);
  
  fill(random(255),0,0);
  textSize(38);
  text("Merry Christmas!",width/5.5, 400);

 pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 50.0);  
  //star(0, 0, 80, 100, 40); 
  popMatrix();
  
  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / -100.0);
  star(0, 0, 20, 50, 5); 
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
 
  
void keyPressed() { 
  if ( key == 'h' ) holly.trigger();
  
}
  

