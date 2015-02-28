
//I wanted this project to have both a sense of randomness 
//however maintaining a sense of order, so that why some shapes are aligned and some
//are placed at random intervals.
//The color and opacity scheme, I think also take on these qualities
void setup() {
  size(500, 500);
  smooth();
  colorMode(RGB, width);
}

void draw() {
}

//when mouse is pressed do the following . . .

void mousePressed() { 
  background(0);

  //ELLIPSES 

  for (int x=0;x<width; x+=50) { // accounts for the number of columns along the x axis
    for (int y=0; y<height;y+=50) { // accounts for the number of rows along the y axis
      int will= floor(random(0, 100)); // setting the variable between 0 and 100
      if (will<50) {
        fill(random(100, 255), random(50, 200), random(0, 100), random(0, 100)); //random color and opacity
        noStroke(); 
        ellipse(25+x, 25+y, 50, 50); // size of ellipses and how far they appear from edge
      }
      //LARGE SQUARES

      else { //these squares/rectangeles will appear whenever the above requirements are not satisfied
        fill(random(0, 100), (floor(random(width))), 100, random(0, 100)); //fills the squares randomly within the given confines, with a random opacity
        noStroke();
        rect(25+x, 25+y, 50, 50); //size of the square, and how far from the edge they begin

        //SMALL RECTANGLES

        fill(100, random(0, 255), 100, random(0, 100)); //fills the rectangles randomly within the given confines, and random opacity
        noStroke();
        rect(x, y, random(0, 20), random(0, 100)); //size of the rect, and how far from the edge they begin

        //TRIANGLES

        fill(random(0, 255), random(0, 255), random(0, 255), 30); //fills the triangles randomly within the given confines, with a given opacity
        noStroke();
        triangle(random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500)); // creates randomly sized triagles within the given confines
      }
    }
  }
}


