
class Box
{
  float x,y,z;
  color col;
  float size;

  Box(float _x,float _y,float _z, color _col, float _size)
  {
    x = _x;
    y = _y;
    z = _z;
    col = _col;
    size = _size;
  }
  
  //called everyframe
  void update()
  {
    size += (3-size)*0.1;            //try to shrink to original size (3...or 3.5)
    render();
  }
  
  //dealing with render jobs
  void render()
  {
    pushMatrix();
    translate(x*a,y*a,z*a);
    noStroke();
    if(size>3.1)
    {
      noFill();
      stroke(col);
    }
    else
    {
      fill(col);
      noStroke();
    }
    box(size);
    popMatrix();
  }
}

