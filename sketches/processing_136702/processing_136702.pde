
Camera worldCamera;

void setup() {
  size(640, 640);
  worldCamera = new Camera();
}

void draw() {
  background(255);
  //for the camera to work evrything must be done after you translate by its negative position
  //You make it negative so it works the right way, left is left and up is up
  translate(-worldCamera.pos.x, -worldCamera.pos.y);
  worldCamera.draw();
  fill(255, 0, 0);
  rect(25, 25, 25, 25);
}

class Camera {
  PVector pos; //Camera's position 
  //The Camera should sit in the top left of the window

  Camera() {
    pos = new PVector(0, 0);
    //You should play with the program and code to see how the staring position can be changed
  }

  void draw() {
    //I used the mouse to move the camera
    //The mouse's position is always relative to the screen and not the camera's position
    //E.g. if the mouse is at 1000,1000 then the mouse's position does not add 1000,1000 to keep up with the camera
    //if (mouseX < 100) pos.x-=5;
    //else if (mouseX > width - 100) pos.x+=5;
    // if (mouseY < 100) pos.y-=5;
    //else if (mouseY > height - 100) pos.y+=5;
    //I noticed on the web the program struggles to find the mouse so I made it key pressed
    if (keyPressed) {
      if (key == 'w') pos.y -= 5;
      if (key == 's') pos.y += 5;
      if (key == 'a') pos.x -= 5;
      if (key == 'd') pos.x += 5;
    }
  }
}



