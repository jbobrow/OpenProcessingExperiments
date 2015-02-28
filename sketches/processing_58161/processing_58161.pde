
Stick[] sticks = new Stick[575];


void setup() {
  size(300, 300); 
  smooth();
  rectMode(CENTER);

  for (int i=0; i < sticks.length; i++) {
    float W = random(width/2);
    float H = random(height/2);
    float r = random(TWO_PI/2);
    sticks[i] = new Stick(W, H, r);
  }
}

void draw() {
  background(0, 30, 204);
  fill(255);
  int numRect = int(map(mouseX, 0, height, 1, sticks.length));

  for (int i=10; i < numRect; i+=5) {

    sticks[i].display();

    sticks[i].animate();
  }
}


class Stick {
  float W;
  float H;
  float R; 

  Stick( float x, float y, float rotation ) {
    this.W = W;
    this.H = H;
    this.R = rotation;
  } 

  void display() {
    rectMode(CENTER);
    strokeWeight(2); 
    fill(mouseY, 50, 0); 
    translate(this.W+40, this.H-10);
    rotate(this.R);
    ellipse(10, 10, 53, 1000);
    fill(255, 255, 0); 
    rect(10, 0, 5, 1000); 
    fill(255, 0, 255); 
    rect(10, 10, 5, 560);
  }

  void animate() {
    this.R += 0.002;
  }
}


