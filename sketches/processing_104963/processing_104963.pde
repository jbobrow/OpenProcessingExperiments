
//this is to give an example about 
//how to avoid a square to appears on the 0, 0 of the window corner
int sz;
int posX = 0;
int posY = 0;

void setup() {
  size(400, 400);
  background(200, 200, 0);
  sz = 50;
}

void draw() {
// this statement is asking if the mouses are in 0, 0 
// mouseX and mouseY starts w/this value if is not inside the window.
  if (mouseX ==0 && mouseY ==0) {
// if yes, the initial value is "something" to put the rect() outside the window 
    mouseX = -60;
    mouseY = -60;
  }
  // If mouseX and mouseY are different than 0, then ask for its new position
  // and it draws the rect()
  else {
    rect(posX, posY, sz, sz);
  }
  // And here we ask for the  position again and again...
  posX = mouseX;
  posY = mouseY;
}



