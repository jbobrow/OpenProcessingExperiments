


void setup () {
  size (400, 300);
  // frameRate(5);
  colorMode(HSB);
  noLoop();
}



void draw () {
  float x = random(1, 100);
  println(x);
  if (x <= 50) {
    // 50% chance
    strokeWeight(20);
  }
  else if (x > 50 && x <= 80) {
    // 30% chance
    strokeWeight(10);
  }
  else {
    // 20% chance
    strokeWeight(2);
  }
  ellipse(width/3, height/2, 50, 50);
  ellipse(width/2, height/2, 50, 50);
  ellipse(width-width/3, height/2, 50, 50);
}
