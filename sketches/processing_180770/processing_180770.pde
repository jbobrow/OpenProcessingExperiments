
float hatx = 150;
float haty = 200;

float hippox = 200;
float hippoy = 400;

float wandx = 0;
float wandy = 0;

float r  = -1;

void setup ()
{
  size (500, 500);
}

 void drawfold (float foldx, float foldy)
 {
   noFill ();
   stroke (200);
   strokeWeight  (1);
   triangle (foldx, foldy, foldx + 5, foldy + 40, foldx - 10, foldy+ 40);
 }
 
void draw ()
{
  background (237, 7, 7);

  //hippo
  stroke (0);
  strokeWeight (1);
  fill (225);
  //body
  ellipse (hippox, hippoy + 50, 100, 200);
  //head
  ellipse (hippox, hippoy, 100, 100);
  //snout
  ellipse (hippox, hippoy, 50, 50);
  //bob
  fill (255);
  ellipse (hippox, hippoy + 150, random (30,35), 30);
  

  //eyes
  noFill();
  stroke (0);
  strokeWeight (2);
  ellipse ( hippox - 25, hippoy, 10, 10);
  ellipse (hippox + 25, hippoy, 10, 10);
  fill (#D1C92E);
  ellipse ( hippox - 25, hippoy, 2, random (2, 4));
  ellipse (hippox + 25, hippoy, 2, random (2, 4));

  //ears
  noStroke ();
  fill (200);
  ellipse (hippox - 25, hippoy - 25, 20, 40);
  ellipse (hippox + 25, hippoy - 25, 20, 40);
  strokeWeight (1);
  fill (#FABBC4);
  ellipse (hippox - 25, hippoy - 25, 15, 30);
  ellipse (hippox + 25, hippoy - 25, 15, 30);

  //teeth
  noStroke ();
  fill (255);
  rect (hippox -14, hippoy +20, 10, random (12,14));
  rect (hippox + 4, hippoy + 20, 10, random (12,14));
  
  //eyebrows
  stroke (0);
  strokeWeight (1);
  line (hippox, hippoy - 15, hippox + 40, hippoy);
  line (hippox, hippoy - 15, hippox - 40, hippoy);
  
  //whiskers
    stroke (0);
  strokeWeight (1);
  line (hippox, hippoy + 15, hippox + 40, hippoy + (random (28,30)));
  line (hippox, hippoy+ 15, hippox - 40, hippoy + (random (28,30)));
    
  line (hippox, hippoy + 15, hippox + 40, hippoy +(random (38,40)));
  line (hippox, hippoy+ 15, hippox - 40, hippoy +(random (38,40)));
    
  line (hippox, hippoy + 15, hippox + 40, hippoy +(random (48,50)));
  line (hippox, hippoy+ 15, hippox - 40, hippoy +(random (48,50)));
   
  //frontpaws
  noStroke ();
  fill (200);
  ellipse (hippox - 25, hippoy + 60, 30, 30);
  ellipse (hippox + 25, hippoy + 60, 30, 30);
  strokeWeight (1);
  fill (#FABBC4);
  ellipse (hippox - 25, hippoy + 60, 20, 20);
  ellipse (hippox + 25, hippoy + 60, 20, 20);
  
  
  //backpaws
  noStroke ();
  fill (200);
  ellipse (hippox - 25, hippoy + 120, 30, 30);
  ellipse (hippox + 25, hippoy + 120, 30, 30);
  strokeWeight (1);
  fill (#FABBC4);
  ellipse (hippox - 25, hippoy + 120, 20, 20);
  ellipse (hippox + 25, hippoy + 120, 20, 20);
  


  //wand
  translate (100, 100);
  rotate (r);
  fill (0);
  rect (wandx, wandy, 300, 20);
  fill (255);
  rect (wandx, wandy, 100, 20);

  if (wandy > 170)
  {
    wandy = 170;
  }

  resetMatrix ();
  
  if (hippoy < 40)
  { 
    hippoy = 40;
  }

  //hat
  fill (0);
  rect (hatx, haty, 120, 150);
    
//hatrim
  stroke (150);
  strokeWeight (2);
  ellipse (hatx + 60, haty, 250, 5);
  
  
  //backg
  noStroke ();
  fill (237, 7, 7);
  ellipse (hatx + 120, haty + 80, 5, 120);
  ellipse (hatx, haty + 80, 5, 120);
    
  //table
  fill (103, 57, 1);
  rect (0, 350, 500, 200);
  
  fill (#061CA0);
  rect (0, 370, 500, 130);
    
  fill (200, 57, 1);
  rect (0, 360, 500, 40);
   
  drawfold (10, 360);
  drawfold (20, 360);
  drawfold (140, 360);
    drawfold (160, 360);
  drawfold (270, 360);
  drawfold (390, 360);
  drawfold (420, 360);
  
  fill (100);
  textSize (18);
   text ("Ooooohhh, please don't. Put me back!", 20, 480);
   
  hippoy = hippoy - 0.5;

  wandy = wandy + 0.8;
}

