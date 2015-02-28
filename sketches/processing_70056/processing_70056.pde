
//Homework #4
//Copyright 2012 Edmund Chow ezc@andrew.cmu.edu

float x, y, value;

void setup()
{
  size (400,400);
  smooth();
  background(255);
  x=50;
  y=50;
  int value = 0;
}

//Circles
void draw()
{
   strokeWeight(value/4);
   stroke(random(0, 100), random(110, 210), random(100, 200), 10 );
   line(pmouseX, pmouseY, mouseX, mouseY);
}

//Press mouse once to start making circles and press mouse again to stop making them.
void mousePressed()
{
  if(value == 0) {
    value = 300;
  } else {
    value = 0;
  }
}

//Press Up to make smaller circles.
void keyPressed()
{
if (key == CODED) {
    if (keyCode == UP) {
      value = 100;
    } else if (keyCode == DOWN) {
      value = 0;
    }

}

//Press Spacebar to change background to black.
  if (key == ' ')
  {
    background(0);
  }
}

//saveFrame(Homework4);



