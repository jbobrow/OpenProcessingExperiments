
/**
 
 modified from Mouse2D example
 
 scaling boxes
 sean_velasco@hotmail.com
 june 2009
 
 */
 
void setup() 
{
  size(600, 600); 
  noStroke();
  rectMode(CENTER);
}

void draw() 
{   
  background(0); 
  fill(255, 0 + mouseY);
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  fill(255, 0 + inverseY);
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
  stroke(192);
  line(mouseX - ((mouseY/2+10)/2), height/2 + ((mouseY/2+10)/2), inverseX - ((inverseY/2+10)/2) , height/2 + ((inverseY/2+10)/2));
  line(mouseX - ((mouseY/2+10)/2), height/2 - ((mouseY/2+10)/2), inverseX - ((inverseY/2+10)/2) , height/2 - ((inverseY/2+10)/2));
  line(mouseX + ((mouseY/2+10)/2), height/2 + ((mouseY/2+10)/2), inverseX + ((inverseY/2+10)/2) , height/2 + ((inverseY/2+10)/2));
  line(mouseX + ((mouseY/2+10)/2), height/2 - ((mouseY/2+10)/2), inverseX + ((inverseY/2+10)/2) , height/2 - ((inverseY/2+10)/2));
};


