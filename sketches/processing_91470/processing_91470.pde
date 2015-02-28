
/*NafIS Sabir
Prof. Calli Higgins
HW 5.1.2 part 1*/

int rectx = 0;//rect x location
int recty = 0;//rect y location
int spacing = 20;//spacing for vertical rects
int endWind = 400;//boundary for rects

void setup() {
  size(400, 400);
}

void draw() {
  background(255);//white background
  
  recty = 0;
  //The following code was taken from processing example 6.9 and modified for this drawing
  while ((recty < endWind) && (rectx < width)) {//command for repeating rects and grayscale scroll
    noStroke();
    // The distance between the current rectangle and the mouse is equal to the absolute value of the difference between x and mouseY.
    float distance = abs(mouseY - recty); 
    // That distance is used to fill the color of a rectangle at vertical location Y.
    stroke(0);
    fill(distance);
 //end of borrowed code
    rect(rectx, recty, width, 20);//rect dimensions
    recty = recty + spacing;
    println(recty);
  }
}



