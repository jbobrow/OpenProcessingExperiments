
int fc, col, step, cols, frames=120;
float theta;
boolean save=false;

void setup() {
  size(540, 540);
  cols = 25;
  step = int(width/cols);
}

void draw() {
  background(20);
  noStroke();
  fill(#FFD900);
  float px = width/2 + cos(theta)*width/3 ;
  float py = height/2+sin(theta*2)*height/3;  
  //ellipse(px, py, 20, 20);
  for (int x = step*4; x<width-step*4; x+=step) {
    for (int y = step*4; y<height-step*4; y+=step) {
      float dx = px-x;
      float dy = py-y;
      float distance = dist(x, y, px, py);
      float sz = map(distance, 0, width/2, 19, 10);
      float a = map(distance, 0, width*.7, 0, 255);
      pushMatrix();
      translate(x, y);
      fill(#FFD900);
      ellipse(0, 0, sz, sz);
      fill(20,a);
      ellipse(0, 0, sz/2, sz/2);
      popMatrix();
    }
  }
  theta += TWO_PI/frames;
  if (save && frameCount<=fc+frames) saveFrame("image-###.gif");
}

void keyPressed() {
  fc = frameCount;
  save=true;
}

