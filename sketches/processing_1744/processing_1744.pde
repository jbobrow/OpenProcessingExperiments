
float b = 0;
float c = 50;
void setup() {
  size(600, 600);
  background(0);
  ellipse(width/2, height -75, 700, 400);
  smooth();
}

void draw() {
  translate(width/2, height);  
  strokeWeight(2);
  stroke(mouseX, 0, 0);
  fill(mouseX, mouseY, 62);
  filter(BLUR, 0.58);
  ellipse(0, b - 75, noise(b) * 3 * c, c);
  b -= 4;
  c += random(-3, 3);
  if (b < -height/2) {
   if (c < 75) {
    c = 150;
   }
  }
  if (b < -height + height/3) {
    filter(INVERT);
    noStroke();
    //create 'hole' at top of vase
    fill(0, 50);
    ellipse(0, b - 45, 175, 75);
    noLoop();
  }  
 }

