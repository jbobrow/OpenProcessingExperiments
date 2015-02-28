
float n, x;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  smooth();
  noStroke();
  fill(249, 193, 46, 100);

  translate( 175+ x, 175 + n);
  bezier(random(25, 30), 25, 125, 25, 125, 225, random (225, 230), 225);
  bezier(random(25, 30), 50, 125, 25, 125, 225, random (225, 230), 200);
  bezier(random(25, 30), 75, 125, 25, 125, 225, random (225, 230), 175);
  bezier(random(25, 30), 100, 125, 25, 125, 225, random (225, 230), 150);
  bezier(random(25, 30), 125, 125, 25, 125, 225, random (225, 230), 125);
  bezier(random(25, 30), 150, 125, 25, 125, 225, random (225, 230), 100);
  bezier(random(25, 30), 175, 125, 25, 125, 225, random (225, 230), 75);
  bezier(random(25, 30), 200, 125, 25, 125, 225, random (225, 230), 50);

  bezier(random(25, 30), 225, 125, 225, 125, random(25, 30), random (225, 230), 25);
  bezier(random(25, 30), 200, 125, 225, 125, random(25, 30), random (225, 230), 50);
  bezier(random(25, 30), 175, 125, 225, 125, random(25, 30), random (225, 230), 75);
  bezier(random(25, 30), 150, 125, 225, 125, random(25, 30), random (225, 230), 100);
  bezier(random(25, 30), 125, 125, 225, 125, random(25, 30), random (225, 230), 125);
  bezier(random(25, 30), 100, 125, 225, 125, random(25, 30), random (225, 230), 150);
  bezier(random(25, 30), 75, 125, 225, 125, random(25, 30), random (225, 230), 175);
  bezier(random(25, 30), 50, 125, 225, 125, random(25, 30), random (225, 230), 200);

  n = n + random(-1, 1);
  x = x + random(-1, 1);
}

  
