
// Box in a room.
//The box moves in the horizontal direction following the mouse's
//position and when the mouse is pressed, the light turns on , the room
//turns light gray and the box turns red.
boolean lightIsOn;

void setup() {
  size(500, 500);
  smooth();
  lightIsOn = false;
}


// interaction
void mousePressed() {
  lightIsOn = !lightIsOn;
}
//After this command, when the mouse is pressed
//the light turns on and all the scene is changed.


void draw() {

  // box dark
  background (0);
  stroke(255);
  strokeWeight(1);
  fill(0);
  rect(mouseX, 290, 60, 60);
  fill(0);
  quad(mouseX, 290, mouseX + 30, 280, mouseX + 90, 280, mouseX + 60, 290);
  fill(0, 0, 0);
  quad(mouseX + 60, 290, mouseX + 90, 280, mouseX + 90, 340, mouseX + 60, 350);

  //light off

  strokeWeight(1);
  stroke(255);
  line( 250, 140, 250, 0);
  strokeWeight(0);

  fill(255, 255, 121, 80);
  ellipse (250, 150, 20, 20);


  if (lightIsOn) {
    background (240);


    // box red
    fill(138, 16, 21);
    rect(mouseX, 290, 60, 60);
    fill(237, 28, 36);
    quad(mouseX, 290, mouseX + 30, 280, mouseX + 90, 280, mouseX + 60, 290);
    fill(190, 22, 23);
    quad(mouseX + 60, 290, mouseX + 90, 280, mouseX + 90, 340, mouseX
      + 60, 350);

    //light on
    strokeWeight(1);
    stroke(10);
    line( 250, 150, 250, 0);
    strokeWeight(0);
    fill(255, 255, 121);
    ellipse (250, 150, 20, 20);
    fill(255, 255, 121, 20);
    ellipse (250, 150, 40, 40);
  }
}
