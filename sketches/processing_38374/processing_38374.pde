
//Corinne Bridges
//Project 1
//September 20, 2011
//Drawing machine inspiration from Jared Tarbel's Box Fittings
//http://www.complexification.net/gallery/machines/boxFitting/


void setup() {
  size(400, 300);
  colorMode(RGB, 400);
  background(0);
}

int numOfSquares = 730; //number of squares
float rndSize;

void draw() {
  rndSize = random(45); //largest size of square

  if (numOfSquares > 500) { //if number of squares is more than 500
    rect(random(width), rndSize*2-35, rndSize, rndSize);
    fill(168, 130, 0); //draw random squares between 1 and 35 units.

    if (numOfSquares > 500) { //this 500 seems redundant, but without it the squares won't stop drawing.
      rect(random(width), rndSize*2+35, rndSize, rndSize);
      fill(255, 122, 0); //start drawing squares 35 units down from first one.

      if (numOfSquares > 500) {
        rect(random(width), rndSize*2+70, rndSize, rndSize);
        fill(255, 155, 54);

        if (numOfSquares > 500) {
          rect(random(width), rndSize*2+105, rndSize, rndSize);
          fill(255, 209, 54);

          if (numOfSquares > 500) {
            rect(random(width), rndSize*2+135, rndSize, rndSize);
            fill(255, 255, 201);

            if (numOfSquares > 500) {
              rect(random(width), rndSize*2+170, rndSize, rndSize);
              fill(119, 144, 160);

              if (numOfSquares > 500) {
                rect(random(width), rndSize*2+205, rndSize, rndSize);
                fill(119, 182, 103);

                if (numOfSquares > 500) {
                  rect(random(width), rndSize*2+230, rndSize, rndSize);
                  fill(157, 119, 222);
                }
              }
            }
          }
        }
      }
    }
  }
  numOfSquares--;
}


