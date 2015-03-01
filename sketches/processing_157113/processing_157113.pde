
void setup(){
  size(500, 500);
  background(0);
  noStroke();
}


void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    background(0);
  }
  //if it's not a letter key, clear the screen
  else
  if (key == 'b') {
    fill(133, 255, 255);
  }
  if (key == 'r') {
    fill(255, 163, 133);
  }
  if (key == 'w') {
    fill(255);}
  if (key == 'g') {
    fill(194, 255, 133); }
  if (key == 'p') {
    fill(194, 133, 255);
}
  if (key == 'e') {
    fill (0);}

}

void draw() {  
   if (mousePressed && (mouseButton == LEFT)) {
 ellipse(mouseX, mouseY, 10, 10); }
  if (mousePressed && (mouseButton == RIGHT)) 
{rect(mouseX, mouseY, 20, 20); }
}



