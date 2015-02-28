
float angle;
float jitter;
int x1, x2, x3, x4, x5;
int y1, y2, y3, y4, y5;

void setup() {
  size(650, 650);
  smooth();
  noStroke();
  fill(255);
  rectMode(CENTER);
  frameRate(30);
  x1 = (int)random(-200, 200);
  x2 = (int)random(-200, 200);
  x3 = (int)random(-200, 200);
  y1 = (int)random(-200, 200);
  y2 = (int)random(-200, 200);
  y3 = (int)random(-200, 200);
}

void draw() {
  background(102);

  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  if (second() % 10 == 0) {
   translate(random(-50, 50), random(-50, 50));
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  rect(x1, y1, mouseX, mouseY);
  ellipse(x2, y2, mouseX, mouseY);
  triangle(x3, y3, mouseY, mouseX, mouseX, mouseY); 
}


