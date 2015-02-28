


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 75;



void setup(){
  
  size(400,800);

    background(255);
    
    
  //the white box simply shows you the space your pattern gets drawn in
  fill(555);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
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


void yourFunction(){
  int x=45;
 int y=-15;
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  stroke(100,255,100);
strokeWeight(10);
 fill(250,100,100);
 arc(80, 00, 150, 150, 0, PI/2);
arc(80, 00, 150, 150, PI/2-PI/4, PI);

noStroke();
fill(0);
  ellipse (10+x,50+y,10,10);
  triangle(10+x,55+y,10+x,45+y,30+x,50+y);
  ellipse(35+x,25+y,10,10);
  triangle(30+x,25+y,40+x,25+y,35+x,45+y);
  ellipse(35+x,70+y,10,10);
  triangle(30+x,70+y,40+x,70+y,35+x,50+y);
  
  ellipse (60+x,50+y,10,10);
  triangle(60+x,55+y,60+x,45+y,40+x,50+y);
  
  
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

