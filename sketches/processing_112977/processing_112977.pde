
int inc = 50;

void setup() {
  size(1000, 500, P2D);
  colorMode(RGB,255,width,255);
}

void draw() {
  
  background(255,0,0);
  noStroke();
  fill(255);
  
  for (float y = 0;y<=height;y+=inc){
  for (float x = 0 ; x <= width ; x += inc) {
    fill(255,x,0);
    rect(x, y,inc,inc, x/50);
}
  }
}
