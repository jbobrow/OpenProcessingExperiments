
int patternSeperationX = 100;
int patternSeperationY = 100;
 
  
void setup(){
  size(500,500);
  smooth();
  
    
    
   
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



ellipse(50,25,30,30);
fill(250,200,50);
ellipse(100,25,50,50);
fill(50,200,250);
ellipse(50,25,50,50);
fill(200,250,50);
rect(0,0,50,50);
fill(200,50,250);
triangle(0,50,50,50,25,75);
fill(250,50,200);
triangle(0,100,50,100,25,75);
fill(100,150,150);
ellipse(75,75,50,50);
line(0,0,50,50);
line(25,0,25,50);
line(75,50,75,100);
fill(250,160,170);
quad(75,50,50,75,75,100,100,75);
fill(150,206,46);
ellipse(75,75,40,40);
line(50,0,0,50);











  
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

