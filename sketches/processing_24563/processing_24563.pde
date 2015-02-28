

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 int x = 1;
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;

void setup(){
  size(400,800);
  noLoop();

  smooth();
  background(0);
  
  //the white box simply shows you the space your pattern gets drawn in
  noStroke();
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
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
noStroke(); 
fill(94,50,100,240);
triangle(25,10,15,60,30,50);
triangle(15,60,30,50,30,90);
triangle(15,60,30,50,50,80);
fill(87,118,206,240);
triangle(60,90,70,50,90,40);
triangle(70,50,90,40,60,10);
triangle(90,40,70,50,40,20);

 
 x = x+x;
 x = x+x;

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


