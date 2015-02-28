
class Pelotita {
  /*datos*/
  float x,y;
  float vx,vy;
  float ax,ay;
  float radio;
  color sabor;
 /*funciones*/
 
//funcion para construir la pelota
  Pelotita() {
    x=random(0,width);
    y=random(0,height); 
    vx=random(1,5);
    vy=random(1,5);
    ax=random(-0.1,0.1);
    ay=random(-0.1,0.1);
    radio=random(2,30);
  }
  
//funcion para calcular posiciones
  void update(){
   
    //cada iteracion le agregamos velocidad a su posicion
    x = x + vx;
    y = y + vy;
    vx+=ax;
    vy+=ay;
    //si pega una pared
    if ((x > width) || (x < 0)) {
      vx = vx * -1;
    }
    //si pega la otra
    if ((y> height) || (y < 0)) {
      vy = vy * -1;
    }
    
  }
  //funcion apra dibujar
  void draw(){
  update();
    noStroke();
  fill(255,200,0); 
  ellipse(x,y,radio,radio);  
  }
}

