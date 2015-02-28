
//cantidad de agentes autónomos
int cant = 50;
//dibujar las trayectorias o no?
boolean dibujar = true;
// darle a cada agente una variación individual?
boolean variar = false;

Bola bolas[];

int radio = 15;

void setup(){
  size(600, 600);
  smooth();
  
  //crear todos los agentes y almacenarlos en un array
  bolas = new Bola[cant];
  for(int n=0; n<cant; n++){
    bolas[n] = new Bola();
  }
}

void draw(){
  
   fondo();
  //recorrer la lista de agentes y moverlos. el primero sigue al mouse, los demás siguen al anterior en la lista
  for(int n=0; n<cant; n++){
    float x, y;
    if(n == 0){
       x = bolas[n].x + (mouseX - bolas[n].x) / 20;
       y = bolas[n].y + (mouseY - bolas[n].y) / 20;
    }
    else
    {
      x = bolas[n].x + (bolas[n-1].x - bolas[n].x) / 10;
      y = bolas[n].y + ( bolas[n-1].y - bolas[n].y) / 10;
      
      // el siguiente condicional produce una repulsión entre las partículas
      // evalua que la bola[n - 1] este a una distancia > que 2 radios de la bola[n]
      // Si esta distancia es menor a 2 radios entonces 
      // la coordenada x se incrementa = repulsión.
      
      if(dist(x,y,bolas[n-1].x,bolas[n-1].y ) < radio )
      {
        x = bolas[n].x + (bolas[n-1].x - bolas[n].x) * 5;
        y = bolas[n].y + (bolas[n-1].y - bolas[n].y) * 5;
      }
      
    }// end else
    
    bolas[n].paso(x, y);
  }
}

void fondo()
{
  if (!dibujar) 
   {  fill(0,10);  } 
  else 
    { fill( 0,3); }
   rect(0,0, width, height);
}

//definición de la clase Bola

class Bola{
  float x, y; //posición actual
  float ax, ay; //posición anterior
  float rx, ry; //variación individual de la posición
  
  Bola(){
    // determinar valores iniciales de las variables
    ax = x = 0;
    ay = y = 0;
    rx = variar ? random(-3, 3) : 0;
    ry = variar ? random(-3, 3) : 0;
    fill(255);
  }
  
  void paso(float inputX, float inputY){
    //modificar posición
    x = inputX + rx;
    y = inputY + ry;
    
    //trazar trayectoria o mostrar posición con un círculo
    if(dibujar){
     //fill(0,3); rect(0,0,width,height);
      stroke(255);
      line(ax, ay, x, y);
    }else{
      fill(255);
      ellipse(x, y, radio, radio);
    }
    
    //almacenar posición actual para el próximo paso
    ax = x;
    ay = y;
  }
}
