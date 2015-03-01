
int numEsferas = 2,d=25,D=60,p=0;
float gravedad = 0.03;
float friccion = -0.9;
float a,b;
Esfera[] esferas = new Esfera[numEsferas];

void setup() {
  size(800, 600);
  background(0);
  esferas[0] = new Esfera(50, 30, d, 0, esferas);
  esferas[1] = new Esfera(55, 330, D, 0, esferas);
  a=random(width/2)+160;
  b=random(50)+30;
  rectMode(CENTER);
  noStroke();
  fill(255, 204);
  
}
void draw() {
  background(102,30,550);
  smooth();
  fill(0, 204);
  rect(a, b, 50, 50);
  fill(255, 204);
    esferas[0].colision();
    esferas[0].mover();
    esferas[0].mostrar(); 
    esferas[1].x=mouseX;
    esferas[1].y=mouseY;
    
   esferas[1].mostrar();  
   text("puntos:"+ p,500,20);
if (abs(esferas[0].x-a)<10 && abs(esferas[0].y-b)<10) {
a=random(width/2)+160;
  b=random(50)+30;
  esferas[0].x=random(width/2)+40;
  esferas[0].y=random(60)+40;
  p+=1;
}
}




class Esfera {
  
  float x, y;
  float diametro;
  float vx = 0;
  float vy = 0;
  int id;
  Esfera[] otros;
 
  Esfera(float xin, float yin, float din, int idin, Esfera[] oin) {
    x = xin;
    y = yin;
    diametro = din;
    id = idin;
    otros = oin;
  } 
  
  void colision() {
    for (int i = id + 1; i < numEsferas; i++) {
      float dx = otros[i].x - x;
      float dy = otros[i].y - y;
      float distancia = sqrt(dx*dx + dy*dy);
      float distmin = otros[i].diametro/2 + diametro;
      if (distancia < distmin) { 
        float angulo = atan2(dy, dx);
        float tx = x + cos(angulo) * distmin;
        float ty = y + sin(angulo) * distmin;
        float ax = (tx - otros[i].x) * random(0.1);
        float ay = (ty - otros[i].y) * random(0.1);
        vx -= ax;
        vy -= ay;
        otros[i].vx += ax*3;
        otros[i].vy += ay*3;
        
      }
    }   
  }
  
  void mover() {
    vy += gravedad;
    x += vx;
    y += vy;
    if (x + diametro/2 > width) {
      x = width - diametro/2;
      vx *= friccion; 
    }
    else if (x - diametro/2 < 0) {
      x = diametro/2;
      vx *= friccion;
    }
    if (y + diametro/2 > height) {
      y = height - diametro/2;
      vy *= friccion; 
    } 
    else if (y - diametro/2 < 0) {
      y = diametro/2;
      vy *= friccion;
    }
  }
  
  void mostrar() {
    for (int i=0; i<diametro; i+=1){
    noFill ();
    stroke(255-3*i); 
    ellipse(x, y, i,i);
   
     }
  }
}



