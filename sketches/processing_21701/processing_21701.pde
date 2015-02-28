
PGraphics buffer;

void setup() {
  size(600,800);
  background(0,0,0,0);
  buffer = createGraphics(600,800,P3D);

}

void draw() {
  image(buffer,0,0);
}

int x1,x2,y1,y2,h;
void mousePressed() {
  buffer.colorMode(HSB,255,255,255,255);
  buffer.beginDraw();
  h = int(random(255));
      println(h);
  buffer.background(0,0,0,10);
  for (float i=0; i<128; i++) {
    x1 = int(random(600));
    x2 = int(random(600));
    y1 = int(random(800));
    y2 = int(random(800));
    buffer.stroke(i*2,255,sq((((i*2)+h)%256)/256)*255,255);
    buffer.line(x1,y1,x2,y2);
  }
  buffer.endDraw();
}

