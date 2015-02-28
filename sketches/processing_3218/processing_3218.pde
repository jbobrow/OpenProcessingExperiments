
//Basado en uno de los primeros ejemplos de objetos
Pincel[] p;

void setup(){
  size(600,600);
  smooth();
  p = new Pincel[100];
  for(int i = 0; i < 100; i++){
    p[i] = new Pincel();
  }
}


void draw(){
  for(int i = 0; i < 50 ; i++){//empieza con 50
    p[i].dibuja();
  }
}

class Pincel{
  float x, y;
  float diam;
  color col;
  int edad, edadMax;

  Pincel(){
    x = random(width);
    y = random(height);
    diam = random(3,10);
    col = color(240,20,20,50);//da blood color
    edad = 1;
    edadMax = round(random(100, 300));
  }

  void dibuja(){
    calc();
    noStroke();
    fill(col);
    translate(x,y);//la aparición del "goteo" trasladado en x e y
    rotate(PI);
    ellipse(x,y, diam*1.5, diam);
  }


  void calc(){
    x += noise(round(random(-4, 4))*2);
    y += noise(round(random(-6, 3))*2);

    x = x % width;
    y = y % height;

    if (x < 0) x *= -1;
    if (y < 0) y *= -1;

    edad ++;

    if(edad >= edadMax) new Pincel();
  }
}



