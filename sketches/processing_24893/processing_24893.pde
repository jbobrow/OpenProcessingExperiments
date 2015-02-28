


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


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
  
stroke(#FFFFFF);
noFill();
rect(25, 25, 50, 50);
stroke(#8de1fd);
line(0,0,25,25);
line(100,0,75,25);
line(0,100,25,75);
line(100,100,75,75);
stroke(#5abee0);
triangle(25,25,50,10,75,25);
triangle(25,25,50,15,75,25);
triangle(25,25,10,50,25,75);
triangle(25,25,15,50,25,75);
triangle(75,25,90,50,75,75);
triangle(75,25,85,50,75,75);
triangle(75,75,50,90,25,75);
triangle(75,75,50,85,25,75);
stroke(#64b3e0);
line(90,50,100,50);
line(0,50,10,50);
line(25,25,75,75);
line(75,25,25,75);

rect(32,32,36,36);
stroke(#4780a0);
triangle(32,32,45,50,32,68);
triangle(68,32,55,50,68,68);
triangle(32,68,50,55,68,68);
triangle(32,32,50,45,68,32);
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

