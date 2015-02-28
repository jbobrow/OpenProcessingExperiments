
Ball[] ball;
void setup() {
  size(199,264);
  ball = new Ball[49];
  for( int i=0; i<ball.length; i++ ) {
    ball[i] = new Ball();
    ball[i].x = 3+4*i;
    ball[i].a = 0.03+0.005*i;
    ball[i].d = 0.7;
  }
  frameRate(30);
  background(0);
}
void draw() {
  //background(0);
  fill(0,30);
  noStroke();
  rect(0,0,width,height);  
  fill(255);
  for( int i=0; i<ball.length; i++ ) {
    ball[i].update();
  }
  windows();
}

void windows() {
  for( int x=1; x<width; x+=4 ) {
    line(x,0,x,height);
  }
}

class Ball {
  float x;
  float y;
  float v;
  float a;
  float d;
  Ball() {}
  void update() {
    v += a;
    y += v;
    
    if( y > height ) {
      v = -v*d;
      y = height;
    }
  
    if( y == height && abs(v) < 0.5 ) {
      y=-100;
      v=0;
      a=random(0.05,0.3);
      d=random(0.6,0.8);
    }
    fill(map(y,0,height,255,200));
    ellipse(x,y,3,3+abs(v)*1.2);
  }
}

