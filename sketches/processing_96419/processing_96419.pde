
float theta;
float twistiness = random(3);
float nseed = random(10), amp = 80, smooth=.09;

void setup() {
  size(600,600);
  noLoop();
  theta = radians(20);
  smooth();
}

void draw()
{
  background(255);
  translate(width/2, height);
  rotate(0.05);
 
  branch(150,random(100));
}

void branch(float len, float leaves) {
  stroke(leaves,100 , leaves*noise(nseed));
  //line(0,0,1,-len);
 
  translate(0,-len);
  organicLine( 0, 0, 0.02, len, len/7, twistiness);

  if (len > 5) {

    pushMatrix();
    rotate(-theta * random(-20));
    branch(len*.655,leaves+35);
    popMatrix();

    pushMatrix();
    rotate(theta);
    branch(len*.75, leaves+20);
    popMatrix();
  }
}

void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
  strokeCap(ROUND);
  strokeWeight(strokeW);
 
  float numSections = random(10, 20);
  
  float cx = x2-x1; // change in x
  float cy = y2-y1; // change in y
 
  float nx1 = x1;
  float ny1 = y1;

  for (int i = 0; i <= numSections; i++) {
    float nx2 = x1 + i/numSections * cx * 0.9;
    float ny2 = y1 + i/numSections * cy+ random(-2, 2);

    line(nx1, ny1, nx2, ny2);
    nx1 = nx2+ random(-2, 1);
    ny1 = ny2;
  }
}

void mouseClicked(){
  redraw();
}
