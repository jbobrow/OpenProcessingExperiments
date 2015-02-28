
//________________Trabajo arte generativo, tamaño carta, dos clases. hermoso?

//primero declaro a los objetos

circulo a, b, c, d, e, f, g, h, i, j, k, l, m;
triangulo z;

class triangulo {

float xpos;
float ypos;
int colora;
int colorb;
int colorc;

triangulo (float x, float y, int ca, int cb, int cc) {
xpos = x;
ypos = y;
colora = ca;
colorb= cb;
colorc = cc;

}
void update () {
  
  float angle=0.0;
  float offset=200;
  float scalar=20;
  float incremento= 0.05;
  
  float x= offset + cos(angle)* scalar;
  float y = offset + sin(angle) *scalar;
  scalar ++;
  angle+= incremento;
}

void display() {
scale(7);
triangle(xpos,ypos,xpos+50,ypos,xpos+25,ypos-40);
 stroke (colora, colorb, colorc);
 
 

}
}

class circulo {
 
  //campos (si quiero q algo sea igual para todo lo ingreso acá
  float xpos; //posición X del circulo
  float ypos; //posición Y del circulo
  float radius; //radio del circulo
  float direction= 1; //dirección de los circulos
  float speed = random (0.5, 1); //velocidad
  int color1;
  int color2;
  int color3;
  int color4;
  
  //constructor
  
  circulo (float x, float y, float r, int c1, int c2, int c3, int c4) {
    xpos = x;
    ypos = y;
    radius = r;
    color1 = c1;
    color2 = c2;
    color3 = c3;
    color4 = c4;
  
  }
  
  //valor de velocidad:
  
 void update() {
   
   //esto es para que el circulo siga dentro del plano, 
      //y se mueve de derecha a izquierda
   xpos += speed*direction; 
    if ((xpos>width-radius) || (xpos < radius)) { //|| significa "y"
      // si xpos mayor que el ancho menos el radio y xpos menor que el radio
      direction*=-1; // la direccion es -1
    }
 }
 
 void display () {
fill(color1, color2, color3, color4);
ellipseMode(RADIUS);
ellipse (xpos, ypos, radius, radius);

 }
}

  
  
  

void setup() {

  size (792, 612); // size (2550, 3300);
  background(255);
  // circulo (float x, float y, float r, color)
  a = new circulo (10, 10, 10, 250, 250, 250, 50);
  b = new circulo (30, 50, 30, 230, 230, 230, 50);
  c = new circulo(10, 90, 10, 240, 240, 240, 80);
  d = new circulo(50, 150, 50, 255, 255, 255, 20);
  e = new circulo (180, 240, 40, 230, 230, 230, 60);
  f = new circulo (130, 300, 20, 221, 221, 221, 10);
  g = new circulo (190, 330, 10, 255, 255, 255, 60);
  h = new circulo (400, 365, 25, 220, 220, 220, 30);
  i = new circulo (10, 400, 10, 240, 240, 240, 30);
  j = new circulo (180, 450, 40, 255, 255, 255, 50);
  k = new circulo (300, 510, 20, 221, 221, 221, 70);
  l = new circulo (100, 540, 10, 250, 250, 250, 90);
  m = new circulo (500, 580, 30, 230, 230, 230, 50);
  z = new triangulo (30,60, 64,224,208);
  
  //stroke(220, 220, 220);
  //strokeWeight(0.5);
  //ellipseMode(RADIUS);
}

void draw () {
  //background (0);  //no lo coloco para que se vea el movimiento

  a.update();
  a.display();

  b.update();
  b.display();

  c.update();
  c.display(); 

  d.update();
  d.display();

  e.update();
  e.display(); 

  f.update();
  f.display();

  g.update();
  g.display();

  h.update();
  h.display(); 

  i.update();
  i.display();

  j.update();
  j.display();

  k.update();
  k.display(); 

  l.update();
  l.display();

  m.update();
  m.display();
  
  z.update(); 
  z.display();

  

  if (mousePressed) {
    if (mouseButton==LEFT) {
      a.speed +=0.05;
      b.speed +=0.02;
      c.speed +=0.1;
      d.speed +=0.1;
      e.speed+=0.2;
      f.speed+=0.05;
      g.speed+=0.15;
      h.speed+= 0.2;
      i.speed+=0.04;
      j.speed+=0.05;
      k.speed +=0.1;
      l.speed+=0.2;
      m.speed+=0.05;
    }

    if (mouseButton==RIGHT) {

      stroke (255);
    }

    else {
      stroke (170);
    }
  }



  if (keyPressed) {
    if (key == 'q') {
      a.speed -=0.01;
      b.speed-=0.01;
      c.speed-=0.01;
      d.speed-=0.05;
      e.speed-=0.03;
      f.speed-=0.04;
      g.speed-=0.05;
      h.speed-= 0.2;
      i.speed-= 0.03;
      k.speed-=0.01;
      l.speed-=0.01;
      m.speed-=0.05;
      //c.radius-=1;
    }
  }
}
