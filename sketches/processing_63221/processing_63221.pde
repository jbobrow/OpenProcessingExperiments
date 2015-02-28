
int y;
float x;
boolean haciaAbajo;
       
void setup(){
  
    size(200,350);
    smooth();
    y = 1;//inicia de arriba
    x = 100;
    haciaAbajo = true;//establece como dirección bajar
}

int contador = 0;

void draw(){  
  background(0);
  ellipse(x,y,20,20);
  rect(mouseX-25, mouseY-10, 50, 20);
  text(contador, 10, height-10);   
     
    if( haciaAbajo )
      {y++;//incrementa si haciAbajo es true
       if(y >= mouseY-16 && y <= mouseY+16 && x >= mouseX-25 && x <= mouseX+25)
         {//si choca el rectangulo
          haciaAbajo = false;//cambia de dirección
          fill(255, mouseY, 255-mouseY);
          contador = contador + 1; 
         };
         if(y >= height){
                   haciaAbajo = false;
                   contador = contador - 5;
              }
      }else{y--;//decrementa si haciaAbajo es false
            if( y <= 1 )
               {//si choca el borde superior
            haciaAbajo = true; //cambia de dirección
            contador = contador - 5;
        };
        
        if( y >= mouseY-16 && y <= mouseY+16 && x >= mouseX-25 && x <= mouseX+25)
            {//si choca el rectangulo
            haciaAbajo = true; //cambia de dirección
            fill(mouseY, 255-mouseY, 255);
            contador = contador + 1;
            }
        };       
}

