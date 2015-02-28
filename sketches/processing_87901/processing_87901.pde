
float x1, y1, x2, y2;
float tx1, ty1, tx2, ty2;
int t;
float zoom = 1.5;

void setup() {
  size(500, 500);
  background(255);
  tx1 = 0;
  ty1 = 100; 
  tx2 = 336;
  ty2 = 465; 
  t=0;
  x1=map(noise(tx1), 0, 1, 0, width);
  y1=map(noise(ty1), 0, 1, 0, height);
  x2=map(noise(tx2), 0, 1, 0, width);
  y2=map(noise(ty2), 0, 1, 0, height);
  smooth();
  frameRate(60);
}


void draw() {
 
  //scale(zoom );
  //translate(-width*(zoom-1)/2.0,-height*(zoom-1)/2.0);
  step();
  strokeWeight(2);
  stroke( int(abs(sin(radians(t/2)))*255), 
  int(abs(cos(radians(t/3)))*255), 
  int(abs(sin(radians(t)))*255), 
  200);

  line(x1, y1, x2, y2);
}

void step() {
  float nx1=map(noise(tx1), 0, 1, -width/4, width*1.25);
  float ny1=map(noise(ty1), 0, 1, -height/4, height*1.25);
  float nx2=map(noise(tx2), 0, 1, -width/4, width*1.25);
  float ny2=map(noise(ty2), 0, 1, -height/4, height*1.25);

  stroke(0); 
  strokeWeight(2);
  line(x1, y1, nx1, ny1);
  line(x2, y2, nx2, ny2);

  x1=nx1; 
  y1=ny1;
  x2=nx2; 
  y2=ny2;

  t++;
  tx1+=0.01;
  ty1+=0.01;
  tx2+=0.01;
  ty2+=0.01;
}
