
int dragX, dragY, moveX, moveY;


void setup (){
  size (300, 300);
  smooth ();
  noStroke();
  
  
}

void draw (){
  background (255);
  fill (60, 3, 82, 150);
  ellipse (dragX/2, dragY/2, 300, 300);
  ellipse (dragX, dragY, 150, 150);
  fill (244, 245, 49, 100);
  rect (moveX/2, moveY/2, 300, 300);
  rect (moveX, moveY, 200, 200);
  }



void mouseMoved () {
  moveX= mouseX;
  moveY = mouseY;
  
}

void mouseDragged () {
  dragX = mouseX;
  dragY = mouseY;
  
}



