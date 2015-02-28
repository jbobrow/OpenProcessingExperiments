
float v=0.0;
float t=0;
float h;
float i=50;

float r,g,b;

void setup() {
  size(400,400);
  h = sqrt(sq(width/2)+sq(height/2));
  setRGB();
  background(r,g,b);
}

void draw() {
  fill(rC(r,i),rC(g,i),rC(g,i),rC(5,30));
  ellipse(width/2,height/2,rC(1,2*h),rC(1,2*h));
  t+=1;
  v+=0.1;
  filter(11,6);
  if(t>10) {
    t=0;
    setRGB();
  }
}

void setRGB() {
  r=random(255);
  g=random(255);
  b=random(255);
}

float rC(float a,float m) {
  return a+noise(v)*m;
}

