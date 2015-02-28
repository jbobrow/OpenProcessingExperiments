
class Biter
{
  float x, y;
  float ease = 0.09;

  float startAngle1 = 5.5*PI/6;
  float startAngle2 = 6.5*PI/6;
  float biteAngle1 = 0;
  float biteAngle2 = 2*PI;

  float targetAngle1 = startAngle1;
  float targetAngle2 = startAngle2;

  float angle1 = targetAngle1;
  float angle2 = targetAngle2;
  
  int biterRad = 80;

  Biter(float xpos, float ypos)
  {
    x = xpos;
    y = ypos;
  }

  void display(int biterRad, int embiggen)
  {
    if (mousePressed)
    {
      targetAngle1 = biteAngle1;
      targetAngle2 = biteAngle2;
    }
    else
    {
      targetAngle1 = startAngle1;
      targetAngle2 = startAngle2;
    }

    angle1 += (targetAngle1-angle1)*0.60;
    angle2 += (targetAngle2-angle2)*0.60;

    pushMatrix();
    float angle = atan2(mouseY-y, mouseX-x);

    translate(x, y);
    rotate(angle);
    
    biterRad += embiggen;
    
    fill(188, 0, 22);
    arc(0, 0, biterRad, biterRad, angle1, angle2);
    popMatrix();
  }

  void update()
  {
//    x = constrain(x, 80, width-80);
//    y = constrain(y, 80, height-80);

    float targetX = mouseX;
    x += (targetX - x) * ease;
    float targetY = mouseY;
    y += (targetY - y) * ease;

    //    py = y;
    //    px = x;
  }
  
  float returnX()
  {
    return x;
  }
  
  float returnY()
  {
    return y;
  }
}


