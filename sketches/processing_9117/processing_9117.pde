
class PointBezier
{
  String _nom;
  float _x,_y;
  float _rayon;
  PointBezier(String nom, float x, float y)
  {
    _nom = nom;
    _rayon = 5;
    _x = x;
    _y = y;
  }
  
  boolean estInterieur(float x, float y)
  {
    return (dist(x,y,_x,_y)<=_rayon);    
  }
  
  void dessine()
  {
    noStroke();
    fill(209,0,0);
    ellipse(_x,_y,_rayon,_rayon);
    textFont(font2);
    text(_nom+" ("+_x+","+_y+")",_x+4,_y-4);
  }
  
}

void dessineLignesPointsBezier()
{
  V1.dessine();
  V2.dessine();
  C1.dessine();
  C2.dessine();

  stroke(209,0,0);
  line(V1._x, V1._y, C1._x, C1._y);
  line(V2._x, V2._y, C2._x, C2._y);
}

PointBezier testeClickPoints()
{
  PointBezier p = null;
  if (V1.estInterieur(mouseX,mouseY))
    p = V1;
  else
  if (C1.estInterieur(mouseX,mouseY))
    p = C1;
  else
  if (V2.estInterieur(mouseX,mouseY))
    p = V2;
  else
  if (C2.estInterieur(mouseX,mouseY))
    p = C2;
  
  return p;
}

void dessineTexteInfos()
{
  String s = "bezier("+V1._x+","+V1._y+","+C1._x+","+C1._y+","+C2._x+","+C2._y+","+V2._x+","+V2._y+");";
  
  fill(209,0,0);
  textFont(font,14);
  text(s,4,height-10);
}


