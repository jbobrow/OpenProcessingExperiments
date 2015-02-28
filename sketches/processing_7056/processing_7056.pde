
class Const
{
  float distance;
  float dampening;
  Part p1;
  Part p2;
  public Const(Object input1,Object input2,float dist,float damp)
  {
    dampening = damp;
    distance = dist;
    p1 = (Part)input1;
    p2 = (Part)input2;
  }
  public float moveX(float angle,float distance)
  {
    return cos(angle)*distance;
  }
  public float moveY(float angle,float distance)
  {
    return sin(angle)*distance;
  }
  void borders(float x,float y, float r)
  {
    if(x<r) x = r;
    if(y<r) y = r;
    if(x>width-r) x = width-r;
    if(y>height-r) y = height-r;
  }
  public void satisfy()
  {
    float x1 = p1.x;
    float x2 = p2.x;
    float y1 = p1.y;
    float y2 = p2.y;
    float diff = dist(x1,y1,x2,y2) - distance;
    float angle = atan2(y2-y1,x2-x1);
    if(!p1.pinned && !p2.pinned)
    {
      p1.x+=moveX(angle,diff/2)*dampening;
      p1.y+=moveY(angle,diff/2)*dampening;
      p2.x-=moveX(angle,diff/2)*dampening;
      p2.y-=moveY(angle,diff/2)*dampening;
    }
    if(p1.pinned && !p2.pinned)
    {
      //p1.x+=moveX(angle,diff/2)*dampening;
      //p1.y+=moveY(angle,diff/2)*dampening;
      p2.x-=moveX(angle,diff)*dampening;
      p2.y-=moveY(angle,diff)*dampening;
    }
    if(!p1.pinned && p2.pinned)
    {
      p1.x+=moveX(angle,diff)*dampening;
      p1.y+=moveY(angle,diff)*dampening;
      //p2.x-=moveX(angle,diff)*dampening;
      //p2.y-=moveY(angle,diff)*dampening;
    }
    borders(p1.x,p1.y,p1.r);
    borders(p2.x,p2.y,p2.r);
  }
}

