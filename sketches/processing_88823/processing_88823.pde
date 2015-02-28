
String myDrawing = "Draw Shapes";
float randomX;
float randomY;
boolean rectangleToggle = false;

void setup() {
  size(800, 800);
  background(0, 255, 0);
}

void draw() {
  stroke(255, 0, 0);
  fill(255, 255, 255);
  if (rectangleToggle==true) {
    fill(0, 0, 255);
    rect(mouseX, mouseY, 200, 80);
  }
  else {
    rect(mouseX, mouseY, 80, 80);
  }
}

void keyPressed() {
  if (key=='e') {
    noStroke();
    fill(0, 0, 0);
    //draw an ellipse in a random place
    randomX = random(800);
    randomY = random(800);
    ellipse( randomX, randomY, 80, 80);
  }

  if (key=='t') {
    //change shape from square to rectangle
    if (rectangleToggle==true) {
      rectangleToggle=false;
    }
    else {
      rectangleToggle=true;
    }
  }
}

void mousePressed(){
background(0,0,0);

}


