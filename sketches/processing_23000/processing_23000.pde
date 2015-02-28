
int x = 0;
int y = 0;
int z = 55;
int q = 20;
int b = 10;


void setup(){
  size(500,500);
  background(255);
  
}


void draw()
{
  stroke(q,z,0,20);
  strokeWeight(3);
  if(random(0,2) < 1){
    line(0,0,x,y);
    x = x + b;
    if(x > 500){
      x = 0;
      y = y + b;
      if(y > 500){
        y = 0;
        x = 0;
        z = z + 25;
        q = q + 10;
        b = b +10;
      }
    }
  }
}


void yourFunction(){
  
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


