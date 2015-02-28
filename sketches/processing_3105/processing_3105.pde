
Pincel[] p;


void setup(){
  size(500, 500, P3D);
background(0);
  smooth();

  p = new Pincel[100];

  for(int i = 0; i < 100; i++){
    p[i] = new Pincel();
  }
}


void draw(){
  for(int i = 0; i < 100; i++){
    p[i].dibuja();
  }
 // velo();
}


class Pincel{
  float x, y;
  float diam;
  color col;
  int edad, edadMax;

  Pincel(){
    x = random(width);
    y = random(height);
    diam = 32;
    col = color(100);
    edad = 1;
    edadMax = round(random(500, 1000));
  }

   void dibuja(){
    calc();
   
     stroke(col*(millis()*#14973A));//borde con color al azar
    strokeWeight(2.4);
    
    fill(col*(millis()*0));//relleno con color que va cambiando
   ellipse(x,y, diam, diam); //ellipse pequeña
   
    fill(0);//relleno elipse chica, color
    ellipse(x,y, diam/2, diam/1);//ellipse (que contiene la pequeña), que forma un 0
    
    fill(0);
    ellipse(x,y,diam/1, diam/2);
    
    fill(col*(millis()*col));//relleno con color que va cambiando de la pelota del centro de la elipse
    ellipse(x,y,diam/3, diam/3);
  }

  void calc(){
    x += random(-2, 2);
    y += random(-2, 2);

    x = x % width;
    y = y % height;

    if (x < 0) x *= -1;
    if (y < 0) y *= -1;

    edad ++;

    if(edad >= edadMax) col = color(0);
  }
}


void mousePressed(){
  for(int i = 0; i < 100; i++){
    p[i].col = color(red(p[i].col) + random(-10, 10), green(p[i].col)  + random(-10, 10), blue(p[i].col)  + random(-10, 10));
  }
}

void velo(){
  fill(0,10);
  rect(0,0,width, height); 
}





