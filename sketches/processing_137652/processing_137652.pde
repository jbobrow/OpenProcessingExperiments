

private float red = random(0, 255);
private float green = random(0, 255);
private float blue = random(0, 255);
private boolean completed = false;

void setup() {
  size(800,800);
  background(255);
  smooth();
  noStroke();
}

void draw() {
 if (mousePressed || keyPressed) {
   completed = false;
 }
 if (!completed) {
   translate(width/2, height/2);
   for (int i =0 ; i < height; i++) {
     figure();
     rotate(-PI/25);
     scale(0.99);
   }
   completed = true;
 }
}

void figure() {
 fill(red, green, blue, 200);
 ellipse(width/2,height/2,width/1.5,height/1.5);
 red = red >= 250 ? 247 : red <= 10 ? 12 : red + random(-10, 10);
 green = green >= 250 ? 247 : green <= 10 ? 12 : green + random(-10, 10);
 blue = blue >= 250 ? 247 : blue <= 10 ? 12 : blue + random(-10, 10);
}
