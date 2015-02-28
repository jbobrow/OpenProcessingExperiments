
void setup(){
    size(800,500);
    background(255);
    noStroke();
}

void draw(){
  float x = random(width);
  float y = random(height);
  float s = random(800);
  float a = random(255);
  color c = color(random(255),random(255),random(255));
  fill(c,a);
  ellipse(x,y,s,s);
}
