
//ref . eunbee

void setup() {
  size(400, 400);
  
}
 
void draw() {
  fill(#8BBCFF);
  ellipse(200, 200, 300, 300);
  ellipse(200, 200, 50, 50);
  noFill(); 
  stroke(#000000);
  strokeWeight(5);
  ellipse(200, 200, 300, 300);
   
  for (int i = 0; i < 12; i++) {
    float dx = cos(i * TWO_PI / 12);
    float dy = sin(i * TWO_PI / 12); 
    line(200 + 130 * dx, 200 + 130 * dy, 200 + 140 * dx, 200 + 140 * dy);
  }
  
  strokeWeight(8);
  drawHand(80, hour(), 12);
   
  strokeWeight(5);
  drawHand(140, minute(), 60);
   
  strokeWeight(2);
  stroke(#4374D9);
  drawHand(140, second(), 60); 
}
 
void drawHand(float radius, float value, float divider) {
  float x = 200 + radius * cos(value * TWO_PI / divider - PI / 2.0f);
  float y = 200 + radius * sin(value * TWO_PI / divider - PI / 2.0f); 
  line(200, 200, x, y);
}
