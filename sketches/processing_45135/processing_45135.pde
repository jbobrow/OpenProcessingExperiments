
class ClipCell {
  Rect bounds;
  Circle dot;
  Lissajous curve;

  public ClipCell(Rect bounds, int colX, int rowY) {
    this.bounds = bounds;
    float ma = mag(colX - COLS/2, rowY - ROWS/2);

    if ( ma > COLS/2 +1)
      this.dot = new Circle(bounds.getCentroid(), 5);
    else   
      this.dot = new Circle(bounds.getCentroid(), 40);

    SineWave wx = new SineWave(0, random(0.01f, 0.15f), bounds.width * 0.5f, bounds.getCentroid().x);
    SineWave wy = new SineWave(0, random(0.01f, 0.15f), bounds.height * 0.5f, bounds.getCentroid().y);
    this.curve = new Lissajous(wx, wy);
  }
  void update() {
    curve.update();
    dot.set(curve.x, curve.y);
  }

  void draw(ToxiclibsSupport gfx) {
    Polygon2D poly=dot.toPolygon2D(30);
    gfx.polygon2D(poly);
  }
}


