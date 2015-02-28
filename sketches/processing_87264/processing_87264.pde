
//Homework 4
//Copyright Lila Fagen
//Lila.Fagen@gmail.com (ldf)

float x, y, diam;

PFont myFont;


void setup ( )
{
  size (400, 400);
  smooth ( );
  noFill ( );
//    x = 0;
//    y = 0;
//    diam = 2;
        
    // Uncomment the following two lines to see the available fonts 
  String[] fontList = PFont.list();
  println(fontList);
  myFont = createFont("Rockwell", 20);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  noFill ( );

}

void draw ( )

{
}

void mousePressed ( )
{
   fill (200);
  rect (0, 0, width, height);

}

void keyPressed ( )
{

  
  textSize (random(10, 50));
    text( char (key - 32), random(30, 370), random(30, 400));
    fill ( random(255), random(255), random(255));
//    if ( key == 'a')
//  {
//    text("A", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else  if ( key == 'b')
//  {
//    text("B", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'c')
//  {
//    text("C", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else  if ( key == 'd')
//  {
//    text("D", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else    if ( key == 'e')
//  {
//    text("E", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else    if ( key == 'f')
//  {
//    text("F", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else    if ( key == 'g')
//  {
//    text("G", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else    if ( key == 'h')
//  {
//    text("H", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'i')
//  {
//    text("I", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else    if ( key == 'j')
//  {
//    text("J", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else    if ( key == 'k')
//  {
//    text("K", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
//else    if ( key == 'l')
//  {
//    text("L", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'm')
//  {
//    text ("M", random (30, 370), random (30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'n')
//  {
//    text("N", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'o')
//  {
//    text("O", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'p')
//  {
//    text("P", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'q')
//  {
//    text("Q", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'r')
//  {
//    text("R", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 's')
//  {
//    text("S", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 't')
//  {
//    text("T", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'u')
//  {
//    text("U", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'v')
//  {
//    text("V", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'w')
//  {
//    text("W", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'x')
//  {
//    text("X", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'y')
//  {
//    text("Y", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }  
//else  if ( key == 'z')
//  {
//    text("Z", random(30, 370), random(30, 400));
//    fill ( random(255), random(255), random(255));
//  }
  
  }


void keyReleased ( )
{
 if ( key == 'h')
  {
  
  }
}

