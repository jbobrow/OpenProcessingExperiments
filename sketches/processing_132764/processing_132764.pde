
//HW 5 copyright Harris Mazur
float x, y, dx, dy; 
float x2, y2, dx2, dy2;
float wd, ht, wd2, ht2;
float dia, dia2;

void setup ()
{
  size (400,400);
    x= 20;
    y= 20;
    dx=3;
    dia= 40;
    x2= 385;
    y2= 385;
    dx2= 7;
    dia2= 30;
}

void draw ( )
{
    prepWindow ( );
    moveFigures ( );
    drawFigures ( );
}

void prepWindow ( )
{
    fill (247, 186, 30, 10);
    rect (0, 0, width, height);
}

void figure (float x, float y, float dia)
{
     fill (247, 103, 30);
     noStroke ( );
     ellipse (x, y, dia, dia);
}

void drawFigures ( )
{
      figure (x, y, dia);
      figure (x2, y2, dia2);
}

void moveFigures ( )
{ 
     x = x+dx;
  if (x > width-20) {
    y = y+dx;
    x = width-20;
  }
  if (y > height-20 ) {
    x = x+dx;
    dx = -dx;
    y= height-20;
  }
  if (x < 20) {
    y = y+ dx;
    x = 20;
  }
  if (y < 20) {
    x = x+dx;
    dx = -dx;
    y=20;
  }
   
    
    x2= x2 +dx2;
    if (x2> width-15) {
      y2= y2+dx2; 
      x2= width- 15; }
   
    if (y2 > height-15) {
      x2= x2 + dx2;
      dx2= -dx2;
      y2= height- 15; }
    
    if (x2 < 15) {
      y2= y2+ dx2;
      x2= 15; }
     
    if (y2 < 15) {
      x2= x2+dx2;
      dx2= -dx2;
      y2= 15; }
}
        
      

