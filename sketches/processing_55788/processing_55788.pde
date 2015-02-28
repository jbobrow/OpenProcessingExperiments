
/*

Creature Thing...
  The eye follows you!
  When the mouse is clicked, the background color changes.
  When the eye's in pain, his mouth opens!
  
... It really isn't as exciting as I make it seem.

*/

Eye eye1; 
Eye eye2;

float bg1;
float bg2;
float bg3;

void setup() {
  size(640, 480); 
  smooth();

  eye1 = new Eye(220, 160, 100);
  eye2 = new Eye(400, 160, 100);

  bg1 = 0;
  bg2 = 255;
  bg3 = 0;
}

void draw() {
  background(bg1, bg2, bg3);


  eye1.update();
  eye1.draw();

  eye2.update();
  eye2.draw();

  fill(255);

  if (mouseX > 270 && mouseX < 340 &&
    mouseY > 120 && mouseY < 180) {
    rect(200, 300, 220, 125);
  }
  else {
    rect(200, 300, 220, 25);
  }
}

void mouseClicked() {

  bg1 = random(0, 255);
  bg2 = random(0, 255);
  bg3 = random(0, 255);

  println("MouseX: " + mouseX + "--" + "MouseY: " + mouseY);
}

class Eye {

  int x;
  int y;
  int size;
  float angle; 

  Eye(int xPos, int yPos, int big) {
    x = xPos;
    y = yPos;
    size = big;
  }

  void update() {
    angle = atan2(mouseY - y, mouseX - x);
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(200);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}


