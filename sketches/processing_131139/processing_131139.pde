
//copyright Hyun Doug Kim
//homework 4

//keyPressed. when pressing any key the background colour changes in the shades of red.
//mouseMoved. when mouse is pressed, background colour changes.
//mousewheel. When mouse is wheeled, it returns a value.

float x, y, wd, ht, e;

void setup()
{
  size(400, 400);
    x= 50;
    y= 50;
    wd= 100;
    ht= 100;
}

void draw()
{  
    noStroke();
    fill(random(255));
    ellipse(mouseX, mouseY, wd, ht);
    fill(0, 0, random(255));
    ellipse(mouseX+wd, mouseY+ht, wd/2, ht/2);

}

void mouseMoved()
{
  //background(random(255), random (255), random(255));
  fill(random(255), random(255), random (255));
  ellipse(mouseX-wd, mouseY-ht, wd*2, ht*2);
}
 
void keyPressed()
{
  //rect(200, 200, wd/2, ht/2);
  background(random(255), 0, 0);
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
 println(e); 
}



