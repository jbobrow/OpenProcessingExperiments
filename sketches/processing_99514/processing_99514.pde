
void setup() {
  size(640, 360, P3D);
  fill(204);
}

void draw() {
  background(13, 22, 104); 
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(57, 66, 144, -dirX, -dirY, 0);
  ambientLight(36, 43, 111, width/2, height, 0);
  translate(width/2 - 200, height/2, 0);
  box(80, 100, 120);
  translate(100, 0, 20); 
  box(80, 100, 80);
  translate(220, -40, -25);
  box(100, 200, 90);
  translate(160, 60, 9);
  box(200, 75, 100);
  translate(-570, -60, -50);
  box(70, 200, 70);
  translate(100, 0, 0);
  box(70, 160, 70);
  translate(600, 0, 0);
  box(110, 90, 70);
  translate(-100, 0, 0);
  box(80, 140, 70);
  translate(-310, 40, 46); //moves draw cursor to center of screen
  translate(-50, 410, -10);//moves draw cursor 3/4 down the screen and in front of everything else
  box(800, 680, 600);
}



