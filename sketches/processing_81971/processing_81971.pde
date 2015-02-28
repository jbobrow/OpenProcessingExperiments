
void heads() {
  fill(221, 72, 20);
  ellipse(-0.67*(width/2),0,0.4*(width/2),0.4*(height/2));
  fill(255, 255, 255);
  ellipse(-0.67*(width/2),0,0.28*(width/2),0.28*(height/2));
}

void hands() {
  fill(221, 72, 20);
  rect(0.49*(width/2), 0, 0.22*(width/2), 0.08*(height/2));
}

void setup() {
  size (400,400);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2,height/2);
  fill(221, 72, 20);
  ellipse(0,0,width,height);
  
  fill(255, 255, 255);
  ellipse(0,0,1.16*(width/2),1.16*(height/2));
  
  fill(221, 72, 20);
  ellipse(0,0,0.78*(width/2),0.78*(height/2));

  heads();
  hands();
  rotate(radians(120));
  heads();
  hands();
  rotate(radians(120));
  heads();
  hands();
}



