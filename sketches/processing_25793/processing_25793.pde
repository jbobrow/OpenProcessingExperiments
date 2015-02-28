
void setup()
{
  size(200,400);
  background(255);
  smooth();
  
}

void draw()
{
  noFill();
  stroke(71,255,51                                                                                                                                                                                                                                                                                          );
  strokeWeight(10);
  ellipse(0,0,25,25);
  ellipse(0,0,75,75);
  ellipse(0,0,125,125);
  ellipse(0,0,175,175);
  ellipse(0,0,225,225);
  ellipse(0,0,275,275);
  ellipse(0,0,325,325);
  ellipse(0,0,375,375);
  ellipse(0,0,425,425);
  ellipse(0,0,475,475);
  ellipse(0,0,525,525);
  ellipse(0,0,575,575);
  ellipse(0,0,625,625);
  ellipse(0,0,675,675);
  ellipse(0,0,725,725);
  ellipse(0,0,775,775);
  ellipse(0,0,825,825);
  ellipse(0,0,875,875);
  
    
  stroke(24,40,150);
  ellipse(200,0,25,25);
  ellipse(200,0,75,75);
  ellipse(200,0,125,125);
  ellipse(200,0,175,175);
  ellipse(200,0,225,225);
  ellipse(200,0,275,275);
  ellipse(200,0,325,325);
  ellipse(200,0,375,375);
  ellipse(200,0,425,425);
  ellipse(200,0,475,475);
  ellipse(200,0,525,525);
  ellipse(200,0,575,575);
  ellipse(200,0,625,625);
  ellipse(200,0,675,675);
  ellipse(200,0,725,725);
  ellipse(200,0,775,775);
  ellipse(200,0,825,825);
  ellipse(200,0,875,875);
  
  stroke(255);
  ellipse(0,400,25,25);
  ellipse(0,400,75,75);
  ellipse(0,400,125,125);
  ellipse(0,400,175,175);
  ellipse(0,400,225,225);
  ellipse(0,400,275,275);
  ellipse(0,400,325,325);
  ellipse(0,400,375,375);
  ellipse(0,400,425,425);
  ellipse(0,400,475,475);
  ellipse(0,400,525,525);
  ellipse(0,400,575,575);
  ellipse(0,400,625,625);
  ellipse(0,400,675,675);
  ellipse(0,400,725,725);
  ellipse(0,400,775,775);
  ellipse(0,400,825,825);
  ellipse(0,400,875,875);
  
  stroke(255);
  ellipse(200,400,25,25);
  ellipse(200,400,75,75);
  ellipse(200,400,125,125);
  ellipse(200,400,175,175);
  ellipse(200,400,225,225);
  ellipse(200,400,275,275);
  ellipse(200,400,325,325);
  ellipse(200,400,375,375);
  ellipse(200,400,425,425);
  ellipse(200,400,475,475);
  ellipse(200,400,525,525);
  ellipse(200,400,575,575);
  ellipse(200,400,625,625);
  ellipse(200,400,675,675);
  ellipse(200,400,725,725);
  ellipse(200,400,775,775);
  ellipse(200,400,825,825);
  ellipse(200,400,875,875);

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
  

