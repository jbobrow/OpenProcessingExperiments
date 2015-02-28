
float x =150;
float y = 25;

void setup (){
  size (400, 400);
  
  background(255, 0, 255);
  stroke (255, 255, 255, 100);
  smooth();
  
}
void draw(){
  line (x, y, mouseX, mouseY);
}
void mousePressed () {
  x = mouseX;
  y = mouseY;
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


