
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 80;
int patternSeperationY = 80;


void setup(){
  size(640,640);

  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
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
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  fill(100,0,20);
  
  ellipse(20,0,40,20);
  rect(0,0,40,40);
  
  ellipse(20,20,10,10);
  triangle(3,25,37,25,20,37);
  
  triangle(55,40,40,80,55,80);
  triangle(65,40,80,80,65,80);
  triangle(65,0,80,0,80,40);
  triangle(55,0,40,0,40,40);
  
   rect(0,45,40,5);
  rect(0,55,40,5);
  rect(10,40,20,20);
  
  fill(40,100,50);
  
  ellipse(10,10,20,10);
  ellipse(30,10,20,10);
  ellipse(20,20,10,10);
  triangle(3,25,37,25,20,37);
 
  
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

