
PImage ritoque;  
  
int col;  
float r,g,b,bright;  //definiciones
  
void setup() {  //términos generales
  size(604, 296, P3D);  //tamaño
    
  ritoque=loadImage("ritoque.JPG");  // cargar imagen
      
  background(0);  //fondo imagen (color)
}  
  
void draw() {  //dibujos
    
  for(int i=0; i<100; i++) {  
    for(int j=0; j<100; j++) {  
      col=ritoque.get(i*10,j*10);  //colore
       b=blue(col); 
      r=red(col);  
      g=green(col);   
      bright=(brightness(col/2)/250)*8.5;  //determina tamaño y espacio entre formas
        
      fill(col, 170);  //relleno con definiciones anteriores
      ellipse (i*10,j*10, bright, bright); //detalle círculo
       rect(i*10,j*10, bright, bright);  //detalle cuadrilátero
       
    }  
  }  
}   
    
 
 

