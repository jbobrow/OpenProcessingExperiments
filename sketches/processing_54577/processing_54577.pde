
import processing.opengl.*;
float ang = 0.0;
PFont font;
float y = 600;
float z = -200;
float x = 400;

void setup() {
  size(800, 600, OPENGL);
  font = loadFont("Verdana-Bold-48.vlw");
  textFont(font, 40);
  textMode(MODEL);
}

void draw() {
  background(0);

  rotateX(PI/4);

  stroke(0);
  strokeWeight(5);
  directionalLight(250, 207, 63, 0, -200, -200);

  textAlign(CENTER);

  text("STARWARS", x, y, z);
  text("A long Time Ago,", x, y+100, z);
  text("In a Galaxy far far away...", x, y+150, z);

  y--;
}


