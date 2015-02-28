
void setup() {
  size(200,200);
  background(255);
}

void draw() {
  noStroke();
  fill(255,255,0);
  for (int a=0; a<360; a=a+10) {
    float x=100+sin(radians(a))*80;
    float y=100+cos(radians(a))*80;
    //pushMatrix();
    ellipse(x,y,10,10);
    //popMatrix();
  }
  stroke(230,70,0);
  strokeWeight(0.1);
 
  for (int a=0; a<360; a=a+5) {
    float x=100+sin(radians(a))*60;
    float y=100+cos(radians(a))*60;
    pushMatrix();
    line(100,100,x,y);
    popMatrix();
  }
  noStroke();
  fill(255);
  ellipse(100,100,80,80);
}

