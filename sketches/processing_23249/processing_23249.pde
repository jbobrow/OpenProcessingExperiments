
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  noFill();
 background(100);
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
  size(500,500);
  
  stroke(0,0,0,random(0,52));
  strokeWeight(0.5);
  
  for(int a = 0; a < 100; a = a + 5)
  {
   line(a,0,a,100);
    line(100,a,0,a);
    line(a,0,100,100);
  line(100,0,0,a);
  line(50,0,a,100);
  ellipse(50,50,100,100);
  ellipse(50,50,87.5,87.5);
  ellipse(50,50,75,75);
  
  ellipse(50,50,62.5,62.5);
  ellipse(a,a,50,50);
  ellipse(50,50,45,45);
  ellipse(50,50,25,25);
  ellipse(100,100, 25,25);
  ellipse(100,100,40,40);
  ellipse(a,a,42,42);
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

