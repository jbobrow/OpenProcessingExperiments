
int num = 10, maxSize=400, incr=40;
float theta;

void setup() {
  size(500, 500);
  noStroke();
  frameRate(15);
}

void draw() {
  background(0);
  for (int i=0; i<5; i++) circle();  
  fill(0);
  float sz = map(frameCount,1,121,0,500);
  ellipse(width/2, height/2, sz, sz);
  if (sz>500) noLoop();
  
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
  
}

void circle() {
  float offX = random(-20, 20);
  float offY = random(-20, 20);
  for (int i=0; i<num; i++) {
    float x = width/2+offY;
    float y = height/2+offX;
    fill(255, 10);   
    ellipse(x, y, maxSize-incr*i, maxSize-incr*i);
  }
}

