
void setup(){
  size(1280, 720);
  background(0);
  noFill();
  frameRate(30);
}//end setup

void draw(){
  stroke(random(0,255), random(0,255), random(0,255), random(40,100));
  fill(random(0,255), random(0,255), random(0,255), random(40,100));
  //rect(random(width), random(height), random(20,200), random(20,200));
  
  pushMatrix();
  translate(random(width), random(height));
  rotate(random(TWO_PI));
  polygon(int(random(3,8)), random(5,100));
  popMatrix();

}//end draw

void mousePressed() {
  noLoop();
}

void polygon (int sideCount, float radius)
{
  float theta = 0.0;
  float x = 0.0;
  float y = 0.0;
  
  beginShape ();
  for (int i=0; i<sideCount; i++) {
    x = cos(theta)*radius;
    y = sin(theta)*radius;
    vertex(x,y);
    theta += TWO_PI/sideCount;
    stroke(random(0,255), random(0,255), random(0,255), 50);
    fill(random(0,255), random(0,255), random(0,255), random(40,100));
    
  }
  endShape(CLOSE);
} //end polygon


