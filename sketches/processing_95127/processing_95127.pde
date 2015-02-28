
void setup() {
  size(200, 200);
  background(255);
}

void draw() {
  float x = random(0, width); 
  float y = random(0, height);

  if ((x>50 && x<150) && (y>50 && y<150)) {
    ;}
    else{
      noStroke();
      fill(x,y,0);
      ellipse(x, y, 10, 10);
    }
}


