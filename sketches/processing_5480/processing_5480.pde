


class Cupcake  {
  float x, y;
  PImage cakepic;
  
  Cupcake(float x, float y, PImage cakepic)  {
    this.x = x;
    this.y = y;
    this.cakepic = cakepic;
  }
  
  void update()  {
    image(cakepic, x, y);
  }
}

