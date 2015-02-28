
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;

 
void setup(){
  size(500,500);
  smooth();
   
  //the white box simply shows you the space your pattern gets drawn in
  noFill();
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
 
  
  noFill();
  ellipse(50,50,50,50);
  ellipse(50,50,55,55);
  ellipse(50,50,60,60);
  
  line(50,20,100,0);
  line(50,20,100,5);
  line(50,20,100,10);
  line(50,20,100,15);
  line(50,20,100,20);
  line(50,20,100,25);
  line(50,20,100,30);
  line(50,20,100,35);
  line(50,20,100,40);
  line(50,20,100,45);
  line(50,20,100,50);
  line(50,20,100,55);
  line(50,20,100,60);
  line(50,20,100,65);
  line(50,20,100,70);
  line(50,20,100,75);
  line(50,20,100,80);
  line(50,20,100,85);
  line(50,20,100,90);
  line(50,20,100,95);
  line(50,20,100,100);
  
  line(80,50,100,100);
  line(80,50,95,100);
  line(80,50,90,100);
  line(80,50,85,100);
  line(80,50,80,100);
  line(80,50,75,100);
  line(80,50,70,100);
  line(80,50,65,100);
  line(80,50,60,100);
  line(80,50,55,100);
  line(80,50,50,100);
  line(80,50,45,100);
  line(80,50,40,100);
  line(80,50,35,100);
  line(80,50,30,100);
  line(80,50,25,100);
  line(80,50,20,100);
  line(80,50,15,100);
  line(80,50,10,100);
  line(80,50,5,100);
  line(80,50,0,100);
  
  line(50,80,0,100);
  line(50,80,0,95);
  line(50,80,0,90);
  line(50,80,0,85);
  line(50,80,0,80);
  line(50,80,0,75);
  line(50,80,0,70);
  line(50,80,0,65);
  line(50,80,0,60);
  line(50,80,0,55);
  line(50,80,0,50);
  line(50,80,0,45);
  line(50,80,0,40);
  line(50,80,0,35);
  line(50,80,0,30);
  line(50,80,0,25);
  line(50,80,0,20);
  line(50,80,0,15);
  line(50,80,0,10);
  line(50,80,0,5);
  line(50,80,0,0);
  
  line(20,50,0,0);
  line(20,50,5,0);
  line(20,50,10,0);
  line(20,50,15,0);
  line(20,50,20,0);
  line(20,50,25,0);
  line(20,50,30,0);
  line(20,50,35,0);
  line(20,50,40,0);
  line(20,50,45,0);
  line(20,50,50,0);
  line(20,50,55,0);
  line(20,50,60,0);
  line(20,50,65,0);
  line(20,50,70,0);
  line(20,50,75,0);
  line(20,50,80,0);
  line(20,50,85,0);
  line(20,50,90,0);
  line(20,50,95,0);
  line(20,50,100,0);
  
  
  
  
  
 
 
  
  
  
   
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


