
//Miles Thomas, 9/7/11, repaint the hallway
//The circle and the walls will change color with a mouse press

void setup() {
  size(300, 300);
}


void draw() {
  //float c modifies the random interval of the x position of the ellipse
  //float d modifies the random interval of the y position of teh ellipse
  float c = random(0, 300);
  float d = random(0, 300);

  stroke(4);

  //If the mouse is pressed the fill of the yellow ceilings change to red
  if (mousePressed == true) {
    fill(255, 0, 0);
  } 
  else {
    fill(255, 255, 0);
  }
  quad(0, 0, 300, 0, 225, 75, 75, 75);
  quad(0, 300, 75, 225, 225, 225, 300, 300);


  //If the mouse is pressed the red walls change to yellow
  if (mousePressed == true) {
    fill(255, 255, 0);
  }
  else {
    fill(255, 0, 0);
  }
  quad(0, 0, 75, 75, 75, 225, 0, 300);
  quad(300, 0, 300, 300, 225, 225, 225, 75);


  //If the mouse is pressed the blue square turns green
  if (mousePressed == true) {
    fill(0, 255, 0);
  } 
  else {
    fill(0, 0, 255);
  }
  quad(75, 75, 225, 75, 225, 225, 75, 225);


  //If the mouse is pressed the yellow circle becomes red
  noStroke();
  if (mousePressed == true) {
    fill(255, 0, 0);
  }
  else {
    fill(255, 255, 0);
  } 
  ellipse(c, d, 20, 20);
  ellipse(c, d, 20, 20);
  ellipse(c, d, 20, 20);
  ellipse(c, d, 20, 20);
  ellipse(c, d, 20, 20);
}


