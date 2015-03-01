
//Import 'minim' library files
import ddf.minim.*;

//Global Variables
int stepX;
int stepY;

//Declare global variables
Minim minim;
AudioPlayer bells;

float k = 1.33;
void setup() {
  size(800, 600);
  background(#900D0D);
  colorMode(HSB);
  strokeWeight(0.01);
  minim = new Minim(this);
  bells = minim.loadFile("bells.wav");
   bells.play();
 
}

void draw() {
  translate(width/2, height/2);
  scale(200, 200);
  float t = frameCount / 20.0;
  float x = cos (k * t) * sin(t);
  float y = cos (k * t) * cos(t);
  stroke (255);
  point(x, y);
  //mouse input
  stepX = mouseX+20;
  stepY = mouseY+20;
  
}

//keyPressed()
void keyPressed() {
  if (key=='s' || key == 'S') saveFrame("screenshot.png");
}

