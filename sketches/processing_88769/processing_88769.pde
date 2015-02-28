
PImage penguin;

void setup() {
  size(640, 480);
  penguin = loadImage("penguin.png");
  frameRate(1);
  imageMode(CENTER);
}
  
void draw() {
  background(0);
   
  image(penguin, mouseX, mouseY, 100, 100);
   
  float x = random(width);
  float y = random(height);
  float c = random(50, 300);
  image(penguin, x, y, c, c);
 
   
   
}


