
Pelota pelota1, pelota1;
boolean avanzar;
int vel;

void setup() {
    size(300,300);
    
    pelota1 = new Pelota(30,30);
    pelota2 = new Pelota(230,30);
    
    avanzar = true;
    vel = 1;
}

void draw() {
    background(0);
      
    pelota1.dibujar();
    pelota2.dibujar();
    
    if(avanzar == true){
        if( (pelota1.posX+15) > (pelota2.posX-15) ){
            avanzar = false;
        }
        
        pelota1.mover(vel);
        pelota2.mover(-vel);
    }
    else{
        pelota1.mover(-vel);
        pelota2.mover(vel);
    }
    
}

class Pelota{
    int posX, posY;
    
    Pelota(int posicionX, int posicionY){
        posX = posicionX;
        posY = posicionY;
    }
    
    void dibujar(){
        ellipse(posX, posY, 30, 30);
    }
    
    void mover(int velocidad){
        posX = posX + velocidad;
    }
    
}
