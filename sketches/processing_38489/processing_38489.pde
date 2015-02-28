
//Gina DeMatteo
//September 20,2011
//Project One
//Inspired by the New National Gallery by Mies van der Rohe
//vertical planes expressing the beauty of a space 

void setup() {
  size(600, 500);
  smooth();
  background(255);
}

//Set of Variables
int x;//used to set up the rectangle in the farground
int y;
int a;//used to set up the verticals in the underlying grid
int b;
int c;//used to set up the horizontals in the underlying grid
int d;


void draw() {

  //Below is a set of codes that generate the fixed objects in the composition
  //These components create the space in which the composition changes
  //Vertical planes and repitition of lines gives the composition depth

  //establishing an underlying grid
  stroke(0);
  strokeWeight(2);
  for (int a=0; a<=600; a+=25) {
    stroke(0);
    line(a, b, 0+a, 500);

    for (int c=0; c<=600; c+=25) {
      stroke(0);
      line(0, c, 600, c);

      fill(255);
      stroke(0);
      strokeWeight(1);
      rect(100, 150, 500, 100);

      //These shapes set the neutral colors within the composition
      //the colors chosen emphasize the depth of the composition
      //Help to show space

      fill(255, 255, 255, 20);
      quad(0, 0, 0, 500, 100, 250, 100, 150);
      fill(224, 201, 179, 20);
      quad(0, 500, 100, 250, 600, 250, 600, 500);
      fill(100, 100, 100, 20);
      quad(0, 0, 600, 0, 600, 150, 100, 150);

      //Diagonals that define the depth 
      stroke(147, 147, 147);
      strokeWeight(0.20);
      line(0, 0, 100, 150);
      line(0, 500, 100, 250);

      //Code that establishes the set rectangle
      //This rectangle terminates the diagonal plane

      for (int x=100; x<=600; x+=75) {
        for (int y=150; y<=200; y+=75) {
          fill(0, 0, 0);
          rect(x, y, 5, 100);

          //Diagonals that define the depth 
          stroke(147, 147, 147);
          strokeWeight(0.20);
          line(0, 0, 100, 150);
          line(0, 500, 100, 250);

          //Outline of Rectangles
          stroke(0);
          noFill();
          rect(80, 165, 250, 100);
          rect(235, 185, 500, 150);
          rect(10, 205, 450, 200);
        }
      }
    }
  }
}

//Mouse Pressed Changes the colors of the rectangles
//Colors are transparent to express the objects in the space
void mousePressed() {

  //Rectangles Properties
  stroke(0);
  randomColor();
  rect(80, 165, 250, 100);
  randomColor();
  rect(235, 185, 500, 150);
  randomColor();
  rect(10, 205, 450, 200);
}

void randomColor() {
  int randomNum = floor(random(1, 6));

  if (randomNum == 1) {
    fill(100, 100, 100, 60);
  };
  if (randomNum == 2) {
    fill(152, 155, 173, 60);
  };
  if (randomNum == 3) {
    fill(196, 196, 196, 60);
  };
  if (randomNum == 4) {
    fill(79, 83, 90, 60);
  };
  if (randomNum == 5) {
    fill(185, 155, 186, 60);
  };
  if (randomNum == 6) {
    fill(147, 160, 142, 60);
  };
}


