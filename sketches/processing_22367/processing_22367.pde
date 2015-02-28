

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
    fill(140,140,140);
  ellipse(50,50,50,50);
    fill(200,200,200);
  ellipse(50,50,30,30);
line(75,75,125,125);
line(125,75,75,125);
    fill(95,95,95);
  ellipse(100,100,40,40);
    fill(250,250,250);
  ellipse(100,100,30,30);
line(30,100,70,100);
line(100,30,100,70);
line(35,50,65,50);
line(50,35,50,65);
    fill(30,30,30);
  ellipse(50,50,20,20);
    fill(130,130,130);
  ellipse(100,50,30,30);
    fill(240,240,240);
  ellipse(50,100,40,40);
line(30,100,70,100);
line(100,40,100,60);
    fill(50,50,50);
  ellipse(50,100,30,30);
    fill(178,183,55);
  ellipse(100,50,10,10);
    fill(180,100,180);
  ellipse(50,100,10,10);
    fill(150,150,150);
line(85,100,115,100);
    fill(227,178,119);
  ellipse(100,100,15,15);
    fill(19,171,229);
  ellipse(50,50,10,10);
    fill(133,227,119);
  ellipse(75,75,7,7);
    fill(255,141,0);
  ellipse(125,125,7,7);

 
 
 
 
 
 
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



