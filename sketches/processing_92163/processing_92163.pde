
ArrayList<Part> parts;
float w = 500;
float h = 500;
float g = 1.8;
float noiseoff=0;

boolean record=false;
void setup() {
  size(500, 500);
  smooth();
  background(20);
  frameRate(25);
  parts = new ArrayList();
 
  createParticles();
}

void mouseDragged() {
}
void createParticles() {
 
  float tx = mouseX;
  float ty = mouseY;
  for (int i=0;i<1000;i++) {
    noiseoff+=.1;
    float x = random(w);
    float y = random(h);
    float t=15+random(20);
    color c = color(random(105), random(0), random(255),random(100)
    );
    Part p = new Part(x, y, random(5), c);  
    p.velocity.x=0;
    p.velocity.y=0;
    p.acceleration.x=random(1)-.5;
    p.acceleration.y=random(1)-.5;
    parts.add(p);
  }
}
void mousePressed() {
  background(20);
  parts = new ArrayList();
  record=true;
  createParticles();
}
void mouseReleased() {
  record=false;
}
void draw() {
  if (frameCount%5==0) {
    fill(0, 10);
    rect(0, 0, width, height);
    background(0);
  tint(0,200,255);

  }
  make();
}
void make() {
  PVector m = new PVector(mouseX, mouseY);
  for (Part p:parts) {
 
    p.acceleration = PVector.sub(m, p.position);
    p.acceleration.normalize();
    p.update();
    p.render();
  }
}
void keyPressed() {
  if (key == 's') {
    saveFrame("images/screen_#####.png");
  }
  if (key == 'f') {
 
  }
}
class Part {
  float maxspeed=70;
  // float g=1.8;
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  float size = 10;
  color c;
  Part(float x, float y, float size, color c) {
    position.x=x;
    position.y=y;
    this.size = size;
    this.c=c;
  }
  void update() {
    size=random(4);  
 
    //velocity.y+=g;
    velocity.add(acceleration);
    velocity.limit(size*3);
    position.add(velocity);
  }
  void render() {   
    pushMatrix();
    translate(position.x, position.y);
    //    strokeWeight(size);
 
    stroke(c);
    //line(-velocity.x, -velocity.y, 0, 0);
    noStroke();
    fill(c);
    rect(0,0, size+2, size+2);
 
    popMatrix();
  }
}


