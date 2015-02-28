
float a = 0;
float b = 0;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  loop();
  frameRate(15);
}

void draw() {
  translate(width/2, height/2);
  rotate(radians(a + b));
  strokeWeight(2);
  stroke(214, 149, 9);
  fill(0);
  ellipse(a, b, a/b, a/b);
  ellipse(b, a, b, a);  
  fill(random(a,b));
  ellipse(b, a, a + b, a/b);
  fill(random(a,b));
  ellipse(a, b, b, a);
  a += 3;
  b -= 0.05;
 
  if (a > width/2) {
    a = random(width);
    a = -a;
    b = a / b;
  }
  if (b > height/2) {
   a = 0;
   b = a / b;
 }
}

void keyPressed() {
  noLoop();
}

void mousePressed() {
  loop();
}

