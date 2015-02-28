
//Created By Andy Hon
//Move the mouse to generally change the direction of the random lines.
//run it again to clear screen
float x, y ;
boolean aPressed ;

void setup()
{
  x = y = 100 ;
 size(600, 600) ; 
background(255, 255, 255) ;
}

void draw()
{
  smooth() ;
  fill(random(24), random(40), random(201)) ;
  stroke(random(255), random(255), random(255)) ;
  //ellipse(mouseX, mouseY, random(25), random(25)) ;
  loop() ;
  line(random(mouseX), random(mouseY), random(mouseX), random(mouseY)) ;
}
void KeyPressed()
{
  if(key == 'a') aPressed = true ;
}

void keyreleased()
{
 if(key == 'a') aPressed = false ;
}



