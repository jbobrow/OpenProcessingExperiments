
float r1=0;


void setup() {
  size(800, 400); 
  background(40);
  smooth();
}
void draw() {
  fill(80,50);
  rect(0, 0, width, height); 
  strokeWeight(4);
  //fill(0, 146, 255, 80);
  noFill();
  
  if (r1>=300) {
    r1=r1*-1;
  }
  
  if (r1<300) {
    r1+=random(20);
    rect(mouseX-r1/2, mouseY-r1/2, r1, r1);
  }
  polygon(3, mouseX, mouseY, 50);
  //println(r1);
}

void polygon(int n, float cx, float cy, float r)
{
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)),
      cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}



