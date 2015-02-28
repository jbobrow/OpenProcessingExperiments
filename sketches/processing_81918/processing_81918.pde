
PGraphics small;
float[] rots;
int rrate = 30;

void setup() {
  size(640,400);
  
  small = createGraphics(320, 200, JAVA2D);
  small.beginDraw();
  small.strokeWeight(2);
  small.background(0, 103, 160);
  small.stroke(124, 180, 224);
  small.loadPixels();
  small.endDraw();
  
  rots = new float[0];
}

void draw() {
  rots = (float[]) 
    append(rots, new float[]{PI*.25, -PI*.25}[(int)random(2)]);
  if(rots.length%936==0) rots = subset(rots, 39);
  image(small.get(), 0,0, width,height);
  small.beginDraw();
  small.background(0, 103, 160);
  for(int a=0; a<rots.length; a++) {
    float cur = rots[a];
    int pos = a*8;
    int xx = (pos%(small.width-8))+8;
    int yy = (floor(pos/(small.width-8))+1)*8;
    small.line(
      xx+cos(cur+PI)*5, yy+sin(cur+PI)*5,
      xx+cos(cur)*5, yy+sin(cur)*5);
    if(frameCount%rrate==0) rots[a] += PI*.25;
  }
  small.endDraw();
}

void keyTyped() {
  if(key == '-' || key == '_') rrate++;
  if(key == '=' || key == '+') rrate--;
  rrate = max(rrate, 5);
  rrate = min(rrate, 30);
  println(rrate);
}

