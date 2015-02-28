
float angle, angle2;
int dist_moon = 120;
int dist_sat1 = 75;
int dist_sat2 = 100;

void setup() {
  size(500, 500);
  //rectMode(CENTER);
}


void draw() {
  fill(20,20);
  noStroke();
  rect(0,0,width, height);
  fill(240);
  //ellipse(width/2, height/2, 25, 25);

  translate(width/2, height/2);
  rotate(angle);
  translate(dist_moon, 0);
  rotate(angle);
  ellipse(0, 0, 40, 40);
  pushMatrix();
  rotate(angle*2);
  translate(dist_sat1,0);
  ellipse(0, 0, 25, 25);
  popMatrix();
  pushMatrix();
  rotate(angle);
  translate(dist_sat2,0);
  ellipse(0, 0, 10, 10);
  popMatrix();
 
  angle += 0.0523/4;
  
  //if (frameCount>50 && frameCount%(2*4)==0 & frameCount<50+(121*4)) saveFrame("image-####.gif");
  
}

