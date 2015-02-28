
float t = 0;
float dt = 0.01;

void setup() {
  size(500, 400);
  smooth();
}

void draw() {
  pudar();
  acax();
  putar();
  
  t += dt;
}

void pudar() {
  fill(36, 211, 137, 10);
  noStroke();
  rect(0, 0, width, height); 
}

void putar() {
  int cx = width / 2;
  int cy = height / 2;

  fill(230, 200, 105, 15);
  noStroke();
  ellipse(cx, cy, 380, 340);
  fill(200, 200, 85, 140);
  stroke(188, 22, 240, 25);
  strokeWeight(7);
  ellipse(cx, cy, 300, 300);

  stroke(255, 255, 255, 20);
  strokeWeight(25);
  arc(cx, cy, 200, 200, 2*t + 0.3, 2*t + 1);
  arc(cx, cy, 110, 110, 4*t + 3.1, 4*t + 5.8);
  strokeWeight(10);
  arc(cx + 55, cy - 55, 40, 40, 3.5*t + 1, 3.5*t + 2.8);
  
  stroke(78, 92, 0, 55);
  strokeWeight(3);
  line(cx - 90, cy + 30, cx - 90 + 40 * cos(4*t), cy + 30 + 40 * sin(4*t));  
  strokeWeight(5);
  line(cx - 90, cy + 30, cx - 90 + 35 * cos(52*t), cy + 30 + 35 * sin(52*t));  
  strokeWeight(4);
  line(cx - 90, cy + 30, cx - 90 + 10 * cos(6*t), cy + 30 + 10 * sin(6*t));

  stroke(188, 22, 240, 95);
  strokeWeight(8);
  line(cx, cy, cx + 120 * cos(3*t), cy + 120 * sin(3*t));  
  strokeWeight(15);
  line(cx, cy, cx + 85 * cos(t), cy + 85 * sin(t));  
  strokeWeight(17);
  line(cx, cy, cx + 40 * cos(9*t), cy + 40 * sin(9*t));  
}

void acax() {
  float r;

  stroke(255, 255, 255, 180);
  strokeWeight(10);
  arc(
    random(0, width),
    random(0, height),
    r = random(80, 300),
    r,
    random(0, 2 * PI),
    random(0, 2 * PI)
  );
  
  fill(255, 255, 200, 40);
  noStroke();
  ellipse(
    random(0, width),
    random(0, height),
    r = random(80, 150),
    r
  );
}

