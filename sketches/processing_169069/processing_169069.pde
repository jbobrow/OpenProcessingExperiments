
void setup() {
 size(600,600);
 PFont font = loadFont("Impact-48.vlw");
 frameRate(10);
 colorMode(HSB);
}

void draw() {
 float x = random(200, 210);
 float y = random(200, 255);
 float z = random(200, 255);
 background(x, y, z);
 
 for(int i = 0; i < 10; i++) {
  float size = random(20, 50);
  float hue = random(0, 255);
  float option = random(0, 3);
  float a = random(0, 150);
  float b = random(0, 150);
  textSize((int)size);
  fill((int)hue, 255, 255);
  textAlign(CENTER);
  if((int)option == 0) text("Wow!", mouseX + (int)a, mouseY + (int)b);
  else if((int)option == 1) text("Yeah!", mouseX + (int)a, mouseY + (int)b);
  else if((int)option == 2) text("Oh!", mouseX + (int)a, mouseY + (int)b);
  else text("Awesome!", mouseX + (int)a, mouseY + (int)b);
 }
}
