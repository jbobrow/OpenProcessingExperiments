
float r1=0;
float cp=200;
float sp=50;
float rspeed=0;
float rspeed1=0;
float clr=0;
void setup() {
  size(1024, 800); 
  background(80);
  smooth();
}
void draw() {
  clr+=1;
  fill(0,sqrt(clr),clr,50);
  rect(0, 0, width, height); 
  strokeWeight(2);
  stroke(255);
  //fill(0, 146, 255, 80);
  noFill();
  
  //pushMatrix();
  translate(mouseX,mouseY);
  rotate(PI*rspeed1);
  polygon(5,0,0, cp);
  //popMatrix();
  
    if (r1>=150) {
    r1=r1*-1;
  }
  
  if (r1<150) {
    r1+=random(5);
    rect(0-r1/2, 0-r1/2, r1, r1);
  }
  
    if (r1>=150) {
    r1=r1*-1;
  }
  
  if (r1<150) {
    r1+=random(5);
    rect(0-r1/2, 0-r1/2, r1, r1);
  }

  rspeed1+=0.01;
  rspeed+=0.0001;
  //pushMatrix();
  translate(0,0-(cp+sp*2));
  rotate(PI/rspeed);
  polygon(3,0,0, sp);
  //popMatrix();
  translate(0,0+(cp+sp*2));
  polygon(3,0,0, sp);
  



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



