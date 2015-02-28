
int n = 10;
float r = 2;
float s = 2;
float w, h;
int count=10;
float circleSize=0;
float circleX = 20;
float circleY = 20;



void setup() {
  size(300, 1000, P2D);
  background(0);
  w = width/2;
  h = height/2;
  smooth();
  tint(-100);
  frameRate(2000);
}

void draw() {
  noStroke();
  colorMode(HSB);
  fill(255,30);
  smooth ();   
  ellipse (150,frameCount % 1100, circleX % width,circleY % width );
  ellipse (150,frameCount % 800, 40,40 );
  ellipse (150,frameCount % 500, 100,100 );
  ellipse (150,frameCount % 200, 50,50 );
  ellipse (10,frameCount % 300, 30,30);
  ellipse (290,frameCount % 900, 30,30);
  ellipse (30,frameCount % 1000, 30,30);
  ellipse (50,frameCount % 700, 35,35);
  ellipse (190,frameCount % 1000, 40,40);
  ellipse (250,frameCount %200, 20,20);
  frameRate(2000);
  
 
  

// This will make the to the right on the next pass --
  // each move will increase from 0 to 30 pixels to the right
  circleX = circleX + (frameCount % 2);
  //Keep it in range
  circleX = circleX % width;
   
  // Move circle down + keep it in range
  circleY = circleY + 0.5;
  circleY = circleY % width;
   


   fill(255,random(20));
  translate(w,h);
  scale(w*1);
  for(int y=1; y<n; y++) for(int x=1; x<n; x++) {
    line(f(x, y), f(x, y));
    line(f(x, y), f(x, y));
    
  }
}
 
void line(float[] p1, float[] p2) {
    stroke(0, 30);
    line(p1[0], p1[1], p2[0], p2[1]);
    tint(-999);
}
 
float[] f(int ix, int iy) {
  float x = map(ix, 0, n-1, -1, 1) * random(1-r, 1+r);
  float y = map(iy, 0, n-1, -1, 1) * random(1-r, 1+r);
  float a = (mouseX-w)/(w+h);
  float b = (mouseY-h)/(w+h);
  float d = x*x + y*y;
  return new float[] { (x*a + y*b)/d, (x*b - y*a)/d };
  
}



