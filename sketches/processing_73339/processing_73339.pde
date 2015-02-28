
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  fill(100, 200, 150);
  smooth();
}
void draw(){
  drawPolygon(5,300,300,200);
}
void drawPolygon(int sides, int locationX, int locationY, int sz) {
  
  beginShape();
  for (int i=1; i<=sides; i++) {
    float angle= 360/sides;
    if (i%2==0&&sides;%2==0) {
      vertex(locationX+ sz *cos(radians(angle*i)), locationY+ sz *sin(radians(angle*i)));
    }
    else
    {
      vertex(locationX + sz/2.5 * cos(radians(angle * i)), locationY + sz/2.5 * sin(radians(angle * i)));
   }
  }
  endShape(CLOSE);
}
