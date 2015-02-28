
float speed = 20;
int diameter = 40;
float x;
float y;
float z;
float w;

void setup() { 
  size(700, 500);
  background(0);
  smooth();
  frameRate(80);
  x = width/2;
  y = height/2;
  z = width/2;
  w = height/2;
}

void draw() {
  x += random(-speed, speed);
  y += random(-speed, speed);
  z += random(-speed, speed);
  w += random(-speed, speed);
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  z = constrain(z, 0, width);
  w = constrain(w, 0, height);
  fill(0, random(200), 0, 72);
  noStroke();
  ellipse(x, y, diameter, diameter);
  fill(random(200), 0, 0, 72);
  ellipse(z, w, diameter, diameter);
}

void keyPressed() {
   if(key=='s') {
      save("circles.tif");
 }
}


