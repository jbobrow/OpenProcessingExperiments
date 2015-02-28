
PVector r;
float s = 70;
float vx = 0;
float vy = 0;
float detail = 100;
float steps = 5000;
int f;
void setup() {
  size(800, 800, P2D);
  smooth();
  background(0);
  stroke(255);
}
void draw() {
  background(0);
  translate(width/2 + vx, height/2 + vy);
  drawStuff();
  blur(3);
  scale(1, -1);
  drawStuff();
  
  if(keyPressed) {
    if(key=='e')
      s *= 1.05;
    if(key=='q')
      s /= 1.05;
  }
  f++;
}
void drawStuff() {
  text("Detail: " + detail, -width/2 + 10, -height/2 + 20);
  text("Steps: " + steps, -width/2 + 10, -height/2 + 40);
  text("dy/dx at mouse: " + dy((mouseX-width/2)/s-vx/s, (height-mouseY-width/2)/s-vy/s)/dx((mouseX-width/2)/s-vx/s, (height-mouseY-width/2)/s-vy/s), -width/2 + 10, -height/2 + 60);
  scale(1, -1);
  drawLines();
  stepPlus(new PVector((mouseX-width/2)/s-vx/s, (height-mouseY-width/2)/s-vy/s, 0), steps, detail);
}
void stepPlus(PVector in, float i, float acu) {
  float x = in.x;
  float y = in.y;
  PVector f = new PVector(x, y);
  PVector g = new PVector(x, y);
  for(int k = 0; k < i; k++)
    f = step(f, acu, false);
  for(int k = 0; k < i; k++)
    g = step(g, acu, true);
}
PVector step(PVector in, float acu, boolean neg) {
  PVector out = in;
  float x = in.x;
  float y = in.y;
  if(neg)
    out.set(x - dx(x, y)/acu, y - dy(x, y)/acu, 0);
  else
    out.set(x + dx(x, y)/acu, y + dy(x, y)/acu, 0);
  line(x*s, y*s, out.x*s, out.y*s);
  return out;
}
/*************************************************/
//PUT IN FIELD HERE.
float dy(float x, float y) {
  return y-x;
}
float dx(float x, float y) {
  return y*sin(y);
}
/*************************************************/
void drawLines() {
  stroke(255);
  line(0, -10000, 0, 10000);
  line(-10000, 0, 10000, 0);
  stroke(255, 255, 255, 50);
  scale(1, -1);
  int g = 4;
  int k = 1;
  for(float i = -100/s*g; i < 100/s*g; i+=30/s) {
    line(-10000*s, i*s, 10000*s, i*s);
    if(k%2 != 0)
    text(-i, 2, i*s);
  }
  for(float i = -100/s*g; i < 100/s*g; i+=30/s) {
    k++;
    line(i*s, -10000*s, i*s, 10000*s);
    if(i != 0 && k%2 != 1)
      text(i, i*s, -2);
  }
  scale(1, -1);
  for(float x = -100/s*4; x < 100/s*4; x += 30/s) {
    for(float y = -100/s*4; y < 100/s*4; y += 30/s) {
      float tdx = dx(x, y);
      float tdy = dy(x, y);
      float len = max(1, dist(tdx, tdy, 0, 0));
      stroke(255, 255/2+tdx*100, 255/2-tdy*100, 120);
      line(x*s, y*s, x*s + tdx*30/len, y*s + tdy*30/len);
    }
  }
  stroke(255);
}
 
void blur(int dd) {
  loadPixels();
   int[] px = new int[pixels.length];
   for(int d=1<<--dd; d>0; d>>=1) { 
      for(int x=0;x<width;x++) for(int y=0;y<height;y++) {
        int p = y*width + x;
        int e = x >= width-d ? 0 : d;
        int w = x >= d ? -d : 0;
        int n = y >= d ? -width*d : 0;
        int s = y >= (height-d) ? 0 : width*d;
        int r = ( r(pixels[p+w]) + r(pixels[p+e]) + r(pixels[p+n]) + r(pixels[p+s]) ) >> 2;
        int g = ( g(pixels[p+w]) + g(pixels[p+e]) + g(pixels[p+n]) + g(pixels[p+s]) ) >> 2;
        int b = ( b(pixels[p+w]) + b(pixels[p+e]) + b(pixels[p+n]) + b(pixels[p+s]) ) >> 2;
        px[p] = 0xff000000 + (r<<16) | (g<<8) | b;
      }
      arrayCopy(px,pixels);
   }
   updatePixels();
}
 
int r(color c) {return (c >> 16) & 255; }
int g(color c) {return (c >> 8) & 255;}
int b(color c) {return c & 255; }

