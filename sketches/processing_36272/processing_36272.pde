
float x = 0;
float y = 0;
float c = 0;
float b = 0;

void setup() {
  
  size (700,500);
  background (255);
  //frameRate(500);
  loop();
  
  
}

void draw() {
  x = random (40);
  y = random (50);
  c = random (255);
  b = random (255);
  
 // background(255);
  fill (c,c,c);
  rect (mouseX, mouseY, x, y);
  fill (255,255,255,20);
  rect(0,0,1000,1000);

if (mouseButton == LEFT) {
  
fill (b,0,0);
 rect(mouseX, mouseY, x, y);}

}


