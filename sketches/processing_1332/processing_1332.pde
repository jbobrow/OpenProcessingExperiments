
class Cercle{
  Punt centre;
  float radi;

  Cercle(Punt a, Punt b){
    centre=new Punt(a);
    radi=dist(a.x,a.y,b.x,b.y);
  }

}


