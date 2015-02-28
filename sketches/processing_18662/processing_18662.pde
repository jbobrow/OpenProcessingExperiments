
float x = 25;
float y = 25;
float speed = 2;
int direction=1;
float angle=0.0;
float radius=20.0;

void setup() {
  size(250,250);
  smooth();
  ellipseMode(RADIUS);
  stroke(0,100);
  noFill();
}
void draw() {
  fill(0,25);
  rect(0,0,width,height);
  fill(255);
  y+=speed*direction;
  {
    angle=angle+1.0;
    translate(120,120);
    rotate(angle);
    ellipse(mouseX,mouseY,10,10);

    stroke(#CBDBE0);
    float weight = dist(mouseX,mouseY,pmouseX,pmouseY);
    strokeWeight(weight);
    stroke(200,mouseY,mouseX,102);

    ellipse(mouseX, mouseY, radius, radius);
  }
  for(int x=20; x<250; x+=10)
    line(mouseX,mouseY,x,y);

  if ((y>height-radius) || (y<radius)) {
    direction=-direction;
  }
}
void mousePressed() {
  fill(0,255);
  stroke(255);
}


