
int cantidad;
float modulo; 
float largoDiagonal;
float distanciaMaxima; 

float xcentro;
float ycentro;

void setup(){
   size (600, 600);  
   
   //tamaño del modulo, conviene multiplicar por 1.0 para 
   //transformarlo a flotante o castear a flotante el anchon
   modulo = float (width) / cantidad;
   largoDiagonal = width * sqrt (2);
   distanciaMaxima = largoDiagonal / 2.0;
   
   xcentro =width / 2.0;
   ycentro =width / 2.0;
   
    cantidad =10;
}


void draw(){
  
  cantidad = int ( mouseX / 3);
  modulo = float (width) / cantidad;
   //recorro las columnas 
  for (int i=0; i< cantidad; i++){
      
    //recorro dentro de cada columna las filas 
   for (int j=0; j< cantidad; j++){
     
     float x = i * modulo;
     float y = j * modulo;
     fill (255);
     rectMode(CORNER);
     rect (x , y, modulo, modulo);
     
     //ounto de anclaje en el centro 
     float xc = x + modulo /2;
     float yc = y + modulo /2;  
     
     float distancia = dist (xc, yc, xcentro, ycentro);
     
     float porcentaje = map (distancia, 0, distanciaMaxima, 0.2, 1.0);
     float tamanio = modulo * porcentaje; 
     fill (0); 
     rectMode (CENTER);
     rect (xc,yc, tamanio, tamanio);
     } 
  }
  
}

void mousePressed (){
  noLoop();
  save("foto#####.jpg");
  
}
