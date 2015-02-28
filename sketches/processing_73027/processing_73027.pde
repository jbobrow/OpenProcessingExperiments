
PImage unicorn;
float mapsize;
color mapcolor;
float step;
float pixX, pixY;
float maxDist;
float enlarge = 1.25;

void setup() {
  unicorn = loadImage("unicorn.jpg");
  size(692,800);
  noStroke();
  rectMode(CENTER);
  maxDist = sqrt(width * width + height * height);
  
}

void draw() {
  background(0);
  
  //i goes through a line of X values from mouse to right side of screen incrementing by 
  //a step value that increases with each time through the loop
  // at each i, j is a line of y values added and subtracted from mouseY
  // j goes up and down to the diagonals. ie; until j = i (+step for overlap)
  //each time through an i loop covers one quadrant.
  // lots of redundant code because of differnt edge testing in 4 different directions.
  step = 1;
  for (int i = 1; mouseX + i < width + step; i+= step) {

    for (int j = 0; j < i + step ; j += step) {
      if (mouseY + j < height+ step) { // only do this if the coordinate is on screen
        mapcolor = unicorn.get(min (unicorn.width-1, mouseX/2 + i/2), mouseY/2+ j/2);
        fill (mapcolor);
        ellipse(mouseX +i, mouseY + j, step *enlarge, step *enlarge);
      } 
      if (mouseY - j > 0) { 

        mapcolor = unicorn.get(mouseX/2 + i/2, mouseY/2- j/2);
        fill (mapcolor);
        ellipse(mouseX +i, mouseY - j, step *enlarge, step *enlarge);
      }
    }
    step *= 1.1; //each step is bigger than the last
  }
  step = 1;

  for (int i = 1; mouseX - i > 0; i += step) {

    for (int j = 0; j < i + step ; j += step) {
      if (mouseY + j < height) {
        mapcolor = unicorn.get(mouseX/2 - i/2, mouseY/2+ j/2);
        fill (mapcolor);
        ellipse(mouseX - i, mouseY + j, step *enlarge, step *enlarge);
      }
      if (mouseY - j > 0) {

        mapcolor = unicorn.get(mouseX/2 - i/2, mouseY/2- j/2);
        fill (mapcolor);
        ellipse(mouseX - i, mouseY - j, step *enlarge, step *enlarge);
      }
    }
    step *= 1.1;
  }

  step =1;
  for (int i = 1; mouseY + i < height ; i += step) {

    for (int j = 0; j < i + step ; j += step) {
      if (mouseX + j < width) {
        mapcolor = unicorn.get(mouseX/2 + j/2, mouseY/2 + i/2);
        fill (mapcolor);
        ellipse(mouseX + j, mouseY + i, step *enlarge, step *enlarge);
      }
      if (mouseX - j > 0) {

        mapcolor = unicorn.get(mouseX/2 - j/2, mouseY/2 + i/2);
        fill (mapcolor);
        ellipse(mouseX - j, mouseY + i, step *enlarge, step *enlarge);
      }
    }
    step *= 1.1;
  }

  step =1;
  for (int i = 1; mouseY - i > 0 ; i += step) {

    for (int j = 0; j < i + step ; j += step) {
      if (mouseX - j > 0) {
        mapcolor = unicorn.get(mouseX/2 - j/2, mouseY/2 - i/2);
        fill (mapcolor);
        ellipse(mouseX - j, mouseY - i, step *enlarge, step *enlarge);
      }
      if (mouseX + j < height) {

        mapcolor = unicorn.get(mouseX/2 + j/2, mouseY/2 - i/2);
        fill (mapcolor);
        ellipse(mouseX + j, mouseY - i, step *enlarge, step *enlarge);
      }
    }
    step *= 1.1;
  }
}


