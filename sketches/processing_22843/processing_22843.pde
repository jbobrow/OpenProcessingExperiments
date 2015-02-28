
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;
 
 
void setup(){
  size(500,500);
    background(120,25,0);
   
  //the white box simply shows you the space your pattern gets drawn in
//  fill(255);
  noStroke();
 // rect(0,0,patternSeperationX,patternSeperationY);
  noStroke();
   
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
   

//  line(0,50,50,50);
   
   fill(255,255,0);
  triangle(0,0,25,25,50,0); 
    

   fill(0,255,255);
  triangle(0,50,25,25,50,50);
    
     fill(255,0,255);
  triangle(25,25,0,0,0,50);

    fill(255,0,0);
  ellipse(25,25,25,25);
    
    
  noStroke();
   

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


