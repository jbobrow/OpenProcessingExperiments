
Button A, B, C;
void setup()
{
  size(300,100);
  A = new Button(100,40,100,20, color(200,0,100), color(0,0,200));
  B = new Button(0, 40, 100, 20, color(200,0,100), color(0, 200, 0));
  C = new Button(200, 40, 100, 20, color(200,0,100), color(200, 0, 0));
}

void draw()
{
  A.draw();
  B.draw();
  C.draw();
}
class Button
{
  int x,y,a,b;
  color normal,highlight;
  Button(int x, int y, int w, int h, color highlight, color normal)
  {
    this.x = x;
    this.y = y;
    this.a = w;
    this.b = h;
    this.highlight = highlight;
    this.normal = normal;    
  }
  void draw()
  { 
    if( mouseX>x && mouseX<x+a &&
      mouseY>y && mouseY<y+b ) {
   fill(highlight);
  }
 else { 
   fill(normal);
 }
  rect(x,y,a,b);
}
}


