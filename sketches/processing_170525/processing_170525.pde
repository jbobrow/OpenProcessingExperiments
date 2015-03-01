
boolean button = false;
int x = 50, y = 50, w = 100, h = 75;  

void setup() {
  size(200, 200);
}
void keyPressed() {
  background(random(255), random(255), random(255));
}

void draw() {
  fill(random(255), random(255), random(255), 100);
// the rect is where you press to change color of face
  if (button)
      fill(random(255), random(255));
      rect(50,50,100,100);
  for (int i =0; i< 200; i +=50) {
      drawFace(mouseX + i, mouseY + i, 0+1);
  }
}
void drawFace(int x, int y, color c) {
  color(c);
  rect(x, y, 50, 50); // face(body)
  fill(random(255), random(255));// only two arguments because we wanted it to be see through
  ellipse(x+15, y+25, 20, 30);// left eye

  ellipse(x+35, y+25, 20, 30);//right eye
}



void mousePressed() {
if (mouseX > x   && mouseY > y   && // if mouse is over the rect and its clicked, change color
      mouseX < x + w && mouseY < y + h) 
      button = !button;
}

