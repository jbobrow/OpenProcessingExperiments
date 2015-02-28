
PFont f;

String message = "(: tickle me :)";
float x, y;
float hr, vr;

void setup ()
{
  size (800, 600);
  background (75);
  f = createFont ("Verdana Bold", 32, true);
  
  hr = textWidth (message) + 5;
  vr = (textAscent () + textDescent ()) + 5;
  noStroke ();
  x = width / 2 ;
  y = height / 2;
  
}

void draw ()
{
  fill (75, 100);
  rect (0, 0, width, height);
  
  if (abs (mouseX - x) < hr &&
      abs (mouseY - y) < vr)
      {
        x += random (-5, 5);
        y += random (-5, 5);
        
      }
      
      fill (255, 255, 175);
      textFont (f, 32);
      textAlign (CENTER, CENTER);
      text ("(: tickle me :)", x, y);
      
  fill (75, 100);
  rect (0, 0, width, height);
  
  if (abs (mouseX - x) < hr &&
      abs (mouseY - y) < vr)
      {
        x += random (-5, 5);
        y += random (-5, 5);
        
      }
      
      fill (100);
      textFont (f, 40);
      textAlign (RIGHT);
      text ("Kenny Rose Design", 780, 580);
      
      fill (100);
      textFont (f, 16);
      textAlign (LEFT);
      text ("created with Processing and Processing.js sketch based on code by Daniel Shiffman", 20, 20);
      
      

      
}


  


