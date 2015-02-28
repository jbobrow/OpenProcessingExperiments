
class Ribbon
{
  float x,y,z;
  float seed;
  ArrayList segments;
  color tintcolor;
  Ribbon()
  {
    tintcolor = color(random(255));
    x = 0;
    y = random(-width/2,width/2);
    z = 0;
    seed = random(10000);
    segments = new ArrayList();

    float _x = x;
    float _z = z;

    for(int i=0;i<textures.length;i++)
    {
      float degree = random(TWO_PI);
      Segment temp_pt = new Segment(_x,y,_z,_x+sin(degree)*150,y,_z+cos(degree)*150,i);
      _x += sin(degree)*150;
      _z += cos(degree)*150;

      segments.add(temp_pt);
    }
  }

  void render()
  {
    for(int i=0;i<segments.size();i++)
    {
      Segment temp = (Segment)segments.get(i);
      temp.render();
    }
  }

  void update()
  {
    float _x,_z;
    float degree;

    Segment temp = (Segment)segments.get(0);

    if(mousePressed)
    {
      temp.x +=   (mouseX-pmouseX)*2;
      temp.z +=   (mouseY-pmouseY)*2;
    }
    else if(group)
    {
      temp.x+=(noise((frameCount)*0.01)-0.5)*300;
      temp.z+=(noise((-frameCount)*0.01)-0.5)*300;

      temp.x +=(0-temp.x)*0.01;
      temp.z +=(0-temp.z)*0.01;
    }
    else
    {
      temp.x+=(noise((seed+frameCount)*0.003)-0.5)*150;
      temp.z+=(noise((seed-frameCount)*0.003)-0.5)*150;

      temp.x +=(0-temp.x)*0.02;
      temp.z +=(0-temp.z)*0.02;
    }

    degree = atan2((temp.z2-temp.z),(temp.x2-temp.x));

    temp.x2 = temp.x+cos(degree)*150;
    temp.z2 = temp.z+sin(degree)*150;
    _x = temp.x2;
    _z = temp.z2;

    tint(tintcolor);
    for(int i=1;i<segments.size();i++)
    {
      temp = (Segment)segments.get(i);

      temp.x = _x;
      temp.z = _z;

      degree = atan2(-(temp.z-temp.z2),-(temp.x-temp.x2));
      temp.x2 = temp.x+cos(degree)*150;
      temp.z2 = temp.z+sin(degree)*150;
      _x = temp.x2;
      _z = temp.z2;
    }
    render();
  }
}

