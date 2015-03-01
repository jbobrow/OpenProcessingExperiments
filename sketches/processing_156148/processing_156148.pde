
int cloudX;
int cloudX2;
color sun = #ffb22e;
color inside = #FFB700;
float x,y;
float dim = 80.0;


void setup() {
  size(500, 250);
  cloudX = 0;
  cloudX2 = 0;
}

void draw() {
  background(149, 204, 255);
  cloudX = cloudX +1;
  cloudX2 = cloudX2 +2;

  //pushMatrix();
  //translate(width*0.2, height*0.5);
  //rotate(frameCount / 200.0);
  //star(0, 0, 5, 70, 3); 
  //popMatrix();

  //pushMatrix();
  //translate(width*0.5, height*0.5);
  //rotate(frameCount / 50.0);
  //star(0, 0, 80, 100, 40); 
  //popMatrix();

  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / 100.0);
  star(0, 0, 50, 70, 10); 
  noStroke();
  fill(255, 255, 0);
  popMatrix();

//yellow sun interior
  ellipse(400, 126, 80, 80);
  fill(sun);

  x = x + 0.8;

  if (x > width + dim){
    x = -dim;
  }
  
  translate(x, dim);
  
  //cloud
  fill(255, 255, 255);
  noStroke();
  ellipse(100+cloudX, 50, 60, 60);

  fill(255, 255, 255);
  noStroke();
  ellipse(125+cloudX, 55, 50, 50);

  fill(255, 255, 255);
  noStroke();
  ellipse(150+cloudX, 60, 30, 30);

  fill(255, 255, 255);
  noStroke();
  ellipse(70+cloudX, 60, 30, 30);

  //cloud2
  fill(255, 255, 255);
  noStroke();
  ellipse(200+cloudX2, 130, 60, 60);

  fill(255, 255, 255);
  noStroke();
  ellipse(225+cloudX2, 135, 50, 50);

  fill(255, 255, 255);
  noStroke();
  ellipse(250+cloudX2, 140, 30, 30);

  fill(255, 255, 255);
  noStroke();
  ellipse(170+cloudX2, 140, 30, 30);
}

void star(float x, float y, float radius1, float radius2, int npoints) {


  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);

    fill(inside);
  }

  endShape(CLOSE);
}



