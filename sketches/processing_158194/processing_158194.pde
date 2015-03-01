
int r,g,b;
 
void setup()
{
  size(800, 800);
  // size(displayWidth, displayHeight);
 
  r = 0;
  g = 0;
  b = 0;
}
 
void draw()
{
  background(r,g,b); 
}
 
void keyPressed()
{
 
  switch (keyCode) {   
    case LEFT: // red
      r = 255;
      g = 0;
      b = 0; 
      break;
   case RIGHT: // green
      r = 0;
      g = 255;
      b = 0; 
      break;
    case DOWN: //blue
      r = 0;
      g = 0;
      b = 255;
      break; 
    case UP: // yellow
      r = 255;
      g = 255;
      b = 0; 
      break;
    default: 
      break;
   }
      
      
   // so you can use r,g,b keys on keyboard 
   
  switch (key) {
    case 'r':
    case 'R':
      r = 255;
      g = 0;
      b = 0;
      break;
    case 'g':
    case 'G':
      r = 0;
      g = 255;
      b = 0;
      break; 
    case 'b':
    case 'B':
      r = 0;
      g = 0;
      b = 255;
      break;     
    default: 
      break;
  }
}
