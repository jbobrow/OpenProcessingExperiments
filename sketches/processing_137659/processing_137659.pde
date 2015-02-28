

private float red = random(0, 255);
private float green = random(0, 255);
private float blue = random(0, 255);

void setup() {
  size(900,900);
  background(255);
  smooth();
}

void draw() {
  translate(width/2, height/2);
  for (int i =0 ; i < height; i++) {
    figure();
    rotate(-PI/25);
    scale(0.99);
  }
}

void figure() {
 fill(red, green, blue, 200);
 ellipse(width/4,height/4,width/2,height/2);
 red = red >= 250 ? 247 : red <= 10 ? 12 : red + random(-10, 10);
 green = green >= 250 ? 247 : green <= 10 ? 12 : green + random(-10, 10);
 blue = blue >= 250 ? 247 : blue <= 10 ? 12 : blue + random(-10, 10);
}
