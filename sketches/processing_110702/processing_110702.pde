
void setup()
{  
  color c = color(255, 204, 0);
   size(800,600);
    //Background image doesint work in browser, for some reason?
   //Changes background image
   //PImage img;
   //img = loadImage("http://blahblahblahscience.com/wp-content/uploads/2009/07/northernlights.jpg?e44d6f");
   //background(img);
   
}
//Draws a multi-coloured line
void draw()
{
  if (mousePressed == true)
  {
    for(int i=0; i<30; i++)
    {
    point(mouseX, mouseY);
    line(pmouseX, pmouseY, mouseX, mouseY);
    strokeWeight (random(100));
    stroke(random (255),random(255),random(255));
    }
     
     
     
  }
}
