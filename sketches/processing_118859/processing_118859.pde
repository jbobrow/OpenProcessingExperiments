
Barra barraIzquierda, barraDerecha;
Pelota pelota;
int velocidad = 1;
 
void setup() {
    size(300,300);
    barraIzquierda = new Barra(30);
    barraDerecha = new Barra(270);
    pelota = new Pelota();
}
 
void draw() {
    background(0);
     
    pelota.dibujar();
    barraIzquierda.dibujar(mouseY);
    barraDerecha.dibujar(mouseY);
    
    if( (pelota.posX-15) < barraIzquierda.posX && pelota.posY > mouseY &&  
          pelota.posY < (mouseY+30)){
      velocidad = 1;          
    }
    
    if( (pelota.posX+15) > barraDerecha.posX && pelota.posY > mouseY &&  
          pelota.posY < (mouseY+30)){
      velocidad = -1;          
    }
    
    pelota.mover(velocidad);
}

class Barra{
    int posX;
 
    Barra(int posicionX){   
        posX = posicionX;
    }
     
    void dibujar(int posY){
        stroke(255);
        strokeWeight(3);
        line(posX, posY, posX, posY+30);
    }
 
}

class Pelota{
    int posX, posY;
 
    Pelota(){
        posX = 150; 
        posY = 150; 
    }
     
    void mover(int velocidad){
        posX = posX + velocidad;
    }
     
    void dibujar(){
        ellipse(posX, posY, 30, 30);
    }
 
}

