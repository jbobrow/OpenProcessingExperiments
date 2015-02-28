
void setup()
{
  size(600, 600);
  noLoop();
  colorMode(RGB, width);
}

void draw()
{
  //paint the background shades
  for (int i = 0; i < 600; i++) 
  {
    for (int j = 0; j < 600; j++) 
    {
      stroke(i, j, 0);
      point(i, j);
    }
  }

  // Drawing "parallel" lines of the main pyramid / plane
  for (int x = 1; x < 1000 ; x++)
  {
    stroke(map(x, 0, 1000, 0, 85), map(x, 0, 1000, 85, 170), map(x, 0, 1000, 170, 256), 200);
    line(300, 100, -200 +x, 600);
  }

  // create the horizontal lines on the "pyramid"
  for (int x = 0; x <1000; x++)
  {
    stroke(255);
    line(300 +0.5*x, 100 +4.8 *x, 301 +5*x, 101 +5*x);
    line(300 +0.5*x, 100 +4.8 *x, 299 - 5 * x, 100 + 5 * x);
  }
  //create the text
  PFont font;
  font = loadFont("InformalRoman-Regular-48.vlw"); 
  textFont(font); 
  fill(0, 102, 153);
  text("You shall not Pass", 25, 600);  

  /*draw the dark shade triangle that makes one 
   side of the pyramid look darker and so "3d" */
  colorMode(HSB, 255);
  fill(100, 100, 100, 100);
  noStroke();
  triangle(300, 100, 350, 600, 800, 600);

  //draw the single stars
  star(100, 100, 255, 248, 23);
  star(400, 134, 255, 247, 0);
  star(470, 50, 255, 245, 0);
  star(150, 200, 255, 245, 0);
  star(500, 250, 255, 245, 0);
  star(250, 30, 255, 245, 0);
}

// this method creates a star each time its called using the location 
// variables and the color variables passed to it
void star(int xloc, int yloc, int R, int G, int B)
{
  int mapValue = 1;
  noStroke();
  colorMode(RGB, 255);
  fill(R, G, B);
  triangle(xloc + 10, yloc + 8.65, xloc - 10, yloc + 8.65, xloc, yloc - 8.65);
  triangle(xloc, yloc + 8.65 + 6, xloc + 10, yloc - 8.65 + 6, xloc - 10, yloc - 8.65 + 6);
}

