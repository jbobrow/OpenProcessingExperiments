
int value1 = int(random(255));
int value2 = int(random(255));
int value3 = int(random(255));
boolean dragged = false;
boolean changeBG = false;
int bg1 = 0;
int bg2 = 0;
int bg3 = 255;

int selected_shape = 0;
final int RECTANGLE = 0;
final int TRIANGLE = 1;
final int CIRCLE = 2;
final int RAND = 3;


void setup() {
  size(400, 400);
  mouseX = int(random(255));
  mouseY = int(random(255));
}

void draw() {
  if(keyPressed && changeBG) background(bg1, bg2, bg3);
  if (dragged) {
    fill(value1, value2, value3);
    if( selected_shape == RECTANGLE)  rect(mouseX, mouseY, 20, 20); 
    else if (selected_shape == TRIANGLE) triangle(mouseX-10, mouseY, mouseX+10, mouseY, mouseX, mouseY-10);
    else if(selected_shape == CIRCLE) ellipse(mouseX, mouseY, 20, 20);
    else if(selected_shape == RAND) {
      int rand = int(random(3));
      if( rand == 0)  rect(mouseX, mouseY, 20, 20); 
      else if (rand == 1) triangle(mouseX-10, mouseY, mouseX+10, mouseY, mouseX, mouseY-10);
      else if(rand == 2) ellipse(mouseX, mouseY, 20, 20);
    }
  }
}

void mouseReleased() {
  dragged = false;
}

void keyPressed() {
 if (key == 'r' || key == 'R') {
  bg1 = 255;
  bg2 = 0;
  bg3 = 0;
  changeBG = true;
 }
 else if (key == 'g' || key == 'G') {
  bg1 = 0;
  bg2 = 255;
  bg3 = 0;
  changeBG = true;
 }
 else if (key == 'b' || key == 'B') {
  bg1 = 0;
  bg2 = 0;
  bg3 = 255;
  changeBG = true;
 } else if(key == 'c' || key == 'C') {
   selected_shape = CIRCLE;
   changeBG = false;
 } else if(key == 'e' || key == 'E') {
   selected_shape = RECTANGLE;
   changeBG = false;
 } else if(key == 't' || key == 'T') {
   selected_shape = TRIANGLE;
   changeBG = false;
 } else if(key == 'x' || key == 'X') {
   selected_shape = RAND;
 }
}

void mouseDragged() {
  dragged = true;
  value1 = value1 + 5;
  value2 = value2 + 10;
  value3 = value3 + 30;
  if (value1 > 255) {
    value1 = 0;
  } 

  if (value2 > 255) {
    value2 = 0;
  }

  if (value3 > 255) {
    value3 = 0;
  }
}


