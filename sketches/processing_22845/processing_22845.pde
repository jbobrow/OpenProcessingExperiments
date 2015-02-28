
void setup()
{
  size(500,500);
  background(0);
//  stroke(255,random(0,127));
  smooth();
}

void draw()
{

  noFill();
  for(int i = 0; i < 500; i = i + 10){
   stroke(225,225,225,random(0,3));
    bezier(i,0,800,600,10,10,i,500);
    bezier(0,i,600,800,10,10,500,i);
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

