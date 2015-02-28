
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
}

float ang = 0;
punto2D p = new punto2D(400,400);

void setup()
{
 size(400,400); 
}
void draw(){
  
  if(p.x !=0 && p.y !=0){
    ang +=0.01;
    p.rotar(ang);
    stroke(getRandomColor(),getRandomColor(),getRandomColor());
    strokeWeight(60);
    p.display();
  }
}
void mousePressed() {
 p.x = mouseX;
 p.y = mouseY;
}
float getRandomColor(){
return random(255);
}
