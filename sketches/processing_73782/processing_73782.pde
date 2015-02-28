
PImage rotor;
PGraphics rg;
float rot;
float velocity=0;
float acceleration;
float deceleration;
float c=1;


void setup() {
  size(800, 800);
  colorMode(HSB, 1000);
  background(1000);
  smooth();
 // frameRate(30);
  imageMode(CENTER);
  noStroke();
  rotor = loadImage("rotor.png");
  rg = createGraphics(width, height, P2D);
}

void draw() {

  pushMatrix();

  translate(400, 400);
  fill(1000,300);
  rect(-400,-400,width,height);
  image(rg, 0, 0);
  rotate(radians(rot));
  image (rotor, 0, -300);
  popMatrix();

  if (rot>=360) {
    rot=0;
  }

  acceleration = rot/180;
  if (rot >= 0 && rot <= 180) {
    velocity += acceleration;
    rot+=velocity;
  }
  deceleration = .933;
  if (rot >= 180 && rot <= 360) {
    velocity *= deceleration;
    rot+=velocity;
  }
  if (rot==0) { 
    rot+=.5;
    velocity=0;
  }

  float r=307;
  float w=5;
  float h=5;

  rg.beginDraw();
  rg.colorMode(HSB, 1000);
  rg.translate(width/2, height/2);
  rg.rotate(radians(-90));
  int totalBoxes = 40;
  float arclength=0;
  rg.pushMatrix();
  rg.rotate(radians(rot));
  for (int i = 0; i < totalBoxes; i ++ ) {
    // Each box is centered so we move half the width
    arclength += w/3; 

    // Angle in radians is the arclength divided by the radius
    float theta = arclength / r;

    rg.pushMatrix();
    // Polar to cartesian coordinate conversion
    rg.translate(r*cos(theta), -r*sin(theta));
    // Rotate the box
    rg.rotate(theta);
   
    // Display the box
    rg.noStroke();
    rg.fill(c, 1000, 1000);
    rg.ellipse(0, 0, w, h);
    rg.popMatrix();

    // Move halfway again
    arclength += w/3;
  }
  rg.popMatrix();
  rg.endDraw();

  if (mousePressed) {
    c+=2;
  }
  else if (!mousePressed) {
    c=c;
  }
  if (c>=1000) {
    c=0;
  }
}





