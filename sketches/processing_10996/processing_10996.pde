
void setup(){
size(500, 500);
colorMode(RGB, 255);
smooth();
background(255, 255, 255);
}

void draw(){
  float d =random(500);
  float f =random(500);
  drawSmille(d, f, 255, 255, 0); 
}

void drawSmille(float x, float y, float r, float g, float b){
  fill(random(255), random(255), random(255));
  ellipse(x, y, 50, 50);
  fill(0, 0, 0);
  ellipse(x - 15, y - 10, 5, 5);
  ellipse(x + 15, y - 10, 5, 5);
  arc(x, y, 20, 20, 0, PI/1);
}

