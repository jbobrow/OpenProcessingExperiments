
public class Building
{
  int floors;
  float px;
  float pz;
  Building()
  {
    px = int(random(-24,32))*100-50;
    pz = int(random(-40,0))*100-50;
    floors = int(random(1,15));
  }
  
  Building (float tx , float tz , float w , int fls)
  {
    px = tx;
    pz = tz;
    floors = fls;
  }
  
  public void display()
  {
    for (int i = 0 ; i<floors ; i++)
    {
      
      myBox(px,height-10-i*20,pz,40,10);
    }
  }
}

