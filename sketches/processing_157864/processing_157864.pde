
int num=20, rot=12;
float r;

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
      float h = 30.0/num*i;
      line(30+i*10, -h, 30+i*10, h);
    }
    r += TWO_PI/rot;
    popMatrix();
  }
}
