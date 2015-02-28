
int x1 = 25;
int y1 = 40;
int x2 = 25;
int y2 = 360;

void setup()
{
  size(200,400);
  background(255);
    
}

void draw()
{
  smooth();
  noFill();
  strokeWeight(10);
  stroke(25,40,150,100);
  ellipse(x1,y1,25,25);
  ellipse(x1,y1,75,75);
  ellipse(x1,y1,125,125);
  ellipse(x1,y1,175,175);
  ellipse(x1,y1,225,225);
  ellipse(x1,y1,275,275);
  ellipse(x1,y1,325,325);
  ellipse(x1,y1,375,375);
  ellipse(x1,y1,425,425);
  ellipse(x1,y1,475,475);
  ellipse(x1,y1,525,525);
  ellipse(x1,y1,575,575);
  ellipse(x1,y1,625,625);
  ellipse(x1,y1,675,675);
  ellipse(x1,y1,725,725);
  ellipse(x1,y1,775,775);
  
  
  stroke(71,255,51,100);
  ellipse(x2,y2,25,25);
  ellipse(x2,y2,75,75);
  ellipse(x2,y2,125,125);
  ellipse(x2,y2,175,175);
  ellipse(x2,y2,225,225);
  ellipse(x2,y2,275,275);
  ellipse(x2,y2,325,325);
  ellipse(x2,y2,375,375);
  ellipse(x2,y2,425,425);
  ellipse(x2,y2,475,475);
  ellipse(x2,y2,525,525);
  ellipse(x2,y2,575,575);
  ellipse(x2,y2,625,625);
  ellipse(x2,y2,675,675);
  ellipse(x2,y2,725,725);
  ellipse(x2,y2,775,775);
  //ellipse(200,200,112.5,112.5);
  //ellipse(200,200,200,200);
  
  
  stroke(255);
  strokeWeight(10);
  ellipse(200,200,50,50);
  ellipse(200,200,150,150);
  ellipse(200,200,250,250);
  ellipse(200,200,350,350);
  ellipse(200,200,450,450);
  
  stroke(240,228,0,40);
  strokeWeight(5);
    
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

