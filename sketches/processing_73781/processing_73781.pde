
PImage rotor;
float rot=0.0;
float x;
float velocity=0;
float acceleration;
float deceleration;
void setup() {
  size(800, 800);
  background(255);//white
  smooth();
  frameRate(30);
  imageMode(CENTER);
  noStroke();
  rotor = loadImage("rotor.png");
}

void draw() {

  pushMatrix();
  translate(400, 400);
  rotate(radians(rot));
  float distance = dist(400,400,mouseX,mouseY);
  image (rotor, 0, -(distance));
  popMatrix();
  
  fill(255,70);
  rect(0,0,width,height);

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

  println(rot);
}


