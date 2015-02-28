
float theta = radians(30);
float rangle;

float nrot;
float nrot2;


void setup() {
  size(600, 600, P3D);
}

void draw() {
  frameRate(10);
  rangle = noise(-3, 3);
  background(0);
  translate(width/2, height);
  branch(100);
  nrot = -theta+random(-0.1, 0.1);
  nrot2 = theta+random(-0.1, 0.1);
}

void branch(float len) {
  stroke(255, len/0.5);
  
  strokeWeight(len/8);
  //fill();
  line(0, 0, 0, -len);

  pushMatrix();
  noStroke();
  fill(255, len*20);
  float fnoise = random(0, 2);
  ellipse(0, -len, 5*fnoise, 5*fnoise);
  popMatrix();

  translate(0, -len);

  if (len>10) {
    pushMatrix();
    rotate(nrot);
    branch(len*.75);
    popMatrix();

    pushMatrix();
    rotate(nrot2);
    branch(len*.75);
    popMatrix();

    pushMatrix();
    branch(len*.5);
    popMatrix();
  }
}



