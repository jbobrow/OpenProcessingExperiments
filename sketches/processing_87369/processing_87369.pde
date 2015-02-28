
void setup() {
  size(640, 360);
  background(20);
  noStroke();
  noLoop();
}

void draw() {
  drawTarget(width*0.5, height*0.3, 400, 8);
  drawTarget(width*0.85, height*0.6, 350, 9);
  drawTarget(width*0.60, height*0.2, 130, 12);
  drawTarget(width*0.1, height*0.8, 450, 15);
}

void drawTarget(float xloc, float yloc, int size, int num) {
 // float grayvalues = 255/num;
 int r =47;
 int g =10;
 int b =13;
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    fill(i*r, i+g, i/b);
    ellipse(xloc, yloc, size - i*steps, size - i*steps);
    r++;
    g=+3;
    b=+5;
    
    //for()
  }
}



