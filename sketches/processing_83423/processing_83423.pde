
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/2925*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

// sketch:  PG_SnowyForest.pde
// Original created 2009 by Esteban Hufstedler
// Tweaked v1.01 12/2012 by Gerd Platl 

/**
 'SnowyForest' create a forest with random trees in winter.
 Press mouse button or <blanc> to stop anmiation.
 <blanc> toggle animation
 <return> clear screen
 b  toggle blurring
 o  toggle scrolling
 s  save screenshot as "SnowyForest.png"
 */

color backgroundCol = color(200);  // lightgray
boolean paused = false;
boolean blurring = false;
boolean scroll = true;
float noiseY = 200;

//----------------------------------------------------------
void setup()
{
  size(800, 600);
  background(backgroundCol);
  noFill();
  smooth();
}
//----------------------------------------------------------
void draw()
{
  if (paused) return;   //-->

  //-- scroll up picture 
  if (scroll)
    copy (0, 0, width, height, 0, -2, width, height);

  //-- fade screen to light gray
  if (frameCount % 2  == 0)
  {
    fill(backgroundCol, 4);
    noStroke();
    rect(0, 0, width, height);
  }
  
  //-- draw snow and tree
  drawSnow();
  (new PTree()).draw();     // draw a random tree

  //-- blurring gives a foggy scene
  if ((frameCount % 120 == 0) && blurring) 
    filter(BLUR, 11);
}
//----------------------------------------------------------
void drawSnow()
{
  noiseY += 0.2;
  for (int xi = 0; xi<width; xi++)
  {
    float r = noise(xi*0.01, noiseY);
    stroke(127+128*r, 255);
    line (xi, height-2-r*8, xi, height-1);
  }
}
//----------------------------------------------------------
void tooglePause()
{
  paused = !paused;
  if (paused) noLoop();  // do not waste cpu time for pausing! 
  else loop();
}
//----------------------------------------------------------
void mouseClicked()
{  tooglePause(); }
//----------------------------------------------------------
void keyTyped()
{
  //println (key+"  "+int(key));
  if      (key == ' ') tooglePause(); 
  else if (key == 10) { background(backgroundCol); paused=false; } //return?
  else if (key == 'b') blurring = !blurring;
  else if (key == 'o') scroll = !scroll;
  else if (key == 's') save("SnowyForest.png");
}


