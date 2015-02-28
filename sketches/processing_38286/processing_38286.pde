
void setup() {

  background(175);
  size(500, 500);
  smooth();

  for ( float x=0; x<width;x+=5) {//these two for loops are creating the dot gradient background so that it appears at start up
    for ( float y=0;y<width;y+=5) {
      colorMode(RGB);
      stroke(x, y, width);
      strokeWeight(2);
      point(x, y);
    }
  }
}


void draw() { //starts a draw loop that will repeat; rectangle bars are from the top to the bottom and continually repeat because they're in the loop; if the mouse is pressed the fill changes to a random shade of gray

  colorMode(RGB);

  if (mousePressed==true) {

    fill(random(175, 250));
    for (float recx = 12.5; recx <=  500; recx+=50) {
      rect(recx, 0, 25, height);
    }
  }
}


void mouseClicked() {//when the mouse is clicked circles are drawn at random Y coordinates within the rectangle bars
  for (float centerX = 25; centerX<=500; centerX+=50) {
    if (random (2)>1) {//asks the computer to randomly choose 1 or 2; if 2 is chosen the circle is filled with blue
      fill(0, random(100, 150), random(200, 255));
    }
    else {//if the computer chooses 1 there is no fill 

      noFill();
    }
    ellipse(centerX, random(height), 25, 25);
  }
}


//the drawing machine starts up with a dot gradient background
//the user must initiate the drawing machine with a click of the mouse
//a click of the mouse creates a permanent rhythm of rectangle bars that extend from the top of the canvas to the bottom and places a circle in each of the vertical bars at a random y coordinate
//the click of the mouse also changes the in-fill of the rectangle to a random gray scale value as well as changes the in-fill of the circles to either a shade of blue or no fill at all


