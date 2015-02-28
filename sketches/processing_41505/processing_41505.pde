

float rectSize = 5; // All sizes off the rect. (Square).
float rect_X = 2; // Placement on the screen,
float rect_Y = 2; // Placement on the screen.

float blackRectSize = 4; // Black rect's sie = 4 pix
float blackRect_X = 200; // Black rect is placed on X-pix 0.
float blackRect_Y = 200; // Black rect is placed on Y-pix 0.



void setup () {
  size (200, 200); 
  smooth ();
  rectMode (CENTER);
}


void draw () {

  background (0); 
  strokeWeight (4);
  stroke (255, 255, 255, 40);
  line (100, 0, 100, 200);
  strokeWeight (2);
  stroke (255, 255, 255, 255);
  noFill ();
  // Player 1 follows the mouse's Y-position.
  rect (rect_X * 20, mouseY, rectSize / 1.4, rectSize * 2.55); // variable, variable, Width, Height
  rect (rect_X * 80, rect_Y, rectSize / 1.4, rectSize * 2.55); // variable (for placement on screen), variable (for placement on screen), Width (of object), Height (of object).
  // 2:nd player's equation: player1 is placed on 20*2 = 40 pix X-axis. The whole screen is 200 pix in X-axis (and Y-axis), 200-40 = 160. Player 2 would be placed on X = 160. 160/2 = (2 as in the original rect_X) is equal to 80. Answer is therefore "rext_X * 80"
  //rect_X = 200/2;
  rect_Y = 200/2;


  noStroke ();
  fill (0);

  rect (blackRect_X / 2, blackRect_Y / 3, blackRectSize * 2, blackRectSize); 
  rect (blackRect_X / 2, blackRect_Y / 2, blackRectSize * 2, blackRectSize); 
  rect (blackRect_X / 2, blackRect_Y / 1.50, blackRectSize * 2, blackRectSize); 
  rect (blackRect_X / 2, blackRect_Y / 6, blackRectSize * 2, blackRectSize); 
  rect (blackRect_X / 2, blackRect_Y / 36, blackRectSize * 2, blackRectSize); 
  rect (blackRect_Y / 2, blackRect_Y / 1.20, blackRectSize * 2, blackRectSize);
  rect (blackRect_X / 2, blackRect_Y / 1.02, blackRectSize * 2, blackRectSize);
}


