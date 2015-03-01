
float angle = 0.0;
float offset = 0;
float scalar = 130;
float speed = 0.05;
int radius = 40;
float x = 110;
int direction = 1;
int time1 = 2000;
int time2 = 4000;
int time3 = 6000;
int time4 = 8000;
int time5 = 10000;
void setup() {
  size(800, 500);
  smooth();
  ellipseMode(RADIUS);
  fill(0);
}
void draw() {
  int currentTime = millis();
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
   fill(0, 0, 255);
  ellipse( x+220, y+175, 30, 30);  //blue
  if (currentTime > time1) {
  fill(255, 255, 0);
  ellipse( x+300, y+320, 30, 30);  //yellow
  }
  if (currentTime > time2) {
  fill(0);
  ellipse( x+400, y+175, 30, 30);  //black
  }
  if (currentTime > time3) {
  fill(34, 139, 34);
  ellipse( x+500, y+320, 30, 30);  //green
  }
  if (currentTime > time4) {
  fill(255, 0, 0);
  ellipse( x+575, y+175, 30, 30);  //red 
  }
  angle += speed;

}
