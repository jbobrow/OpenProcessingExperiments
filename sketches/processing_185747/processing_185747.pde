
void setup() {
  size(400, 400);
}
void draw() {
  float x = random(600);
  float y = random(600);
  float distancia = dist(width/2, height/2, x, y);
  if (distancia<100) {
   fill(0);
  }else{
    fill(255);
  }
   ellipse(x, y, 10, 10);
}

