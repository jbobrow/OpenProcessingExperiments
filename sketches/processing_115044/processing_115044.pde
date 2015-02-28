
void setup() {
  size (1500, 1500);
  background(255);
}

void draw() {
  //  for (int i = 110; i <= 950; i = i + 180) {
  //    for (int a = 110; a <= 950; a = a + 180) {
  //      circle(i, a, 150, 0, 0);
  //    }
  //  }
  circle(width/2, height/2, 300, 0, 0);
}

void circle(float posx, float posy, float big, int rtm, int angle) {
  ellipse(posx, posy, big, big);
  big = big/5;
  line(posx, posy, cos(radians(angle+ 6*(3*millis()/(50*pow(60, rtm))))) * big*2 + posx, sin(radians(angle+ 6*(3*millis()/(50*pow(60, rtm))))) * big*2 + posy);
  if (big >= 1) {
    for (int degree = 0; degree <= 360; degree = degree + 30) {
      float b;
      b = 3 + 3*millis()/(50*pow(60, 3));
      float a = map(degree, 0, 360, 3, b);
      circle(cos(radians(degree))*big*(a) + posx, sin(radians(degree))*big*(a) + posy, big, rtm + 1, degree);
    }
  }
}
