

int patternSeperationX = 100;
int patternSeperationY = 100;

 
void setup(){
  size(500,500);
   
   
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
  
  ellipse(50,50,50,50);
  line(75,75,125,125);
  line(125,75,75,125);
  ellipse(100,100,40,40);
  line(30,100,70,100);
  line(100,30,100,70);
  line(35,50,65,50);
  line(50,35,50,65);
  ellipse(50,50,20,20);
  ellipse(100,50,30,30);
  ellipse(50,100,30,30);
  line(40,100,60,100);
  line(100,40,100,60);
  ellipse(100,50,10,10);
  ellipse(50,100,10,10);
  line(85,100,115,100);
  ellipse(100,100,15,15);
 
 
 
 
 
 
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



