


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 150;
int patternSeperationY = 150;


void setup(){
  size(300,600);
 
  smooth();
  noFill();
  background(#3D3D3D);

  
  //the white box simply shows you the space your pattern gets drawn in

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

 stroke(#E033FF);
ellipse(75,75,45,45);
stroke(#FF33B8);
ellipse(75,75,65,65);
stroke(#FF33B8);
rect(75,75,40,40);
rect(75,35,40,40);
rect(35,35,40,40);
rect(35,75,40,40);

line(75,75,55,35);
line(75,75,95,35);

line(150,0,0,150);
line(0,0,150,150);
    //rect(75,75,120,120);
    //rect(120,120,75,75);
line(0,0,75,35);
line(150,0,75,35);
line(0,150,75,115);
line(150,150,75,115);
triangle(0,0,35,35,0,50);
triangle(150,0,115,35,150,50);
triangle(35,115,0,150,0,100);
triangle(150,150,115,115,150,100);
line(0,0,150,0);
line(75,0,75,150);
line(0,75,150,75);
line(150,0,150,150);
//fill(#3755A0);
triangle(75,35,115,0,75,0);
triangle(75,115,75,150,115,150);
triangle(75,115,40,150,75,150);
triangle(75,35,40,0,75,0);

line(35,35,0,75);
line(35,115,0,75);
line(115,35,150,75);
line(115,115,150,75);



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

