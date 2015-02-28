

color[] skyBlue = {#8BB5F0, #428AED, #346CBA, #1E406D, #3F536D};
float lineLength = width/5;
float angle = 45;
float angleSpeed = 7;
PImage img;

void setup() {
  size(425, 425);
  background(215);
  smooth();
  img = loadImage("start_img.jpg");
  image(img, 0, 0);
}

void draw() {
  if (mouseButton == LEFT){
  pushMatrix();
  strokeWeight(0.3);
  stroke(skyBlue[int(random(1, 5))]);
  translate(mouseX,mouseY);
  rotate(radians(angle));
  line(0, 0, lineLength, 0);
  lineLength = random(width/4, height/2);
  popMatrix();
  angle += angleSpeed-10;
}
}

void mousePressed(){background(215);} //click to clear


