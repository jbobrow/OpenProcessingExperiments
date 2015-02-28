

int X = 80;
int Y = 80;


void setup()
{
  size(500,500);
  background(255);
  for(int i = 0; i < width/X; i++) {
    for(int j = 0; j < height/Y; j++) {
      pushMatrix();
      translate(i*X, j*Y);
      shape1();
      popMatrix();
      noLoop();
    }
  }
}

void shape1()
{
  fill(0,50);
  noStroke();
  rect(0,0,75,75);
  fill(0,30);
  rect(25,10,35,35);
  rect(50,50,65,65);
}

void draw()
{
}

void keyPressed()
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
