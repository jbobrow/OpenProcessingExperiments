
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////

//what happens if you change these both to 50? what are they doing to the pattern?

int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(1000,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(255,0,2);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);

PImage b;
b  = loadImage("background.jpg");

b.resize(1000,500);
  background(b);
  strokeWeight(2);
  
 
 
  
  
  //first door
  noStroke();
  fill(150,20,0);
  rect(125,89,185,338);
  noFill();
  
  stroke(1);
  //top 
  line(125,89,310,89);
  line(125,89,125,425);
  line(125,425,310,425);
  line(310,89,310,425);
  
  
  
  
  //second door
  line(310,89,500,89); 
  line(310,425,500,425); 
  line(500,89,500,425);
  line(310,89,310,425);
  
  
  
  //third door
  line(515,89,700,89);
  line(515,89,515,425);
  line(700,89,700,425);
  line(515,425,700,425);
  
  //fourth door
  line(515,89,890,89);
  line(515,89,515,425);
  line(515,425,890,425);
  line(890,89,890,425);
  

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

