
class Branch
{
  float x,y,z,x1,y1,z1;
  float angleX, angleY;
  color col;
  float width;
  float length; 
  float colorDiff;
  float randomStop;

  Branch(float _x, float _y,  float _z, float _angleX, float _angleY, color _col, float _width, float _length, float _colorDiff)
  {
    x = _x;
    y = _y;
    z = _z;
    angleX = _angleX;
    angleY = _angleY;
    col = _col;
    width = _width;
    length = _length;

    x1 = x + length * sin(angleY) * cos(angleX);
    y1 = y + length * cos(angleY);
    z1 = z + length * sin(angleY) * sin(angleX);
    colorDiff = _colorDiff;

    branches.add(this);

    randomStop = random(1,3);
    if(width>randomStop && length>randomStop)
    {
      int numChildren = (int)random(1,3);

      for(int i=0;i<numChildren;i++)
      {
        new Branch(x1,y1,z1,angleX+random(-0.7,0.7),angleY+random(-0.7,0.7),color(hue(col),saturation(col),brightness(col)+colorDiff),(width-1)*random(0.9,0.98),(length-1)*random(0.95,0.99),colorDiff+random(-2,2));
      }
    }
  }

  void draw()
  {
    if(width>randomStop && length>randomStop)
    {
      stroke(col);
      strokeWeight(width/2);
      line(x,y,z,x1,y1,z1);
    } 
    else
    {
      Vertex2D temp = new Vertex2D(x,y,z,col);
      stroke(0);
      strokeWeight(1);
      fill(temp.c,200);
      float size =  random(3,6);
      pushMatrix();
      translate(temp.x,temp.y,temp.z);
      ellipse(0,0,size,size);
      popMatrix();
    }
  }
}

