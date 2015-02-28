
float a = 234;
float b = 255;
float c = 10;

float x = 5;
float y = 5;
void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  for( x = 5; x < width - 5; x = x + 75) {
    for( y = 5; y < height; y = y + 75) {
      //fill(234, 255, 10);
      //noStroke();
      //ellipse( x + 20, y + 20, 15, 15);
      stroke(a, b, c);
      line(x + 20, y + 20, mouseX, mouseY);
    }
  }
  if(mousePressed){
    a= random(255);
    b= random(255);
    c= random(255);
    frameRate(400);
  }
}
