
PImage suburbs;
PImage batman;
PImage men;
PImage plane;
float angle = 0.0;

int jet = 250;
float x = -jet;
float speed = 1.5;
  
void setup() {
  size(450, 500);
  smooth();
  suburbs = loadImage("suburbs.png");
  batman = loadImage("batman.png");
  men = loadImage("pugil.png");
  plane = loadImage("plane.png");
}
  
void draw() {
  background(255);
  
  tint(mouseY, mouseX, 200);
  
  angle += 0.01;
  float s = sin(angle);
  float breath = map(s, -1,1, 400, 600);
  image(suburbs, 0, 0, breath, breath);
  
  pushMatrix();
  translate(40, 20);
  rotate(frameCount/30.0);
  image(batman, 0, 0);
  popMatrix();
  
  pushMatrix();
  scale(random(1.75), 1.75);
  image(men, random(40), random(40));
  popMatrix();
  
  x += speed;  // Increase the value of x
  if (x> width+jet){
    x = -jet;
  }
  image(plane, x, 300);

}




