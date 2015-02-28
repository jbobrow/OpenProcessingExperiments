
class punto2D {
  float x;
  float y;
  punto2D(float x1, float y1)
  {
    x=x1;
    y=y1;
  }

  void display() {
    point(x,y);
  }

  void rotar(float angulo)
  {
    x = x*cos(angulo*3.14/180.0)-y*sin(angulo*3.14/180.0); 
    y = x*sin(angulo*3.14/180.0)+y*cos(angulo*3.14/180.0);
  }

  void rotarconPunto(float angulo, punto2D ref) {
    x=(x-ref.x)*cos(angulo*3.14/180.0)-(y-ref.y)*sin(angulo*3.14/180.0)+ref.x;
    y=(x-ref.x)*sin(angulo*3.14/180.0)+(y-ref.y)*cos(angulo*3.14/180.0)+ref.y;
  }

  punto2D rotarconPunto2(float angulo, punto2D ref) {
    float x0=(x-ref.x)*cos(angulo*3.14/180.0)-(y-ref.y)*sin(angulo*3.14/180.0)+ref.x;
    float y0=(x-ref.x)*sin(angulo*3.14/180.0)+(y-ref.y)*cos(angulo*3.14/180.0)+ref.y;
    punto2D p=new punto2D(x0,y0);
    return p;
  }

  void trasladar(float Tx, float Ty) {
    x = x+Tx;
    y = y+Ty;
  }
}

float ang = 0;
punto2D punto = new punto2D(400,400);
punto2D p = new punto2D(punto.x,punto.y);

void setup() {
  size(400,400);
}

void draw() {
  if(punto.x !=0 && punto.y !=0) {
      ang+=1;
//    p.rotar(ang);
      p.rotarconPunto(ang, new punto2D(punto.x,punto.y));
//    p.trasladar(random(10)-5, random(10)-5);
//    punto2D d= p.rotarconPunto2(ang, new punto2D(200,200));
//    d.display();
    stroke(RED(),GREEN(),BLUE());
    strokeWeight(1);
    line(punto.x ,punto.y ,p.x ,p.y );
    
    if (ang<=360){
      ang=0;
    }
//    p.display();
  }
}

void mousePressed() {
  punto.x = mouseX;
  punto.y = mouseY;
}

float RED() {
  return random(255);
}
float GREEN() {
  return random(255);
}
float BLUE() {
  return random(255);
}


