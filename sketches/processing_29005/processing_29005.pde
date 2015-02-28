
class TShirt {
    // lista de variables
    float miX, miY;
    float dimensiones;
    color cTShirt;
    // variables que se calculan a partir de las variables iniciales
    float modulo,esquinaX, esquinaY;
    color cFondo, cTirantes;

   TShirt(float x, float y, float talla, color miColor, color miColor2){
    // crea la TShirt
    miX = x;
    miY = y;
    dimensiones = talla;
    cTShirt = miColor;
    cTirantes = miColor2;
    
    // las otras variables
    modulo = dimensiones/9;
    esquinaX = miX-dimensiones/2;
    esquinaY = miY-dimensiones/2;
    cFondo = color(212);
    }
    
    void display(){
      // dibuja la TShirt
      noStroke();
      fill(cTShirt);
    
    // mangas
    rect(esquinaX,esquinaY,dimensiones,modulo*4);
    // cuerpo
    rect(esquinaX+modulo, esquinaY, modulo*7,dimensiones);
    
    // tirantes
    noStroke();
    fill(cTirantes);
    rect(esquinaX+modulo, esquinaY, modulo*7,dimensiones);
    
    fill(cTShirt);
  
    ellipse(esquinaX+modulo,esquinaY+(modulo*3), modulo*2, modulo*2);
    ellipse(esquinaX+(modulo*8),esquinaY+(modulo*3), modulo*2, modulo*2);

    rect(esquinaX, esquinaY, modulo*2, modulo*3);
    rect(esquinaX+(modulo*7), esquinaY, modulo*2, modulo*3);
    arc(miX, esquinaY, modulo*4, modulo*4, 0, PI);
    
    // cuello
    fill(cFondo);
    arc(miX, esquinaY, modulo*3, modulo*3, 0, PI);
    // una linea horizontal para que cierre mejor
    stroke(cFondo);
    line(esquinaX+modulo*3,esquinaY,esquinaX+modulo*6, esquinaY);
    
    
    
    }
}

