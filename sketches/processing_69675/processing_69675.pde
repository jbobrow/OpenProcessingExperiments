
float dia; 
int lineWeight;

void setup()
{
  size(900, 900);
  smooth();
  dia = 0;
  lineWeight = 0;
}

void draw()
{
  if ( mousePressed && ( mouseButton == LEFT) )
  {
    fill(random(255), 0, 200, 50);
    stroke(200, random(255), 0, random(100, 200));
    strokeWeight(abs(dia/8));
    arc( mouseX, mouseY, dia, dia, random(-TWO_PI, TWO_PI), random(-TWO_PI, TWO_PI));
    dia += 1;
    stroke(0, 200, random(255), 50);
    strokeWeight(abs(lineWeight));
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if ( mousePressed && ( mouseButton == RIGHT) )
  {
    fill(random(255), 0, 200, 50);
    stroke(200, random(255), 0, random(100, 200));
    strokeWeight(abs(dia/8));
    arc( mouseX, mouseY, dia, dia, random(-TWO_PI, TWO_PI), random(-TWO_PI, TWO_PI));
    dia -= 1;
    stroke(0, 200, random(255), 50);
    strokeWeight(abs(lineWeight));
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void keyPressed( )
{
  if( keyCode == UP )
  {
    lineWeight +=5;
  }
  if( keyCode == DOWN )
  {
    lineWeight -=5;
  }
}
