
  float yPos= 600; 
  int c=0;
  
  void setup() 
{ 
    size(400,600);
    frameRate(30);
} 
  void draw() { 
    background(255);
    fill(0);
    String s = "LOOK OUT! This text will slowly be covered!!!";
    textSize(70);
    while(yPos < 0) {
      yPos = 0;
      delay(250);
      c=255;
      s = "Press Mouse to Uncover Text";
     }
   if (yPos > 0){
     c=0;
   }
  fill(0);
  rect(0, yPos, width, 600);
  fill(c);
  text(s, 10, 20, 380, 580);
  
  yPos = yPos - 3.5;
  if(mousePressed) {
     yPos = yPos + 5;  
     
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









