
class floatingText
{
  String[] letters;
  int ssize;
  float[] yyy;
  float angle = 0.0;
  float hh=(TWO_PI / 100.0)*2;
  
  floatingText(String tempS, int tempSize)
  {
    letters = split(tempS, ',');
    yyy = new float[letters.length];
    ssize = tempSize;
  }
  
  void wave()
  {
    angle += 0.08;
    
    float h = angle;
    for(int i=0;i<yyy.length;i++)
    {
      yyy[i] = sin(h)*75;
      h+=hh;
    }
  }
  
  void display(int xx, int yy)
  {
    for(int i=0;i<letters.length;i++)
    {
      text(letters[i],xx+(i*(ssize-10)),yy+yyy[i]); 
    }
  }
  
}

