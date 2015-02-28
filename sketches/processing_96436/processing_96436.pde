
float theta = radians(15);
float rangle;

float wave = 0;

void setup() {
  size(600, 600);
  rangle = random(1, 3);

}

void draw() {
  randomSeed(5);
  background(0);
  translate(width/2, height);
  branch(150, 5, 3);
}

void branch(float len, float twist, float sec) {
  stroke(255, len/0.5);
  strokeWeight(len/8);
  //fill();
  organicLine(0, 0, 0, -len, twist, sec);
  //line(0, 0, 0, -len);

  pushMatrix();
  noStroke();
  fill(255, len*20);
  float fnoise = random(0, 2);
  ellipse(0, -len, 5*fnoise, 5*fnoise);
  popMatrix();

  translate(0, -len);

  if (len>10) {
    pushMatrix();
    rotate(-theta*random(1, 3));
    branch(len*.75, twist, sec);
    popMatrix();

    pushMatrix();
    rotate(theta*rangle);
    branch(len*.75, twist, sec);
    popMatrix();

    pushMatrix();
    branch(len*.5, twist, sec);
    popMatrix();
  }
}

void organicLine(float x1, float y1, float x2, float y2, float twist, float sec)
{

  float numSections = sec;                              // vary the # of sections? 

  float cx = x2-x1;         // change in x
  float cy = y2-y1;         // change in y

  float nx1 = x1;
  float ny1 = y1;

  for (int i = 1; i <= numSections; i++)       
  {
    float nx2 = x1 + i/numSections * cx + random(-twist, twist);               // add variation here
    float ny2 = y1 + i/numSections * cy + random(-twist, twist);               // and here

    line(nx1, ny1, nx2, ny2);

    nx1 = nx2;
    ny1 = ny2;
  }
}



