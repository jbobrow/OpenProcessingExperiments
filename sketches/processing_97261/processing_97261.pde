
//simple beat counter
//23/04/2013

int xpos = 0; //posicion de x
int contador = 0; //Contador
int acum = 0; //Acumulador de compases
int limitepasos = 16; // beats



void setup() {
  size (600, 200);
  smooth();
//frameRate(60);
  background(0);
}


void draw() { 
 fill(0,0,0,180);
 rect(0,0, width,height);

  if (xpos != -1 ) {

    xpos += 1;  
  }

  if (xpos >= width/4) {
    xpos = 0;
  }
  
  if (contador != limitepasos){
    delay (444); // milisegundos de los bpm divide 60/bpm.
    contador += 1;
  } 
 
  if (contador >= limitepasos) {
    
    contador = 0;
    acum +=1;
  
  }
  
  if (acum >= 4096){
    
    acum = 1;
  
  }

  fill(255,255,255,100);
  textSize(100);
  text(contador, xpos*4, 100);
  textSize(300);
  fill(255,255,255,55);
  text(acum, width/8, 215);
  

}



