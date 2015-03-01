
Worm w[] =  new Worm[10];
color inside = color(255, 255, 255, 20);
color outside = color(0, 0, 0, 10);

void setup() {
  size(600, 600);
  background(outside);
  for (int i=0;i<w.length;i++) {
    w[i] = new Worm();
  }
}
float r=0;
int d=800;
float dDelta=1;
void draw() {


  fill(inside);
 // rect(0, 0, width, height);
  noStroke();

  translate(width/2, height/2);
  ellipse(0,0,d,d-=dDelta);
  if (d>800 || d<-800) {
    dDelta*=(-1);
  }
  rotate(r+=0.01);
  for (int i=0;i<w.length;i++) {
    w[i].render();
    rotate( radians(40) );
  }
}
class Worm {
  int len = 150;
  float aCycle=0;
  float xshift=0;

  public Worm() {
  }
  public void render() {
    for (int i=0;i<len;i++) {
      fill(outside);
      noStroke();
      // strokeWeight(map(i,0,len,0,5));
      float a = map(i, 0, len, 0, 360);
      float yOffset = sin( radians(a+(aCycle+=0.05)) )*20;
      ellipse((5*i), yOffset+random(3), 5+i, 5+i);
    }
  }
}

