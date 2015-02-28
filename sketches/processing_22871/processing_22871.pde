
int x = 0;

void setup () {
 size (500,500);
 noFill();
 stroke(0,20);
 strokeWeight(15);
 background(255);
 smooth();

  
  
}

void draw() {
  if (x<500)
  {
  ellipse(250,x,x,x);
x = x+1;
  
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

