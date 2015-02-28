
void setup () {
  size(500, 500);
  background(0, 0, 0);
  smooth();
  int a = 80;
}

void draw () {

  for (int i = 1; i <= 4; i++)
  {
    for (int j = 1; j <= 4; j++)
    {
      for (int x=1; x <= 5; x++) 
      {
        for (int y=10; y>1; y--)
        {
          stroke(255,0,0);
          strokeWeight(2);
          int a = 80;
          int b = x*8;
          //base
          fill(255, 0, 0);
          ellipse(i*100, j*100, y*8, y*8);
          fill(255, 255, 255);
          ellipse(i*100, j*100, y*8, y*8);
        }
      }
    }
  }
}
