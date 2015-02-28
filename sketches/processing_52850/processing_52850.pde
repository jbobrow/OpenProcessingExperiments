
import processing.opengl.*;

Bloem max;
Bloem blad;

float inc = 0.0;

void setup() {

  setParameters();
  makeControls();

  size(700, 650);
  background(0);
  smooth();

  blad = new Bloem();
  max = new Bloem();

  noStroke();
}


void draw() {

  background(0);

  float angle = radians(hoek);

  translate(width/2, height/2);

  for (int i = 0; i < 10; i++) {

    println(angle);

  
     blad.display(0, afstand, aantal, angle, color(0, 255, 0));

    max.display(0, grens, aantal, angle, color(250, 250, 0));
 
    rotate(PI/punten);
  }
}






