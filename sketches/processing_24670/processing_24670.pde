
int X = 90;
int Y = 90;
void setup(){
  size(300,600);
  background(255);
  smooth();
  stroke(9, 205, 229);
  strokeWeight(5);
  for(int i = 0; i < width/X+100; i++){
  for(int j = 0; j < height/Y+100; j++){
  pushMatrix();
  translate(i*X, j*Y);
  Cube();
  popMatrix();
}
}
}
void draw(){}

void Cube(){
  rotate(67);
  fill(255, 0, 0, 19);
  rect(0,0,200,200);
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


