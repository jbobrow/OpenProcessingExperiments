
// DEFINO VARIABLES GLOBALES DE POSICION EN X E Y;

float posY;
float posX;

// EN EL SETUP SOLO DEFINO EL TAMAÑO DEL CANVAS
void setup(){
  
 size(1000,300);
 
}

// ARRANCA EL DRAW LOOP

void draw() {
 
// PINTADA A BLANCO (PARA LIMPIAR)  
 background(200);
 
// PONEMOS AL CUADRADO EN EL CENTRO.

 posX = width/2;
 
// ACA USO MAP PARA MOVER EL CUADRADO DE FORMA QUE LA 
// POSICION EN Y SEA PROPORCIONAL A LA POSICION EN X.

 posY = map(mouseX,0,width,0,height);
 
// DIBUJO EL CUADRADO.  
 rectMode(CENTER);
 rect(posX, posY,30,30);
 
 
  
}
