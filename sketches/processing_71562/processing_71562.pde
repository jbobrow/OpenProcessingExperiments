
int n = 10;
float r = 2;
float s = 2;
float w, h;
int count=10;
float circleSize=0;




void setup() {
  size(1000, 500, P2D);
  background(0);
  w = width/2;
  h = height/2;
  smooth();
  tint(-999);
  frameRate(80);
  

 
}

 void keyPressed() {
 

}
void draw() {
  noStroke();
  colorMode(HSB);
  fill(255,30);
  smooth ();   
  ellipse (900,frameCount % 1000, 250,250 );
  ellipse (700,frameCount % 900, 250,250 );
  ellipse (500,frameCount % 800, 250,250 );
  ellipse (300,frameCount % 700, 250,250 );
  ellipse (100,frameCount % 600, 250,250 );
  
 
  
   //ellipse (mouseX,mouseY,200,200 );
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



