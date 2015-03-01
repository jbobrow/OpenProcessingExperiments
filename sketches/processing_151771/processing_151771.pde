
PImage img = null;

/* @pjs preload="fuzzy.jpg"; */

void setup()
{
  size (600, 600);
  smooth();
  img = loadImage ("fuzzy.jpg");

  background (#57385c);
}

void draw ()
{
  /**
   * PImage kann in der background() Funktion benutzt werden 
   * img muss dafuer aber diesselbe Groesse (img.width und height)
   * wie die Fensterausgabe haben (width und height)
   */
   background (img);
   
   image (img, mouseX, mouseY);
}




