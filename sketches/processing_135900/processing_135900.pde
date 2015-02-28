
int numCircles= 7; // easy to change my drawing "brush" by changing how many circles it draws at one time

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
}

void keyPressed() { //hit the "s" key and save my image
  if (key=='s')
  {
    saveDrawing();
  }
}

void mouseClicked() { //when I click the mouse draw me some circles with the same center point
  drawCircles(numCircles); //using a variable here gives me flexibility in how I structure my program
}


void drawCircles(int numberOfCircles) { //having the function accept this parameter is key to allowing me to iterate options easily
  ellipseMode(CENTER);
  noFill();

  for (int i = 0; i < numberOfCircles; i++)  //this line of code is what determines how many circles will be drawn
  {
    strokeWeight(int(random(1, 10)));
    int transparency = int(random(10, 100));
    stroke(0, transparency);
    ellipse(mouseX, mouseY, int(random(5, 155)), int(random(5, 155)));
  }
}

void saveDrawing() {
  saveFrame("images/circles-###.png"); //when running on the web it will put the PNG in a new browser tab
}

