



void setup() {
  size(900,900);background(0);
}
void draw() {
  float x = random(900);
  float y = random(900);
  float distancia = dist(width/9, height/100, x, 40);
  if (distancia<0.8) {
   fill(206,89,0);
  }else{
    fill(147,10,20,5);
  }
   ellipse(450, 450,x, y);
}

