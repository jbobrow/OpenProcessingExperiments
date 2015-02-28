
int angle = 0;

void setup() {
  size(300, 500, P2D);
  background(150,200,200);
  smooth();
  noStroke();
  fill(0, 102);
} 

void draw() {

  // Draw only when mouse is pressed
  // Remixed by Chrisir

  float posX=0.0;
  float posY=0.0;

  float mouseXSave=0.0;
  float mouseYSave=0.0;

  if (mousePressed == true) {
    angle += 10; 

    mouseXSave=mouseX;
    mouseYSave=mouseY;

    stroke(0,253,2);
    line (mouseXSave, mouseYSave,mouseXSave-5, mouseYSave+46);
    noStroke();

    float val = cos(radians(angle)) * 20.5;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(mouseYSave,15,150);
      posX=mouseXSave + xoff;
      posY=mouseYSave + yoff;
      ellipse(posX, posY, val, val);
    } 
    fill(227,mouseXSave,16);
    ellipse(mouseXSave, mouseYSave, 4, 4);
  } 
}


