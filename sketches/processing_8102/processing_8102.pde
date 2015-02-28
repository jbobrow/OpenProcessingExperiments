
//this class draws circles
public class drawCircle
{
  private float px,py,fx,fy;
  
  public drawCircle(float preX, float preY, float afterX, float afterY)
  {
      fx = preX;
      fy = preY;
      px = afterX;
      py = afterY;
  
  }
  
  public float getFX1()
  {
      return fx;
  }
  
  public float getFY1()
  {
      return fy;
  }
  
  public float getPY1()
  {
      return py;
  }
  
  public float getPX1()
  {
      return px;
  }
  public void show1()
  {
    if(checkSwitch == false)
    {
      if(getFX1() > 200)
      {
        stroke(255, 255,255);
        fill(0,0,0);
      }
      else
      {
        stroke(0, 0,0);
        fill(255,255,255);
      }
    }
    if(checkSwitch == true)
    {
      if(getFX1() > 200)
      {
        stroke(0, 0,0);
        fill(255,255,255);
      }
      else
      {
        stroke(255, 255,255);
        fill(0,0,0);
      }
    }
    
    ellipse(fx,fy,px,py);
  }
  
  
  
  


}

