
Button A,B,C;
void setup()
 {
  size(300,100);
  A = new Button(0,30,100,40, color(128,0,0), color(255,0,0));
  B = new Button(100,30,100,40, color(0,128,0), color(0,225,0));
  C = new Button(200,30,100,40, color(0,0,128), color(0,0,255));
 }

boolean inrect(float x, float y, float w, float h)
 {
   return x<mouseX && mouseX<x+w && y<mouseY & mouseY< y+h;
 }
 void draw()
 {
 A.draw(); B.draw(); C.draw();
 }

class Button {
   float x,y, w, h;
   color normal, highlight;
   Button(float x, float y, float w, float h, color normal, color highlight)
   {
     this.x = x;
     this.y = y;
     this.w = w;
     this.h = h;
     this.normal = normal;
     this.highlight = highlight;
   }
   void draw()
   {
     if(inrect(x,y,w,h))
     {
       fill(highlight);
     }else{
       fill(normal);
     }
     rect(x,y,w,h);
   }
 }


