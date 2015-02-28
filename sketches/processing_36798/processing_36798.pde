
//Bryan Williams
//Homework for Lab 3

//Background and document setup(size,background color, etc...)
void setup() {
  size(200, 500);
  background(0);
  smooth();
  fill(100);
  noStroke();
}

float count = 200;
float square;
float rndSize;
float rndColor;

void draw() {
  //Probability
  if (count > 0) {
    rndColor = random(110);
    if (rndColor > 50) { 
      fill(#8EEFFF);
      rect(random(width), random(height/2), 2, 500);
    }
    else {
      fill(#0AFFA7);
    }

    square = random(26, 26); //This dictates the size of the squares modules
    fill(93);
    rect(random(width), random(height), 4, square);  //This is the smaller darker rectangles 
    fill(191);
    rect(random(height), random(width), square, square); //This is the light square tops at the end of the rods
  }

  count--;
}


