

int patternSeperationX = 50;
int patternSeperationY = 50;

 
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
  
  
  fill(103,19,16);
  quad(50,0,0,50,100,0,0,100);
  fill(16,20,103);
  quad(100,0,0,100,150,0,0,150);
  fill(126,23,19);
  quad(50,0,0,50,25,0,0,25);
  fill(255);
  triangle(0,0,25,0,0,25);
  fill(20,25,144);
  ellipse(50,50,20,20);
  fill(255,111,0);
  ellipse(30,30,20,20);
  fill(0);
  rect(0,0,10,10);
  fill(70,103,44);
  triangle(25,25,40,50,50,40);
 
 
 
 
 
 
 
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



