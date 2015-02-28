
void setup()
{
  size(500,500);
  background(255);
  stroke(0);
  smooth();
}

void draw()
{
  noFill();
  for(int i = 0; i < 600; i = i + 10){
    triangle(i ,50 + i ,3*i,2*i,i + 200,50 + i);
//    bezier(0, i, 150, 200, 250, -300, 500, i);
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

