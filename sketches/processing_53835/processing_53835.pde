
int c=0;
void setup()
{
  size(1200,700);
   smooth();
  background(0);
}

void draw()
{
  c++;
  noStroke();       //fills bg with rectangle of lower opacity. Use this instead of bagckground() for opacity parameter.
  fill(0, 10);
  rect(0, 0, width,height);
   strokeWeight(random(30));        
  if(c%60==0)
  {
    fill(82,255,15);
  }
  else
  {
    stroke(255,5,5);
  }
 ellipse(mouseX+random(-600,600),mouseY+random(-350,350),mouseX+random(-600,600),mouseY+random(-350,350));
  
}


