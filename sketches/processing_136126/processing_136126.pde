
// Final Interactive Project 
// Mouse / Keyboard Input
// Drawing snow flakes of various colors.

/*
MOUSE
position x : length
position y : thickness and number of lines to be drawn
drag : draw

KEYS
1-7 : stroke color
del, backspace :erase
s : save png
*/

// Global Variables
color strokeColor = color(0, 10);

// setup()
void setup()
{
  size(1000, 700);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);  
}

// draw()
void draw()
{
  if( mousePressed )
  {
    pushMatrix();

    // style
    strokeWeight(2);
    stroke( strokeColor );

    beginShape();
    //ellipse(mouseX, mouseY, 50,50 );
    line(mouseX, mouseY, mouseX + 40, mouseY + 40 );
    line(mouseX, mouseY, mouseX + 40, mouseY - 40 );
    line(mouseX, mouseY, mouseX - 40, mouseY - 40 );
    line(mouseX, mouseY, mouseX - 40, mouseY + 40 );
    line(mouseX, mouseY, mouseX, mouseY + 40 );
    line(mouseX, mouseY, mouseX, mouseY - 40 );
    line(mouseX, mouseY, mouseX + 40, mouseY );
    line(mouseX, mouseY, mouseX - 40, mouseY );
    endShape();
    popMatrix();
  }
}

// keyPressed()

void keyReleased()
{
  if( key == DELETE || key == BACKSPACE ) background(360);
  if( key == 's' || key == 'S' ) saveFrame("screenshot.png"); 
  
  switch( key )
  {
    case '1':
      strokeColor = color(0, 10);
      break;
    case '2':
      strokeColor = color(192, 55, 64, 10);
      break;  
    case '3':
      strokeColor = color(52, 66, 71, 10);
      break;  
    case '4':
      strokeColor = color(342, 67, 51, 10);
      break;
    case '5':
      strokeColor = color(7, 41, 97, 10);
      break;
    case '6':
      strokeColor = color(129, 33, 50, 10);
      break;
    case '7':
      strokeColor = color(287, 47, 48, 10);
      break;
  }
    
}


