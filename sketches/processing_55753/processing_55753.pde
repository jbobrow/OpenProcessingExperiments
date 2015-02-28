
//Une "axis aligned box".
public class Box {

  /*
  minX, minY
    +----------------------+
    |                      |
    |                      |
    |                      |
    +----------------------+  maxX maxY*/
    
  private int _minX;
  private int _minY;
  private int _maxX;
  private int _maxY;

  private color _drawColor;

  public int getMinX() {
    return _minX;
  }

  public int getMinY() {
    return _minY;
  }

  public int getMaxX() {
    return _maxX;
  }

  public int getMaxY() {
    return _maxY;
  }

  //devrait lancer des exceptions si min > max, mais trop "inutile" pour cet exercice.
  public void setMinLocation(int x, int y) {
    _minX = x;
    _minY = y;
  }

  //idem
  public void setMaxLocation(int x, int y) {
    _maxX = x;
    _maxY = y;
  }

  public void setDrawColor(int r, int g, int b) {
    _drawColor = color(r, g, b);
  }

  public Box(int minX, int minY, int maxX, int maxY) {
    
    if(minX < maxX){
      _minX = minX;
      _maxX = maxX;
    }
    else{
      _maxX = minX;
      _minX = maxX;
    }
    
    if(minY < maxY){
      _minY = minY;
      _maxY = maxY;
    }
    else{
      _maxY = minY;
      _minY = maxY;
    }
    
    _drawColor = color(50);
  }

  public Box() {
    this(0, 0, 1, 1);
  }

  void draw() {

    fill(_drawColor);

    int w = (int)(_maxX - _minX);
    int h = (int)(_maxY - _minY);
    rect( _minX, _minY, w, h);
  }

  public boolean pointIsInside(float pointX, float pointY) {
    return pointX > _minX && pointX < _maxX &&  pointY > _minY && pointY < _maxY;
  }


  public boolean containsOrIntersectWith(Box other) {

    Ray r = new Ray(); //on va transformer tous les cotés de cette boites en ray, puis regarder s'ils sont en intersection avec other.

   //haut
    r.setOrigin(getMinX(), getMinY() );
    r.setDestination(getMaxX(), getMinY());
    if (other.rayIntersect(r)) {
      return true;
    }

    //droite
    r.setOrigin(getMaxX(), getMinY());
    r.setDestination(getMaxX(), getMaxY());
    if (other.rayIntersect(r)) {
      return true;
    }

    //bas
    r.setOrigin(getMaxX(), getMaxY());
    r.setDestination(getMinX(), getMaxY());
    if (other.rayIntersect(r)) {
      return true;
    }

    //gauche
    r.setOrigin(getMinX(), getMaxY());
    r.setDestination( getMinX(), getMinY());
    if (other.rayIntersect(r)) {
      return true;
    }

    //mais ce n'est pas tout ! This peut contenir other, sans pour autent l'intersecter !
    if ( pointIsInside( other._minX, other._minY ) ||
      pointIsInside( other._maxX, other._minY ) ||
      pointIsInside( other._minX, other._maxY ) ||
      pointIsInside( other._maxX, other._maxY ) ) {
      return true;
    }

    return false;
  }

  //copié collé d'un article pour obtenir une fonction d'intersection très performante.
  //j'ai cependant compris et je serais capable de l'expliquer et de la coder de nouveau (pas comme cette version).
  private boolean RaySlabIntersect(float slabmin, float slabmax, float raystart, float rayend, float tbenter[], float[] tbexit) {
    float raydir = rayend - raystart;

    // ray parallel to the slab
    if (Math.abs(raydir) < 1.0E-9f) {
      // ray parallel to the slab, but ray not inside the slab planes
      if (raystart < slabmin || raystart > slabmax) {
        return false;
      }
      // ray parallel to the slab, but ray inside the slab planes
      else {
        return true;
      }
    }

    // slab’s enter and exit parameters
    float tsenter = (slabmin - raystart) / raydir;
    float tsexit = (slabmax - raystart) / raydir;

    // order the enter / exit values.
    if (tsenter > tsexit) {
      float swap = tsenter;
      tsenter = tsexit;
      tsexit = swap;
    }

    // make sure the slab interval and the current box intersection interval overlap
    if (tbenter[0] > tsexit || tsenter > tbexit[0]) {
      // nope. Ray missed the box.
      return false;
    }
    // yep, the slab and current intersection interval overlap
    else {
      // update the intersection interval
      tbenter[0] = max(tbenter[0], tsenter);
      tbexit[0] = min(tbexit[0], tsexit);
      return true;
    }
  }

  //est-ce que le rayon est en intersection avec this ?
  public boolean rayIntersect(Ray Seg) {

    float[] tenter = {
      0.0f
    };
    float[] texit = {
      1.0f
    }; 

    // test X slab
    if (!RaySlabIntersect(_minX, _maxX, Seg.getOrigin().x, Seg.getDestination().x, tenter, texit)) {
      return false;
    }

    // test Y slab
    if (!RaySlabIntersect(_minY, _maxY, Seg.getOrigin().y, Seg.getDestination().y, tenter, texit)) {
      return false;
    }

    return  true;
  }
}


