
// Einfuehung in Processing 
// 2-2 Mausklick

void setup ()
{
  size (600, 200);
  background (0,154,188);
}
 
void draw ()
{
  stroke (208,242,0);
  strokeWeight (2);
  fill (255,206,0);
  ellipse (mouseX, mouseY, 50, 50);
}
 
/* Wir kÃ¶nnen auch definieren, was nach einem Mausklick geschehen soll. Auch hier hat der Aufruf die Form
        void mousePressed ()
        {
        ... was geschieht?
        }
*/

void mousePressed ()
{
  background (0,154,random(255));
}

