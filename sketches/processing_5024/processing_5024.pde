
/*
Boxes
adalau85@gmail.com
October 5, 2009
*/

float turn = 0;

void setup() {
  size(500,500);
  background(255);
  rectMode(CENTER);
};

void draw() {
  //translate origin to center of the screen
  translate(250,250);
  
  //when mouse is pressed, thats when the animation begins
  if(mousePressed) {
    turn+=0.05;

    for(int i=0; i<100; i++) {
      //create random r,g,b value
      float r = random(0,255);
      float g = random(0,255);
      float b = random(0,255);
      fill(r,g,b,50);
      rotate(turn);
      rect(mouseX,0,i,i);
    }; 
  };
};

