
void setup() {
  size (800,800);
  background(255);
}
void draw() {
  float a = mouseX;
  float b = mouseY;
  float radius = a*0.1;
  float cx = width/2;
  float cy = height/2;
  float px = cx;
  float py = cy;
  for (int deg = 0; deg < 360*7; deg += 12) {
    float angle = radians(deg);
    float x = cx + (sin(angle) * radius);
    float y = cy +(cos(angle) * radius);
    stroke(a/4,50,b/4,50);
    noFill();
    rect(x,y/3,x/4,x/4);
    rect(x/2,y,x/4,x/4);
    rect(x,y,x/3,x/3);
    radius = radius*2.5;
    px = x;
    py = y;
  }
} 






