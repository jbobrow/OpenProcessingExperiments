
//Christian Murphy
// September 2013

void setup()
{
  size( 600, 600 );
  
}

void draw()
{
  skull(45, 100);
}

void skull(int x, int y)
{
  noStroke();
  fill(255);
  ellipse( x + 300, y + 200, 290, 290);
  rect(x + 175, y + 350, 250, 100);
  rect(x + 175, y + 350, 100, - 150);
  rect(x + 425, y + 350, - 100, - 150);
  
  //eyes nose mouth
  fill(0);
  strokeWeight(4);
  stroke(random(255));
  ellipse(x + 200, y + 250, 45, 45);
  ellipse(x + 400, y + 250, 45, 45);
  triangle(x + 300, y + 280, x + 320, y + 290, x + 280, y + 290);
  line(x + 300, y + 57, x + 275, y + 64);
  line(x + 275, y + 64, x + 298, y + 71);
  line(x + 298, y + 71, x + 305, y + 79);
  line(x + 305, y + 79, x + 299, y + 89);
  fill(255);
  ellipse(x + 205, y + 250, 10, 10);
  ellipse(x + 395, y + 250, 10, 10);
 
  
}

void mousePressed()
  {
    background(random(255));
   ellipse( mouseX, mouseY, 1, 1);
   
   
  }
