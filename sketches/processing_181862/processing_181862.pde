
float xTriangle1 = 100;
float yTriangle1 = 50;
float yTriangle2 = 240;
float POS = 127;
int vel = 2;


void setup () {
  size (255, 255);
}

void draw () {
  background (119, 17, 237);
  fill(0, 0, 0, mouseX/2);
  ellipse ( POS, height/2, width-200, height-200);
  POS = POS + vel;

  if (POS>=255) {
    vel = - vel;
  }
if (POS<=0){
  vel = - vel;
}

  fill (height, width, mouseX);
  triangle (mouseX*0.20, mouseY, mouseX*0.20, mouseY*0.20, xTriangle1, mouseY*0.20);

  fill (height/4, width/4, mouseX);
  triangle (yTriangle1+6, mouseY, mouseX, yTriangle2, mouseX, xTriangle1+6);

  fill(height/2, width/2, mouseX);
  triangle (mouseX*0.30, mouseY*0.30, xTriangle1, yTriangle2, mouseX*0.30, yTriangle2);
}
