
class punto2D{
  float x;
  float y;
  punto2D(){
  }
  punto2D(float x1, float y1)
  {
    x=x1;
    y=y1;
  }
  void display(){
    point(x,y);
  }
  void rotar(float angulo)
  {
   x = x*cos(angulo*3.14/180.0)-y*sin(angulo*3.14/180.0); 
   y = x*sin(angulo*3.14/180.0)+y*cos(angulo*3.14/180.0); 
  }
  void rotarconPunto(float angulo, punto2D ref){
    x =(x-ref.x)*cos(angulo*3.14/180.0)-(y-ref.y)*sin(angulo*3.14/180.0)+ref.x;
    y =(x-ref.x)*sin(angulo*3.14/180.0)+(y-ref.y)*cos(angulo*3.14/180.0)+ref.y;
  }
  punto2D rotarconPunto2(float angulo, punto2D ref){
    float x0 =(x-ref.x)*cos(angulo*3.14/180.0)-(y-ref.y)*sin(angulo*3.14/180.0)+ref.x;
    float y0 =(x-ref.x)*sin(angulo*3.14/180.0)+(y-ref.y)*cos(angulo*3.14/180.0)+ref.y;
    punto2D p = new punto2D(x0,y0);
    return p;
  }
}

float ang = 0;
punto2D p = new punto2D(300,300);

void setup()
{
 size(400,400); 
}
void draw(){
  
  if(p.x !=0 && p.y !=0){
    ang +=0.01;
    stroke(getRandomColor(),getRandomColor(),getRandomColor(),getRandomColor());
    strokeWeight(100);
    p.rotarconPunto(ang, new punto2D(200,200));
    p.display();
    /*
    punto2D d = p.rotarconPunto2(ang, new punto2D(200,200));
    d.display();
    p = d;*/
  }
}
void mousePressed() {
 p.x = mouseX;
 p.y = mouseY;
}
float getRandomColor(){
return random(255);
}
