
// nathany santos
//assignment 3
//To draw 12 rects and 7 circles using loop

void setup()
{
  size(800, 400);
  background(255);
  stroke(0);
  strokeWeight(2);
}

void draw()
{
  //drawing the rect (300 X 12) using a loop
  fill(120);
  int i = 0;
  while (i <= 276) {
    rect(15, 52 + i, 300, 12);

    i = i + 24;
  }

  // drawing the circles using a loop
  fill(200);
  int j = 25;
  i = 0;
  while (i <= 300) {
    
    ellipse ( 600, 200, 350 - i, 350 - i); // in each loop iteration the size of the ellipse is reduced. 

    // passing variable parameter to fill() in order to change the color of each circle each time it is drawn.   
    fill( 200 - j);
    j = j + 25;
    i = i + 50;
  }
}



