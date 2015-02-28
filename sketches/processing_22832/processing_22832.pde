
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  smooth();
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction()
{
  smooth();
  for(int a = 0; a < 5; a = a + 1)
  {
    float b = random(0,100);
    float c = random(0,100);
    for(int d = 0; d < 20; d = d + 5)
    {
      stroke(255);
      strokeWeight(random(1,2));
      line(b,c,100,100);
    }
    for(int x = 0; x < 20; x = x + 5)
    {
      stroke(255);
      strokeWeight(random(1,2));
      line(0,0,b,c);
    }
    fill(20,40,150);
    ellipse(b,c,10,10);
  }
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

