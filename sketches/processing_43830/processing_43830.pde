
float px = 256, py = 256;
float dx = 0, dy = 0;

void setup() {
  size(512, 512);
  smooth();
}

void star(float x, float y) {
  
  strokeWeight(1);
  background(0);  
  stroke(#FFF000);
  fill(#000FFF);
  ellipse(256,256,512,512);
  fill(#FFF000);  

  float spokes = 30;
  float step = TWO_PI/spokes;
  float r = 256; // > sqrt(256^2 + 256^2)
  for (int i = 0; i < spokes; i =  i + 1) {
    float ox = width/2.0 + r * cos((float)i * step);
    float oy = height/2.0 + r *sin((float)i * step);
    line(ox,oy,x,y);
  }

  ellipse(x, y, 55, 55);
  fill(0);
  ellipse(x+10, y-10, 10, 10);
  ellipse(x-10, y-10, 10, 10);
  noFill(); 
  stroke(0);
  strokeWeight(5);
  arc(x, y+5, 30, 30, 0, PI);
}

void draw() {

  if (mousePressed) {
    px = mouseX;
    py = mouseY;
  } 
  else {
    dx += (256.0 - px)/50.0;
    dy += (256.0 - py)/50.0;  
    dx *= .994; 
    dy *= .994;
    px += dx;
    py += dy;
  }

  star(px, py);
}


