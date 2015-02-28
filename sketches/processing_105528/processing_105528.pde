
PImage nature;
PFont perpetua48;

void setup() {
  size(450, 600);
  nature = loadImage("nature.jpg");
  smooth();
  perpetua48 = loadFont("Perpetua48.vlw");
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  float distance = dist(mouseX, mouseY, width/2, height/2);
  int size = int(random(10, 50));
   image(nature,0,0,448,600);
  textFont(perpetua48);
  for (int i = 0; i < 100; i++) {
      // println(i); 
  text("nature", 300, 580);
  fill(0,255,0);
  ellipse(random(width),random(height), 10, 10);
}}
