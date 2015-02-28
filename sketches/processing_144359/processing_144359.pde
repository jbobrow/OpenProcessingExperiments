
// David Mrugala

float angle;

void setup() {
  size(600, 600);
  smooth();
  textAlign(CENTER,BOTTOM);
  textSize(15);
}

void draw() {
  background(#325A7D);

  
  angle+=0.005;

  translate(width/2, height/2);
  rotate(-HALF_PI);
  
  fill(#325A7D);
  stroke(255);
  strokeWeight(20);
  strokeCap(CORNER);
  
  pushMatrix();
  rotate(angle);
  arc(0, 0, 500, 500, 0, radians(second()*6));
  rotate(radians(second()*6));
  text(second(),250,0);
  popMatrix();
  
  pushMatrix();
  rotate(2*angle);
  arc(0, 0, 450, 450, 0, radians(minute()*6));
  rotate(radians(minute()*6));
  text(minute(),225,0);
  popMatrix();
  
  pushMatrix();
  rotate(-angle);
  arc(0, 0, 400, 400, 0, radians(hour()*15));
  rotate(radians(hour()*15));
  text(hour(),200,0);
  popMatrix();
}

