
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 80;
int patternSeperationY = 80;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(30,255,255,80);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(0);
   
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
  triangle(0,50,50,50,100,0);
  triangle(0,50,50,50,100,0);
  
  fill(20,20,255,80);
  noStroke();
  triangle(0,25,25,25,25,0);
  
  fill(20,70,200,60);
  noStroke();
  triangle(0,100,100,100,100,0);
  
  
  
  
   
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

