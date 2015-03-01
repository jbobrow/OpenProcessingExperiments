

//starting code from lina berzhaner

color[] beach={#00B3B3,#008080,#1AE6E6,#009999,#33FFFF};
color[]palette=beach;


Oscillator[] oscillators = new Oscillator[10];
 
void setup() {
  size(600,600);
  background(150);
  smooth();
   
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }
  //background(255);
  //beginrecord(pdf,"cool_circles.pdf");
}
 
void draw() {
  //background(255);
   
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].oscillate();
    oscillators[i].display();
  }
}
class Oscillator {
  PVector angle;
  PVector velocity;
  PVector amplitude;
  PVector acceleration;
   
  Oscillator() {
    angle = new PVector();
    velocity = new PVector(random(-0.03,0.03),random(-0.03,0.03));
    amplitude = new PVector(random(width),random(height));
    acceleration = new PVector(random(-.01,.01),random(-0.01,0.01));
  }
void oscillate() {
  angle.add(velocity);
}
 
void display() {
  float x = cos(angle.x)*amplitude.x;
  float y = cos(angle.y)*amplitude.y;
   
  pushMatrix();
  translate(width/2,height/2);
  stroke(0);
  //fill(265,5);
  fill(palette[int(random(1,5))]);
  line(0,0,x/2,y/2);
  ellipse(x/2,y/2,100,100);
  //triangle(30, 75, 58, 360, 86, 75);
  fill(150);
 
  popMatrix();
}
 
}
//void mouseClicked(){
  
  //endRecord();
  //noLoop();
//}



