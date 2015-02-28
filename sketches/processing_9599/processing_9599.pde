
public class AmmoUp extends Block
{
  public AmmoUp(color c)
  {
    super(c);
  }

  public void act()
  {
    if(r*2>=height&&x+r>centerX-shipWidth/2&&x-r<centerX+shipWidth/2)//if you crash into the block
    {
      super.makeNew(c);
      if(ammo<5)
      {
        ammo++;
        msg("ammo++",5);
        synth.echoPluck(5);
      }
      score+=ptsPerPad;
    }
    else if(x-r>width||x+r<0||r*2>height+1)//if the block leaves the screen
      super.makeNew(c);

    float top = centerY+r;
    float top2 = centerY-r;
    float bottom = centerY+2*r;
    float bottom2 = centerY-2*r;
    fill(c);
    quad(x-r,top,x+r,top,x+2*r,bottom,x-2*r,bottom);//makes a trapezoid
    quad(x-r,top2,x+r,top2,x+2*r,bottom2,x-2*r,bottom2);//makes an upside-down trapezoid
  }
}

