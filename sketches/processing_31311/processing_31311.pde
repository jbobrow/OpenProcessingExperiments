
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
  background(0);
   
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
   
  stroke(59,182,92);
  strokeWeight(2);
  line(100,100,0,0);
  line(0,100,100,0);
  line(0,50,50,0);
  line(0,25,25,0);
  line(0,75,75,0);
  fill(0);
  ellipse(50,50,25,25);
  ellipse(75,25,15,15);
  ellipse(25,75,15,15);
  ellipse(75,75,15,15);
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

