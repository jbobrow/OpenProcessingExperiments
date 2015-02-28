
int t;

void setup() {
  size(500, 500);
  colorMode (HSB);
  
  t=0;
}

void draw() {
  background(0);

  int s=second();
  int m=minute();
  int h=hour();
  
  if (t<=360){
    t++;
  }
  else {
    t=0;
  }

  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  fill(random(255), random(255), 255);
  rotate(radians(t));
  ellipse(width/3, height/3, h, h);
  fill(random(255), random(255), 255);
  rotate(radians(t));
  ellipse(width/4, height/4, m, m);
  fill(random(255), random(255), 255);
  rotate(radians(t));
  ellipse(width/5, height/5, s, s);
  popMatrix();
}



