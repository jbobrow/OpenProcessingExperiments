
///////////////////////////////////////////////
/// Written by Levi Berge, 7th March 2011   ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  //fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();
   
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

//black background
fill(0,0,0);
quad(0,0,0,100,100,100,100,0);

//loosely based on my sketch
line(0,40,12.5,40);
line(12.5,40,12.5,100);
line(12.5,100,37.5,100);
line(37.5,100,37.5,40);
line(37.5,40,62.5,40);
line(62.5,40,62.5,100);
line(62.5,100,87.5,100);
line(87.5,100,87.5,40);
line(87.5,40,100,40);

//conversion to arrows
line(0,40,25,0);
line(25,0,50,40);
line(50,40,75,0);
line(75,0,100,40);

//to allow alternating colours
fill(214,0,0);
noStroke();
triangle(0,40,25,0,50,40);
triangle(50,40,75,0,100,40);
quad(12.5,40,12.5,100,37.5,100,37.5,40);
quad(62.5,40,62.5,100,87.5,100,87.5,40);

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

