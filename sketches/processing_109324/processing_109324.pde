
// Homework 4
// All right reserved to Chia-Fang Lue
// Keyboard input: Use "UP, DOWN, RIGHT, LEFT" to draw and move the line. 
//                 The "Space bar" to clean the canvas.
// Mouse control: Mouse click to change color of the circle.
//                Mouse release to change the size of the circle.


float x1, x2, y1, y2, wd, ht;
color col;

void setup()
{
  size( 400, 400);
  background(250);
  wd = width*.1;
  ht = height*.1;
  y1 = height*.45;
  y2 = height*.55;
  x1 = width*.12;
  x2 = width*.7;
  textSize (17);
  col = color(random(255), random(255), random(255), 10);
}

void draw() //the circle and line
{
 //circle 
 noStroke();
 fill(col); 
 ellipse(mouseX, mouseY, wd, ht);

 
 //line
 stroke(70);
 line(0, y1, 400, y1);
 stroke(100);
 line(0, y2, 400, y2);
 stroke(180);
 line(x1, 0, x1, 400);
 stroke(30);
 line(x2, 0, x2, 400);
}

void mouseReleased()// change the size of the circle
{
  wd = random(10, 180);
  ht = wd;
  
}

void mouseClicked() // change the color of the circle
{
  noStroke();
  fill(col); 
  col = color(random(255), random(255), random(255), 10);
  ellipse(mouseX, mouseY, wd, ht);

}

void keyPressed() // move and draw the line
{ 
  
  if ( key == CODED )
    {
    if (keyCode == UP)
     {
       y1 = y1 - 1;
       fill(100);
       text("UP", 60, 205);
     } 
     else if (keyCode == DOWN)
     {
       y2 = y2 + 1;
       fill(100);
       text("DOWN", 95, 205);
     }
     else if (keyCode == RIGHT)
     {
       x1 = x1 - 1;
       fill(100);
       text( "RIGHT", 165, 205);
     }
     else if (keyCode == LEFT )
     {
      x2 = x2 + 1;
     fill(100);
     text("LEFT", 230, 205); 
     } 
   }
 else
 {
  if ( key == ' ') // clean the canvas
   {
    background (250);
    fill(100);
    //text(" Clean the canvas ", 135, 100);
   }   
 } 
}





