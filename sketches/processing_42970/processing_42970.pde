
int rectDiameter;
int[][] sqArray;

void setup()
{
  size(300, 300);
  background(255);
  rectDiameter = 20;
  sqArray = new int[30][30];
  rectMode(CENTER);
}

void draw()
{
  background(255);
  fill(0);
  
  for(int i = 0; i < 15; i++)
  {
    for(int j = 0; j < 15; j++)
    {
      float d = constrain(map(dist(10 + j * rectDiameter , 10 + i * rectDiameter, mouseX, mouseY), 0, 150, 20, 0), 0, 20);
      
      if(d != 0)
      {
        pushMatrix();
        translate(10 + j * rectDiameter , 10 + i * rectDiameter);
        rotate(PI/4);
        rect(0, 0, d, d);
        popMatrix();
      }
    }
  }
}

