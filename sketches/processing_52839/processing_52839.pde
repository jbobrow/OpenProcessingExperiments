
import processing.opengl.*;



Bloem blad;

float inc = 0.0;


void setup() {
  setParameters();
  makeControls();

  size(500, 400);
  background(0);
  smooth();


  blad = new Bloem();
  noStroke();
}


void draw() {
  
  background(0);
  float angle = radians(hoek);
  // println("angle " + angle);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < 10; i++) {
    println(angle);
    blad.display(0, afstand, aantal, angle);
    rotate(PI/4);
  }
}








