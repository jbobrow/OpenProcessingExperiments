
//I wanted my project to be simple yet complex
//so I designed this sketch with triangles, lines, and rectangles
//that change colors and lineweight upon mouse click.
//The design is ment to be a sort of optical illusion of shape and color.
//The initial image shows the sketch in its simplest form and
//once the mouse is pressed the composition is up to the computer as the "drawing machine."


void setup() {
  size(500, 500);
}

int x=50; //for the rotated sqaure at bottom of code

//sets the parameters for the triangles
void tri() {
  for (int X=0; X<width/50; X++) {
    for (int Y=0;Y<height/50;Y++) {
      triangle(50+(X*100), 0+(Y*50), 0+(X*100), 50+(Y*50), 100+(X*100), 50+(Y*50));
    }
  }
}

//sets the parameters for the verticle lines
void li() {
  for (int X=0; X<width/50;X++) {
    for (int Y=0;Y<width/50;Y++) {
      line(50+(X*50), 0, 50+(X*50), height);
    }
  }
}


//this draws the initial image once the sketch is played
//it shows the raw design of the sketch in the simplest form
void draw() {
  li();
  noFill();
  tri();
}

//when the mouse is pressed the sketch changes 
//with line weight,triangle color, and rectangles
void mousePressed() {

  strokeWeight(random(1, 10));
  stroke(0);
  li();
  fill(random(0, 255), random(0, 255), random(0, 255));
  tri();


  //controls the black and white transparent rectangles across the page
  for (int X=0; X<width/50; X++) {
    for (int Y=0;Y<height/50;Y++) {
      fill(255, 25);
      rect(50+(X*100), 0+(Y*50), 50, 50);
      fill(0, 0, 0, 75);
      rect(0+(X*100), 0+(Y*50), 50, 50);
    }
  }


  //red checkered board squares
  for (int X=0; X<width/50; X++) {
    for (int Y=0;Y<height/50; Y++) {
      fill(255, 0, 0, 50);
      rect(0+(X*100), 0+(Y*100), 50, 50);
      rect(50+(X*100), 50+(Y*100), 50, 50);
    }
  }

  noStroke();


  //diamond squares that decrease in size towards the center
  fill(255, 255, 0, 100);
  quad(250, 0, 0, 250, 250, width, width, 250);
  if (mousePressed) {
    quad(250, 0+x, 0+x, 250, 250, width-x, width-x, 250);
    if (x<250) {
      x+=50;
    }
    else {
      x=50;
    }
  }
}


