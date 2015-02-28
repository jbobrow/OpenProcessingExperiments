
// vars to draw the inital line 
int X1 = 125;
int X2 = 375;
int Y1 = 250; 
int Y2 = 250; 
void setup ()
{
  size (500,500);
  stroke (#2E2E2E);
  
}

void draw ()
{
    background (#FFFFFF);
    // draw line 
    line ( X1, Y1, X2, Y2);
    // drag first point when close to it
  if (mousePressed == true)
  {
     if (pmouseX >= X1-10 && (pmouseX <= X1+10))
{
 if (pmouseY >= Y1-10 && (pmouseY <= Y1+10))
 {
   X1 = mouseX;
   Y1 = mouseY;
 }
}
  }
  // drag second point when close to it
  if (mousePressed == true)
{
 if (pmouseX >= X2-10 && (pmouseX <= X2+10))
{
 if (pmouseY >= Y2-10 && (pmouseY <= Y2+10))
 {
   X2 = mouseX;
   Y2 = mouseY;
 }
}
}
}

void keyPressed ()
{
  // open screenshot in new image 
  if (keyPressed && (key == 'i'))
  {
    saveFrame ("line_####.jpg");
  }
  // restart 
  if (keyPressed && (key == 'e'))
  {
    X1 = 125;
    Y1 = 250; 
    X2 = 375;
    Y2 = 250;
  }
}


