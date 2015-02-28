
float jiten;
float kouten;
int num = 6;
int counter;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  smooth();

  noStroke();
}

void draw() {
  background(0, 0, 100);

  for (int i = 0; i < num ; i++) {
    pushMatrix();
    translate(width/2+150*sin(kouten + i), height/2+150*cos(kouten + i));
    rotate(jiten);
    fill(i * 360 / num, 100, 100, 80);
    ellipse(0, 0, 80, 30);
    popMatrix();
  }

  kouten += 0.01;
  jiten += 0.05;
}

void mousePressed() {  
  num += 6;
}

void keyPressed() {
  background(0,0,100);
  num = 6;
}


