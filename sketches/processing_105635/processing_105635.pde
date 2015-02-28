
void setup () {
  size(800, 800);
  background(255);
  //xdistance = x + 5;
}

void draw() {

  for (int i = 1; i < 7; i++) {
    fill (128);
    ellipse(i*75, 250, 50, 50);
    if(dist(i*75, 250, mouseX, mouseY) <= 25) {
      fill(255);
     ellipse(i*75, 250, 50, 50);
//    float ellipsed = dist(75, 250, mouseX, mouseY);
   //  if (dist == 25) {
//        fill(255);
//      }
    }
  }
}
