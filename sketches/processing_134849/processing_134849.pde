

void setup(){
  background(255);
  size(1000, 460);
  smooth();
  stroke(255);
  strokeWeight(1);
  frameRate(1);
}
 
void draw(){
beginShape(TRIANGLE_STRIP);
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
vertex(random(0,1000),random(0,460));
endShape();
fill(random(0,255));
}

