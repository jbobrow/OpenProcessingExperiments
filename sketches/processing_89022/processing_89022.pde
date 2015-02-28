
/*
* Autor: Oscar Martinez
* 
* Projecto titulado "cuadrados asutadizos"
* A estos peculiares cuadrados no les gusta la pelota roja
* por eso cuando esta se acerca los cuadrados se esconden.
* 
*/ 


Cuadrado[] c;

float px=random(20,width-20);
float py=random(20,height-20);
float vx=random(-2,2);
float vy=random(-2,2);

void setup(){
    size(192, 157);
    smooth();
  c=new Cuadrado[10];
  for(int i=0;i<c.length;i++){
    c[i]=new Cuadrado();
    c[i].x=random(10,width-10);
    c[i].y=random(10,height-10);
  }
}

void draw(){
 background(0);
 for(int i=0;i<c.length;i++){
 c[i].mostrar();
 }
 noStroke();        // creacion del circulo
 fill(255,0,0);
 ellipseMode(CENTER);
  ellipse(px,py,15,15);
  px+=vx;
  py+=vy;
  if(px<8||px>width-8) vx=vx*-1;  //efecto de rebote
  if(py<8||py>height-8) vy=vy*-1;
}

class Cuadrado{             //cuadrados
  float x,y,d;
    void mostrar(){
    rectMode(CENTER);
    fill(#0E4B9D);
    stroke(255);
    rect(x,y,10+d/3,10+d/3);  
     d= dist(x,y,px+vx,py+vy);   //variable que controla las distancias
    }
}



