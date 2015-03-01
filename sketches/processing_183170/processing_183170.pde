
void setup() {
  size(640, 640);
  noFill();
}

void draw() {
  background(20);
  /* Adjust for loops as they need adjusting for perforce on the web */
  for (int i = 0; i < 360; i+=72) {
    float x = width/2 + sin(radians(i+frameCount)) * 75;
    float y = height/2 + cos(radians(i+frameCount)) * 75;
    stroke(255);
    strokeWeight(2);
    /* Inner glow */
    arc(x, y, 150, 150, PI-radians(180+i-frameCount), TWO_PI-radians(180+i-frameCount));
    for(int q = 2; q < 10; q+=2){
      strokeWeight(q*2);
      stroke(255, 150, 0, 25);
      /* Outer fade */
      arc(x, y, 150, 150, PI-radians(180+i-frameCount), TWO_PI-radians(180+i-frameCount));
    }
  }
}



