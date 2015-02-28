
int X = 100;
int Y = 50;
void setup(){
  size(300,600);
  background(255);
  smooth();
  strokeWeight(25);
  //stroke(9,205,229,75);
  for(int i = 0; i < width/X+100; i++){
  for(int j = 0; j < height/Y+100; j++){
  pushMatrix();
  translate(i*X, j*Y);
  Steps();
  popMatrix();
}
} 
}
void draw(){}

void Steps(){
   stroke(9,205,229,100);
 line(0, Y, Y, Y);
   stroke(255,0,0,100);
 line(Y, Y, Y, 25);
   stroke(9,205,229,100);
 line(Y, 25, X, 25);
   stroke(255,0,0,100);
 line(X, 25, X, 0);
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


