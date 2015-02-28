
/* Five Modes of Subtleties
 * 
 * Instructions:
 * move the mousecursor to draw. Use keys 1-5.
 * Enter key makes a screenshot of the frame.
 * 
 * Description:
 * I'm interested in drawings constructed from seemingly arbitrary and unrelated marks:
 * the myriad marks applied on canvas by artists Cy Twombly and Julie Mehretu that builds
 * up in layers and starts to make sense only as a collective.
 * Alike the construction of cobwebs representing a certain passage of time, I intended
 * to build a plain monochromatic tool that requires time, patience, and multiple layers of individual markmaking.
 * A drawing that takes a little longer than expected, but in the end clusters of minute lines and curves
 * coating the entire surface and thus representing the duration of time the viewer may have been engaging with the piece.
 * 
 * References
 *
 * 1) Trigonometry - Class Notes From Feb 16 & HW #5
 *
 * 2) Processing: A Programming Handbook for Visual Designers and Artists
 * pg 233-234 - KeyPressed
 * pg 369-370 - Saving Sequential Images, Making Screenshot
 *
 */

 
int mode = 1;
 
void setup()
{
  size(900, 300);
  stroke(0, 8);
  background(150);
  noFill();
  noCursor();
  frameRate (15);
}
 
void draw()
{
  float rad = 0.0;
  float inc = PI/90;
  float angle = 0.0;
 
 
 
  if ( mode == 1 )
  {
    for (int i=0 ; i < 1000; i+=5)
    {
      float r = random (2000);
      ellipse(width/2, r, 150+cos(rad)*mouseX, i );
      rad+=inc;
    }
  }
 
 
  else if ( mode == 2 )
  {
    for ( int i = 0 ; i < 1000; i+=2)
    {
      float r = random (2500);
      rect (tan(rad)*mouseX, i, 150+sin(rad)*mouseX, mouseY) ;
      rad+=inc;
    }
  }
 
 
  else if ( mode == 3 )
  {
    for (int i=0 ; i < 1000; i+=20)
    {
      float r = random (3000);
      bezier (mouseX, r, 60, r, mouseX, 81, r, mouseY);
    }
  }
 
 
  else if ( mode == 4)
  {
    for ( int i = 0; i < 1000; i+=13)
    {
      float r = random(300);
      ellipse(width/2, height/2, 150+cos(rad)*mouseX, i);
      rad+=inc;
    }
  }
 
 
  else if ( mode == 5 )
  {
    for ( int i = 0 ; i < 1000; i+=19 )
    {
      ellipse(width/2, 150+sin(rad)*i, 150+cos(rad)*mouseX, mouseY );
      rad+=inc;
    }
  }
}
 
 
 
void keyPressed()
{
  if ( key == '1' )
  {
    mode = 1;
    background(150);
  }
  else if ( key == '2' )
  {
    mode = 2;
    background(150);
  }
  else if ( key == '3' )
  {
    mode = 3;
    background(150);
  }
  else if ( key == '4' )
  {
    mode = 4;
    background(150);
  }
  else if ( key == '5' )
  {
    mode = 5;
    background(150);
  }
  else if ( key == ENTER )
  {
    saveFrame("five_subtleties_####.png");
  }
}


