
void setup ()
{
  size(500,500);
  background (255);
}

void draw()
{
   DrawLines();
}
  
  void DrawLines()
  {
  for (int i = 0; i < width; i ++)           //just used what was in void draw of question
  line (i*20, height/2,i*20 +10, height/2);  //and then took out text bit.
}
