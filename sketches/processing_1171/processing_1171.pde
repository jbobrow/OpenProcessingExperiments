
float radius = 230; // iris radius
float pupil = 70;

float widthScale = .03;
float radialResolution = .01;
float circularResolution = .001;
float neighborhood = circularResolution * 10;

void setup() {
  size(512, 512);
  colorMode(HSB, 1);
  smooth();
}

void draw() {  
  makeBase();
  
  print("blue...");
  drawStromaNetwork(randomNetwork(), 152/255., 110/255., 230/255., .2);
 /* 
  print("green...");
  drawStromaNetwork(randomNetwork(), 71/255., 106/255., 124/255., .6);
  
  print("yellow...");
  drawStromaNetwork(randomNetwork(), 27/255., 114/255., 108/255., .6);
 */
  println("done");
  
  saveFrame();
}

float hv = .02, sv = .2, bv = .2, ov = .2;

void drawStromaNetwork(StromaNetwork stroma, float h, float s, float b, float o) {   
  noStroke();
  StromaRing baseRing = stroma.get(0);
  for(int i = 0; i < baseRing.size(); i++) {
    Stroma cur = baseRing.get(i);
    fill(
      constrain(h + random(-hv, hv), 0, 1),
      constrain(s + random(-sv, sv), 0, 1),
      constrain(b + random(-bv, bv), 0, 1),
      constrain(o + random(-ov, ov), 0, 1));
    beginShape(TRIANGLE_STRIP);
    while (cur.next != null) {
      float strokeWidth = cur.width * widthScale;
      radialVertex(cur.r, cur.theta - strokeWidth);
      radialVertex(cur.r, cur.theta + strokeWidth);
      cur = cur.next;
    }
    endShape();
  }
}

StromaNetwork randomNetwork() {
  RadialBasisFunction attraction, circularDensity, radialWidth;

  attraction = new RadialBasisFunction();
  attraction.add(random(.01, .1), random(-.3, -1));
  attraction.add(random(.4, .6), random(.3, .7));
  attraction.add(random(.9, .99), random(-1, -.8));
  
  circularDensity = new RadialBasisFunction();
  for(int i = 0; i < 10; i++)
    circularDensity.add(random(1), random(.2, 1));
    
  radialWidth = new RadialBasisFunction();
  for(int i = 0; i < 4; i++)
    radialWidth.add(random(1), sq(random(0, 1)));
    
  return new StromaNetwork(attraction, circularDensity, radialWidth);
}

void radialVertex(float r, float theta) {
  theta = theta * TWO_PI + PI;
  r = ((1 - r) * (radius - pupil)) + pupil;
  vertex(width / 2 + cos(theta) * r, height / 2 + sin(theta) * r);
}

void radialLine(float r1, float theta1, float r2, float theta2) {
  theta1 = theta1 * TWO_PI + PI;
  theta2 = theta2 * TWO_PI + PI;
  r1 = ((1 - r1) * (radius - pupil)) + pupil;
  r2 = ((1 - r2) * (radius - pupil)) + pupil;
  line(
    width / 2 + cos(theta1) * r1, height / 2 + sin(theta1) * r1,
    width / 2 + cos(theta2) * r2, height / 2 + sin(theta2) * r2);
}

void makeBase() {
  background(1);
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(width / 2, height / 2, radius * 2, radius * 2);
}

