
//This program creates a grid of lines and colored bars. The lineweight of the 
//lines increase as they move farther along the x or y axis. The lines and bars 
//are placed randomly each time, however they each have their constraints to 
//make them either vertical or horizontal and the bars vary in width between 10 
//and 50 pixels.


void setup() {
  size(500, 500);  
  background(0);
  smooth();
  stroke(255);
}

float count = 0;         //sets up the count
float countEnd = 7;      //what the counter stops at


void draw() {
  float x = random(width);
  if (count < countEnd) {
    stroke(255);
    line(x, 0, x, height);       //vertical lines
    strokeWeight(x/70);          //varies the lineweight based on the x or y coordinate, so the farther along the x or y the thicker the line.
    line(0, x, width, x);        //horizontal lines

    if (count < countEnd) {
      noStroke();
      fill(255, 0, 0, 60);
      rect(0, x, width, random(10, 50));   //sets up red horizontal bands
      fill(237, 255, 0, 60);
      rect(x, 0, random(10, 50), height);  //yellow vertical bands
      fill(0, 0, 255, 60);
      rect(x, 0, random(10, 50), height);  //blue vertical bands
    }
  }
  count++;
  if (mousePressed) {              //resets the program and creates a new grid
    background(0);
    count = 0;
  }
}


