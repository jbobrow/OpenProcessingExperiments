
// patrones circulares (12/06/11)

float ratio_num = 7;
float ratio_den = 4;
float ratio = ratio_num/ratio_den;
float R = 450;
float r = R/ratio;
float angle = 0;
float inc = PI/60;
color dibu = color(random(10, 245), random(10, 245), random(10, 245));

void setup() {
  size(500, 500);
  smooth();
  noFill();
  strokeWeight(2);
  frameRate(50);
  if (ratio < 1) { R = 225*ratio/(1-ratio/2); r = R/ratio; }
}

void draw() {
  translate(width/2, height/2);
  pushMatrix();
  background(250);
  stroke(50);
  strokeWeight(2);
  ellipse(0, 0, R, R);
  translate(abs(R-r)/2*cos(angle), abs(R-r)/2*sin(angle));
  ellipse(0, 0, r, r);
  line(0, 0, r/2*cos(-angle*ratio), r/2*sin(-angle*ratio));
  stroke(dibu);
  strokeWeight(3);
  popMatrix();
  dibujo();
  angle += inc;
  if (angle > ratio_den*TWO_PI) {
    background(250);
    dibujo();
    angle -= ratio_den*TWO_PI;
    noLoop();    
  }
}

void dibujo() {
  beginShape();
  for (float i=0; i<angle; i+= PI/100) {
    vertex(abs(R-r)/2*cos(i) + r/2*cos(-i*ratio), abs(R-r)/2*sin(i) + r/2*sin(-i*ratio));
  }
  endShape();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    loop();
  } else if (mouseButton == RIGHT) {
    saveFrame("screen_##.png");
  } else { dibu = color(random(10, 245), random(10, 245), random(10, 245)); }
}

