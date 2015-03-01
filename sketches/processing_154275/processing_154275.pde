
int num=50;
float theta, start, maxsz=300, x, y;
 
void setup() {
  size(500, 500);
  stroke(100);
  strokeCap(ELLIPSE);
  background(0);
  fill(100,0,20);
}
 
void draw() {
  background(0, 0, 100);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float sw = map(sin(theta+TWO_PI/num*i),-1,2,1,3);
    translate(width/2, height/2);
    int dir=i%2==0 ? 1 : -1;
    float start = TWO_PI/num*i;
    float sz = maxsz - i*9;
    rotate(theta*dir+TWO_PI/num*i);
    stroke(0);
    strokeWeight(sw);
    arc(1,3, sz, sz, start, start+PI);
    popMatrix();
  }
  theta += 0.0523;
  //if (frameCount%2==0 & frameCount<121) saveFrame("image-###.gif");
}

