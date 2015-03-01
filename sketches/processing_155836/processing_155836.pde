
float angle;
float jitter;
float x, y;
float dim = 80.0;
PShader blur;

void setup() {
  background(255);
  size(700, 500);
  noStroke();
  rectMode(CENTER);
  frameRate(50);
}

void draw() {

  background(204);
  stroke(10);

  //point
  fill(11, 230, 75);
  ellipse(mouseX, mouseY, 25, 25);
  //filter(blur);  
 
 



  //clock
  line(mouseX, 20, mouseX, 80);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  line(s, 0, s, 60);
  line(m, 65, m, 120);
  line(h, 120, h, 150);



  //rectangular
  size(700, 500);
  noStroke();
  if (mousePressed == true) {
    fill(111);
  } else {
    fill(345);
  }
  ellipse(50, 50, 10, 10);



  for (int i = 0; i < 10000; i++) {
    float x = random(width);
    float y = random(height);
    text("IKE", x, y);
  }
  if (frameCount % 10 == 0) println(frameRate);


  // angle
  if (second() % 2 == 0) {  
    jitter = random(-0.5, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  rect(0, 0, 180, 180);



  //
  x = x + 0.8;

  if (x > width + dim) {
    x = -dim;
  } 

  translate(x, height/4-dim/4);
  fill(65, 180, 30);
  rect(-dim/2, -dim/2, dim, dim);

  //
  y = y + 0.4;

  if (y > width + dim) {
    y = -dim;
  } 

  translate(y, height/8-dim/8);
  fill(180, 45, 90);
  ellipse(-dim/4, -dim/4, dim, dim);


  //
}



