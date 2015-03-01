
int num=15, rot=24;
float r, theta;
 
void setup() {
  size(800, 600);
  strokeWeight(5);
}
 
 
void draw() {
  background(#1D0B38);
  translate(width/2, height/2);
  r=0.0;
  for (int j=0; j<rot; j++) {
    pushMatrix();
    rotate(r);
    for (int i=0; i<num; i++) {
      color c = lerpColor(#F0C27B ,#4B1248 ,  1.0/num*i);
      stroke(c);
      float h = 20.0/num*i;
      float sz = map(sin(theta+TWO_PI/rot*j*3),-1,1,h,h/6);
      line(40+i*8, -sz, 40+i*8, sz);
    }
    r += TWO_PI/rot;
    popMatrix();
  }
  theta += 0.0523;
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");

}

