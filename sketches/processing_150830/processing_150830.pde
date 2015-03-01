
/*
*Creative Coding
 *Week 2 molnar_trial stage two (7 June 2014)
 *a stage by stage exercise
 *by Janys Hyde
 * remember to nest delete 'r' and save to image 's' inside void draw
 curly brackets */

//stage one, creating grid of 25 squares
void setup() {
  size ( 800, 800 );
  background (0);
  //smooth(); <- not needed, is the default
  //rectMode (CORNER);  <- not needed, is the default
}

void draw() {
  squares();
}

void squares () { 
  int d = 100; // size of the rectangle 
  int x = 50; // horizontal space between rectangles 
  int y = 50; // vertical space between rectangles 
  for (int i=0; i<5; i++) { 
    for (int j=0; j<5; j++) { 
      fill(random(255), random(255), random(255)); //if you put the fill here then it shares for each square and you get a disco effet! ;)
      rect(x+i*(d+x), y+j*(d+y), d, d);
    }
  }
}
