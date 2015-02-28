
//HW4 Stephanie Jeong yujeongj copyright 2014
//by having the keyboard input, now the code has the function to change the background color.
//By having the mouse button input, the color of the circle can change.


float x,y;
float wd,ht;
float xDist, yDist;
 
void setup()
{
    size(400,400);
    background(255,235,229);
    fill(0,163,136);
    noStroke();
    
    smooth();
    wd=random(30,50);
    ht=random(30,50);
}
 
void draw()
{
    ellipse(mouseX, mouseY, wd,ht);
}

void keyPressed()
{
  background(255,151,134);
  wd=random(40,80);
  ht=random(40,80);
  x=0;
}

void mousePressed()
{
   fill(random(255),random(255),random(255));

}



