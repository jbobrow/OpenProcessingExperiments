
void setup()
{
  size(200,400);
  background(255);
  smooth();
}

void draw()
{
  noStroke();
  fill(71,255,51,150);
  //triangle(0,0,200,0,0,400);
  ellipse(0,0,400,400);
  //ellipse(200,0,400,400);
  ellipse(200,400,400,400);
  //ellipse(0,400,400,400);
  noFill();
  strokeWeight(10);
  stroke(25,40,150);
  ellipse(100,200,50,50);
  ellipse(100,200,130,130);
  ellipse(100,200,210,210);
  ellipse(100,200,290,290);
  ellipse(100,200,370,370);
  
  stroke(255);
  ellipse(100,200,10,10);
  ellipse(100,200,90,90);
  ellipse(100,200,180,180);
  ellipse(100,200,260,260);
  ellipse(100,200,340,340);
  ellipse(100,200,420,420);
  
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

