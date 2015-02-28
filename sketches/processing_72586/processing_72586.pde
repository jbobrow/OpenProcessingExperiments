
boolean doidraw = false;
int diam = 200;
int diama = 400;

void setup ()   {
  size (600,600);
  background(0,100,100);
  stroke(0);
}
  
 void draw() {
   if (doidraw) 
 
  drawacirclem (mouseX, mouseY, (mouseX + mouseY)/5);
 
  drawacircle (400, 400, diama);
    drawacircle (400, 100, diam/2);
 
  diam = diam-3;
  diama = diama -10;
  
     }



void mousePressed()  {
  doidraw = !doidraw;

}

void drawacircle (float centx, float centy, float circlesize)  {
  stroke (0, 255, 255, 100);
  noFill ();
  ellipse (centx, centy, circlesize, circlesize);
}

void drawacirclem (float centx, float centy, float circlesize)  {
  stroke (255, 0, 0, 100);
  fill (255,255,0);
  ellipse (centx, centy, circlesize, circlesize);
}

