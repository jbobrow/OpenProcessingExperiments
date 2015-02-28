
float x = 240;
float y = 360;
float headSize = 100;
PImage cake;

float easing = 0.02;

void setup() {
  size(480,720);
  smooth();
  background(245, 138, 57);
  cake = loadImage("cake.jpg");
  ellipseMode(RADIUS);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
background(cake);
  
  
//Torso
fill(240, 146, 111);
rect(x, y+180, 100, 600);

//Head
fill(252, 165, 133);
ellipse(x, y-200, headSize, headSize);

//Face
fill(255); //eye-whites
ellipse(x-65, y-220, headSize-90, headSize-90);
ellipse(x+65, y-220, headSize-90, headSize-90);
fill(255); //mouth
arc(x, y-180, headSize-30, headSize-30, radians(0), radians(180));
fill(255, 130, 134); //nose
ellipse(x, y-200, headSize-50, headSize-50);

fill(0); //pupils and eyebrows

rect(x-65, y-248, headSize-70, headSize-86);
rect(x+65, y-248, headSize-70, headSize-86);

x += (targetX - x) * easing*1.2; //pupils easing

ellipse(x-65, y-220, headSize-95, headSize-95);
ellipse(x+65, y-220, headSize-95, headSize-95);

}


