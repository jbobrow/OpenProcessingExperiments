
//move your mouse
//by Xinhan Yen, archi730@hotmail.com

void setup() { 
  size(480, 480);
  fill(255);
  if (mousePressed) {
    fill(255);
  }
}


void draw() {
  if (mousePressed) {
    ellipse(mouseX, mouseY, 50, 50);
    fill(mouseX/3, mouseY*2, mouseX/2, 80);
  } 
  else {
    rectMode(CENTER);
    rect(width/2, height/2, mouseX/5, mouseY/5);
  }
}

void keyPressed() {
  saveFrame("screen-###.png");
}



