
PImage arm;
PImage body;
PImage head;
PImage lefthand;
PImage leg;
PImage stripes;

PImage bg;

void setup() {
  size (950, 950);
  body = loadImage ("body.png");
  head = loadImage ("head.png");
  arm = loadImage ("arm.png");
  lefthand = loadImage ("lefthand.png");
  leg = loadImage ("leg.png");
  bg = loadImage ("stripes.jpg");
}

void draw() {
  float wavenoise = noise( millis()/3);
  float kick = noise((millis()+1000.0)/150);
  float noiseValue1 = noise(millis()/1000.0);
  float noiseValue2 = noise((millis()+1000.0)/1357.9);
  //println(mouseX);
  //println(mouseY);
  background(bg);

  image(body, 214, 156); 
  //head 
  float x = 406;
  float y = map(noiseValue2, 0, 1.5, 45, 125);
  pushMatrix();
  translate (x, y);
  image(head, 0, 0);
  popMatrix();
  //left arm

  pushMatrix();
  rotate(radians(wavenoise));
  image(arm, 535, 205);
  popMatrix();

  //leg
  float noiseAngle = map(kick, 0, 1, -2, 2 );
  pushMatrix();
  rotate(radians(noiseAngle));
  image(leg, 160, 490);
  popMatrix();
  image(lefthand, 210, 173);
}


