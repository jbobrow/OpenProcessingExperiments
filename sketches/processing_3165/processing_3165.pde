


Pincel[] pinceles;  // arreglo de pinceles
int numPinceles;// es la cantidad de pinceles
int x,y; 

void setup(){
 
  size(600,450);
   frameRate(30);// determina la cantidad de cuadros por unidad de tiempo (fotograma), entre menor sea el número sera más lento.
  numPinceles = 50;   //Se establece la cantidad de pinceles
  pintar(); //ejecuta las pinceladas
  colorMode(HSB,170);
  background(mouseX,mouseY);
}

 void draw(){
  fill(#000000,random(1,12));  // deja una estela del fotograma pasado, de relleno negro y una trasparencia variable.
  noStroke();  
  smooth();
  rect(width/2,height/2,width,height); //en esta zona se acumulan los fotogramas pasados
  colorMode (HSB);
  
// Based in 'Circle Drawer STUDIO' (#3) by Rilley Galloway   http://openprocessing.org/visuals/?visualID=1212
fill(random(13,16)); 
    if(keyPressed)   
    if (key== 'n' || key == 'n') // Pinceles grises
      fill (23,4,12);
  if (key == '1' || key == '1') // Pinceles multicolores
fill(random(34,267),random(57,164),random(67,179),90); // color de las pinceladas  
    if (key == '0' || key == '0') // Pinceles blancos
      fill(5,3,255); 
      
  
  
  for(int i=0;i<numPinceles;i++){  
    pinceles[i].movimiento();  // movimiento del pincel, tiene dirección, velocidad y desplazamiento.
    pinceles[i].pintar();  // acciona los pinceles.
  }

}


void mousePressed(){
  pintar(); //incia la acción cuando se presiona el mouse.
}



void pintar(){

  pinceles = new Pincel[numPinceles];  //se incia el arreglo de pinceles
  for(int i=0;i<numPinceles;i++){   
    pinceles[i] = new Pincel();  // se hace una nueva pincelada
  }
}



