
/*
 * Instruction
 *
 * Use Number Keys 1 -3 to change modes.
 * Esc - Closes window
 *
 * References
 *
 * 1) Trigonometry - Class Notes From Feb 16
 *
 * 2) Processing: A Programming Handbook for Visual Designers and Artists
 * pg 233-234 - KeyPressed
 * pg 369-370 - Saving Sequential Images, Making Screenshot
 *
 *
 */



int mode = 1;
 
 
void setup()
{
 size(500,500);
 background(230);
 smooth();
}
 
void draw()
{
 float rad = 0.0;
 float inc = PI/90;
 float angle = 0.0;
  
 if( mode == 1 )
 {
   for( int i = 0 ; i < 1000; i+=2 )
   {
     ellipse(width/2, i, 150+cos(rad)*mouseX, i );
     rad+=inc;
   }
 }
 else if( mode == 2 )
 {
   for( int i = 0 ; i < 1000; i+=3)
   {
     rect (tan(rad)*mouseY, i, 150+sin(rad)*mouseX, i) ;
     rad+=inc;
   }
 }
 else if ( mode == 3 )
 {
   for (int i=0 ; i < 1000; i+=20)
   {
     float r = random(3000);
     rect (rad*mouseX, r, tan(mouseX/100), sin(rad)*mouseY);
     rad+=inc;
   }
 }
}
 
void keyPressed()
{
  if( key == '1' )
  {
   mode = 1;
   background (230);
  }
  else if( key == '2' )
  {
    mode = 2;
    background (230);
  }
  else if( key == '3' )
  {
    mode = 3;
    background (230);
  }
  else if ( key == ESC)
  {
    exit();
  }
}


