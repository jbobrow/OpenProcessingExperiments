
// Homework 3
// 51-757 Computing for the Arts with Processing
// September 8, 2011
// Copyright Molly Nix September 2011 Pittsburgh, PA 15232
 
// VARIABLE DEFINITIONS

float x, y;
color darkbg = color( 144, 151, 143 );
color yellow = color( 249, 235, 200 );
float topxgroup = 50;
float topygroup = 150;
float smallestwdht = 40;
float largestwdht = 60;
float thisellipsewd;
float currentx;
color col;

// function only executes once
void setup( ) {
  size( 500, 300 );
  smooth();
  fill(yellow);
  background(darkbg);
}

// animation engine
void draw( ) {
  currentx = topxgroup;
  noStroke();
  fill ( darkbg, 30 );
  rect ( 0, 0, width, height);
  fill (yellow);
  for (int i = 0; i < 9; i = i+1) {
      if (((mouseX > (topxgroup+i*(smallestwdht+(.25*smallestwdht)))-(smallestwdht/2)) && (mouseX < (topxgroup+i*(smallestwdht+(.25*smallestwdht)))+(smallestwdht/2))) &&
         ((mouseY > (topygroup-(smallestwdht/2))) && (mouseY < (topygroup+(smallestwdht/2))))) {
        col = color( random(256), random(256), random(256) );
        fill(col);
        thisellipsewd = largestwdht;
        if (i != 0) {
          currentx = currentx+smallestwdht+(.25*smallestwdht);
        }
       }
      else {
        fill(yellow);
        thisellipsewd = smallestwdht;
        if (i != 0) {
          currentx = currentx+smallestwdht+(.25*smallestwdht);
        }
      }
      ellipse(currentx, topygroup, thisellipsewd, thisellipsewd);
  }
}

