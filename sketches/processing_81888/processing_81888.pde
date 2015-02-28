
float r = PI+90;


void setup() {
  size(400, 400);

  smooth();

  PFont t ;
  t = loadFont("AgencyFB-Bold-72.vlw");
  textFont(t);
  fill(0);
  noStroke();
  randomSeed(20);
}

void draw() {


  frameRate(30);
  translate(200, 200);
  background(252, 247, 74);


  pushMatrix();

  rotate(r);
  fill(74, 252, 194, 150);
  triangle(0, 0, random(700), random(100), random(100), random(100));
  triangle(0, 0, random(50), random(200), random(200), random(200));
  triangle(0, 0, random(100), random(300), random(300), random(300));

  fill(100, 100, 200);
  ellipse(150, 0, 15, 15);


  popMatrix();
  fill(100, 100, 200);
  String x= str(frameCount/60);
  textAlign(CENTER);
  text(x, 0, 25);
  // 숫자 카운팅

  r=r+PI/30; 
}
