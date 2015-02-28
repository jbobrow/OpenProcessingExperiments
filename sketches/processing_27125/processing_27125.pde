
//http://www.openprocessing.org/visuals/?visualID=16119


float r;
int x;
int y;

void setup() {
  size(500, 500);
  x=width/2;
  y=height/2;
  smooth();
  background(255);

}
 
void draw() {
  fill(255, 10);
  noStroke();
  rect(0,0,width,height);

  r=r+0.1;
  
  translate(x, y);
  rotate(r);

  renderShape();
}
 
void renderShape() {
  stroke(0,0,255);
  strokeWeight(3);
  line(0,0,200,0);
}
 




