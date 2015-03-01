
float x1, y1, x2, y2, x3, y3;
PFont f;

void setup() {
  size(500, 500);
  x1 = 0;
  y1 = height;
  x2 = width / 2;
  y2 = height - 433.013;
  x3 = width;
  y3 = height;
  frameRate(15);
  noStroke();
  
  // Create the font
  printArray(PFont.list());
  f = createFont("Helvetica", 30);
  textFont(f);
}

void draw()
{
   background(0);
   fill(255);
   rect(0, 0, width, height);
   drawTriangle(x1, y1, x2, y2, x3, y3, 0);
   
   textAlign(CENTER);
   drawType(width * 0.15);
   drawType(width * 0.85);
}

void drawTriangle(float x1, float y1, float x2, float y2, float x3, float y3, int count) {
  if (count < 7){
    fill(random(0, 255));
    triangle(x1, y1, x2, y2, x3, y3);
    float mid1x2 = (x1 + x2) / 2;
    float mid1y2 = (y1 + y2) / 2;
    float mid2x3 = (x2 + x3) / 2;
    float mid2y3 = (y2 + y3) / 2;
    float mid1x3 = (x1 + x3) / 2;
    float mid1y3 = (y1 + y3) / 2;
    drawTriangle(x1, y1, mid1x2, mid1y2, mid1x3, mid1y3, count + 1);
    drawTriangle(mid1x2, mid1y2, x2, y2, mid2x3, mid2y3, count + 1);
    drawTriangle(mid1x3, mid1y3, mid2x3, mid2y3, x3, y3, count + 1);
  }
}
  
  void drawType(float x) {
    line(x, 0, x, 65);
    line(x, 220, x, height);
    fill(random(0, 255));
    text("hpy", x, 95);
    fill(random(0, 255));
    text("bday", x, 130);
    fill(random(0, 255));
    text("n8d09", x, 165);
}



