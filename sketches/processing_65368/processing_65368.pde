
abstract class Effect {
  PGraphics pg;
  int width, height;
  protected Effect() {}
  Effect(int width, int height) {
    pg = createGraphics(width, height,P2D);
    this.width=width; this.height=height;
  }
  void begin() {
    pg.beginDraw();
    pg.loadPixels();
    pg.background(0);
    pg.pushStyle();
    pg.noSmooth();
  }
  void loadPixels() {pg.loadPixels();}
  void fill(int rgb) {pg.fill(rgb>>16,(rgb>>8)&0xff,rgb&0xff);}
  void stroke(int rgb) {pg.stroke(rgb>>16,(rgb>>8)&0xff,rgb&0xff);}
  void noFill() {pg.noFill();}
  void noStroke() {pg.noStroke();}
  void strokeWeight(int w) {pg.strokeWeight(w);}
  void background(int rgb) {pg.background(rgb);}
  void textSize(int size) {pg.textSize(size);}
  void text(String s, int x, int y) {pg.text(s,x,y);}
  void rect(int x, int y, int w, int h) {pg.rect(x,y,w,h);}
  void ellipse(int x, int y, int w, int h) {pg.ellipse(x,y,w,h);}
  abstract PImage end(boolean complement);
}

