
/*all shapes rely on probability.
 the lines follow odd/even pattern determining when they draw vertical/horizontal lines.
 the  arcs also follow an odd/even pattern determining whether they draw as a semi-circle or random arc*/
void setup(){
size(500, 500);
smooth();
colorMode(RGB, width);
background(0);
}

void draw(){
}


void mousePressed() { // once mouse is clicked a different composition will appear based on parameters below
  background(0);
  for (int x=0; x < width; x+=50) { //sets up X-axis for 50x50 grid
    for (int y=0; y < height; y+=50) { //sets up Y-axis for 50x50 grid
      int RandEllipse = floor(random(0, 100)); //pick a number between 1 and 100 for each segment of the grid
      noFill();
      stroke(255, 100);
      strokeWeight(.5);
      rect(x, y, 50, 50); //creates grid out of 50x50 squares(rectangles)
      println(RandEllipse);
      if (RandEllipse < 20) { //if the number is less than 20 draw an ellipse
        noFill();
        stroke(width, width, 0);
        strokeWeight(floor(random(1, 3)));
        ellipse(x+25, y+25, 50, 50); //creates an ellipse that will fill one 50x50 section of the grid
      }
      if (RandEllipse > 80) { 
        if (RandEllipse % 4 != 0) { //if the number is greater than 80 and not divisible by 4 draw a random arc
          stroke(floor(random(100, 200)), width-x, y);
          strokeWeight(3);
          float arcRand=(random(0, 2*PI)); //sets the parameters for the random arc
          arc(x+25, y+25, 50, 50, 0 + arcRand, PI/2 + arcRand);
        }
      }
      if (RandEllipse>80) {
        if (RandEllipse % 4 == 0) { //if the number is greater than 80 and divisible by 4 draw a semi-circle
          stroke(floor(random(100, 200)), width-x, y);
          strokeWeight(2);
          float arcRand=(PI/2); //sets semi-circle
          arc(x+25, y+25, 50, 50, 0 + arcRand, PI + arcRand);
        }
      }
      if (RandEllipse < 80) {
        if (RandEllipse > 40) { 
          if (RandEllipse % 2 == 0) { //if the number is less than 80 and greater than 40 and divisible by 2 draw a horizontal line
            stroke(floor(random(50, 200)), x, height-y);
            line(x, y+25, x+50, y+25);
          }
          if (RandEllipse < 80) {
            if (RandEllipse > 40) {
              if (RandEllipse % 2 !=0) { //if the number is less than 80 and greater than 40 but not divisible by 2 draw a vertical line
                stroke(width-x, y, random(50, 200));
                line(x+25, y, x+25, y+50);
              }
            }
          }
        }
      }
    }
  }
}


