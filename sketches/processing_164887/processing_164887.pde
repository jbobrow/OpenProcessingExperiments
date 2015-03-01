
// Mouse 2D     THIS IS A COMMENT
void setup()    // EXECUTED AT INITIALIZATION
{    // BEGIN OF SETUP
  size(500, 500);   // SIZE OF SCREEN IN PIXELS
  noStroke();  // DON’T DRAW LINES (OR RECTANGLE BORDERS)
  colorMode(RGB, 255, 255, 255, 100);  // MAX FOR R, G, B, OPACITY
  rectMode(CENTER);  // FIRST 2 PARAM OF rect SPECIFY CENTER
}    // END OF SETUP

void draw()   // EXECUTED ALL THE TIME TO REFRESH WINDOW
{   
  background(0);   // SETTS GRAY BACKGROUND
  fill(255, 100, 100, 100);  // FILL COLOR WHITE, A BIT TRANSPARENT
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill(400, 100, 100, 100);
  rect(mouseY, height/2, mouseY/2+10, mouseX/2+10); // DRAW RECTANGLE
  fill(100,155, 100, 50);
  rect(mouseY, height/2, mouseX/2+10, mouseY/2+10);
  fill(500, 155, 100, 50);
  rect(width-mouseX, height/2, ((height-mouseY)/2)+10, ((height-mouseY)/2)+10);
  fill(250, 50,50 ,50);
  rect(width-mouseX, height/2, ((height-mouseY)/2)+10, ((height-mouseX)/2)+10);
}

