
float theta;

//DECLARE
ArrayList branchCollection;

float rotationSpeed;
float rotation;

int depth = 5;
int trees = 5;
int screenSize = 1000;

void setup() {
  size(1000, 1000);
  //size(screenSize, screenSize);
  smooth();
  branchCollection = new ArrayList();

  for (int i = 0; i < trees; i++) {

    PVector origin = new PVector(0, 0);
    Branch myBranch = new Branch(origin);
    branchCollection.add(myBranch);
  }
}

void draw() {
  background(0);
  translate(0.5*screenSize, 0.5*screenSize);

  rotationSpeed = rotationSpeed += 0.025;
  rotation = (rotationSpeed);

  rotate(rotation);

  //ellipse(0,0,10,10);
  for (int i = 0; i < branchCollection.size (); i++) {
    rotate(TWO_PI/trees);
    pushMatrix();
    Branch mb = (Branch) branchCollection.get(i);
    mb.run();
    popMatrix();
  }
}


class Branch {

  float strokeWidth_min = 1;
  float strokeWidth_max = 5;
  float strokeWidth = (random(strokeWidth_min, strokeWidth_max));
  float randomTheta = random(0, 50);

  PVector loc = new PVector (0, 0, 0);

  Branch(PVector _loc) {

    loc = _loc;
  }

  void run() {
    branch( screenSize * 0.15 );
    display();
  }
  void branch(float length) {
    theta = rotation;
    strokeWeight(length/20);
    line(0, 0, 0, -length);
    translate(0, -length);
    length *= 0.66;
    if (length > depth) {
      pushMatrix();
      rotate(rotation/2);
      rotate(theta);
      branch(length);
      popMatrix();
      pushMatrix();
      rotate(rotation/2);
      rotate(-theta);
      branch(length);
      popMatrix();
    }
  }
  void display() {
    theta = map(0, 0, 500, 0, PI/2);
    //translate(0.5*width, 0.50*height);
    rotate(rotation);
    stroke(255);
    branch(60);
  }
}



