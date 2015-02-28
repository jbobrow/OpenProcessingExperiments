

int T = 0;

void setup() {
  size(450, 400);
  println("Can someone please tell me where to find the Misses? ");
  frameRate(300);
}

void draw() {
  background(255);
  fill(255);
  ellipse(mouseX, mouseY, 60, 60);
  float Angle = 45*(1+sin(radians(T%360)))/2;
  T++;
  fill(255, 200, 0);
  stroke(0);
  strokeWeight(3);
  smooth();
  arc(200, 200, 300, 300, radians(Angle), TWO_PI-radians(Angle));  
  line(200, 200, 200+150*cos(radians(Angle)), 200-150*sin(radians(Angle)));
  line(200, 200, 200+150*cos(radians(Angle)), 200+150*sin(radians(Angle)));
  fill(0);
  ellipse(175, 125, 30, 30);
//  println("My mouth is open " + Angle*2 + " degrees");
}

