
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 90;
int patternSeperationY = 90;


void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
 background(162,203,255);

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
  

  line(0,50,50,500);
  strokeWeight(4);   // Thicker

  line(50,500,500,0);
  strokeWeight(1);   // Default
 
  fill(70,67,68);
  rect(20,20,60,60);
  fill(15,15,15);
  rect(20,20,20,20);
 
  
  fill(206,29,29);
  ellipse(50,50,50,50);
  ellipse(50,50,45,45);
  ellipse(50,50,10,10);
  ellipse(50,50,5,5);

  fill(5,5,5);
  ellipse(40,40,5,5);
  ellipse(60,40,5,5);
  ellipse(40,60,5,5);
  ellipse(60,60,5,5);
 
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

