
/* Drawing with the mouse illustrates a quote by DH Lawrence;
random function used for colour; lots of triangles form the background
and mouse cursor*/ 

void setup ()
{
  size (500, 700); 
  background (255);
  colorMode (HSB, 100);
  frameRate (24); // 
  textSize (24); // text on the start window
  fill (0);
 text ("Click left to draw", 130, 325); 
 text ("Click right to start", 125, 125);
}

void draw() 
{ 
  if (mousePressed && (mouseButton == LEFT))
  {
  float h = random (0, 100); // random colour of triangles
  noStroke ();
  fill (h, 70, 100, 50);
  // triangle to draw with depending on mouse cursor
  triangle (mouseX, mouseY, mouseX-25, mouseY+50, mouseX+25, mouseY+50);
  for (int a = 0; a < height; a = a+50) // draws the lines 
  // in background
  {
  stroke (100);
  strokeWeight (5);
  line ( 0, a, 700, a);
  line ( a, 0, a, 700); 
  line (a, 0, 700, 700-a); 
  line (0, a, 700-a, 700);
  noStroke (); // triangles in background
  fill (100);
  triangle (140, 50, 250, 150, 360, 0); 
  triangle (400, 0, 500, 200, 450, 10); 
  triangle (10, 10,50, 100, 110, 10); 
  triangle (0, 50, 10, 200, 50, 200); 
 triangle (10, 410, 30, 680, 150, 650); 
  triangle (370, 550, 250, 680, 500, 680); 
  triangle (490, 410, 380, 540, 490, 650);
  noStroke (); 
  fill (100); 
  rect (0, 220, 500, 170); 
   fill (h, 70, 100, 50);
textSize (24); // text to be revealed
text ("'For my part, I prefer", 50, 250);
text ("my heart to be broken. It is so lovely,", 25, 280);
text ("dawn-kaleidoskopic", 75, 310);
text ("within the crack.'", 150, 340); 
text ("DH Lawrence", 225, 370); 
  }
  }
   if (mousePressed && (mouseButton == RIGHT)) // rightclick to restart
 {
   colorMode (HSB, 100);
      background (100);
  } 
}


