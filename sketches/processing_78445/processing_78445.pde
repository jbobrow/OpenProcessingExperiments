
size (800, 800);          //tamaño canvas

background (255);   //color canvas


//                        __LÍNEAS VERTICALES__


stroke (0, 0, 155, 100);       //color línea

strokeWeight(2);          //peso línea

for (int v = 10; v < 800; v = v + 15) { 
  
  
    /*
    ___variable líneas VERTICALES___
    "v = 10" es desde donde comienzan las líneas desde la izquierda
    "v < 800" es donde terminan las líneas a la derecha del canvas
    "v + 15" es el espacio entre las líneas
    */

line (v, 800, v, 0);     //línea vertical

}   /*los corchetes quedan abiertos porque estas funciones son completadas con la 
    figura de más abajo y cuando dejan de ser usadas se cierran los corchetes*/


//                         __TRIÁNGULOS ARRIBA IZQUIERDA__

stroke (0, 255, 200, 150);       //color línea

fill(0, 0);                  //relleno

strokeWeight(1);          //peso línea

for( int a = 10; a <= 400; a = a + 15){
 for (int b = 10; b <= 400; b = b + 15){
   
   /*
   ***si en "a=10" y "b=10" hubiera puesto cero, la figura hubiera comenzado desde su parte 
   trasera y no con el primer vértice apegado al borde.
   
   x=variable
   z=variable
   
   (x = z)     --> es desde donde comienzan las líneas desde la izquierda
   (x < z)     --> es donde terminan las líneas a la derecha del canvas
   (x = x + z) --> esto es la distancia entre cada uno de los objetos o variables 
  */
   
 triangle(a, b, 0+a, 10+b, a-10, b-10);    
 }
} 



//                          __LÌNEAS DIAGONALES ARRIBA DERECHA__

stroke (255, 0, 150, 150);  

for( int a = 410; a <= 800; a = a + 10){
 for (int b = 10; b <= 400; b = b + 10){
 
   
   triangle( a, b, 10 + a, 10 + b, a - 10, b - 10 );
 }
} 

//                            __CIRCULO__

fill ( 100, 255, 100, 100);

strokeWeight(0);

for ( int c = 420; c < 800; c = c + 50) {
 
  //¿habrá una manera menos pajera?
  
  ellipse( 410, c, 15, 15);
  
  ellipse( 435, c, 15, 15);
  
  ellipse( 465, c, 15, 15);
  
  ellipse( 495, c, 15, 15);
  
  ellipse( 525, c, 15, 15);
  
  ellipse( 555, c, 15, 15);
  
  ellipse( 585, c, 15, 15);
  
  ellipse( 615, c, 15, 15);
  
  ellipse( 645, c, 15, 15);
  
  ellipse( 675, c, 15, 15);
  
  ellipse( 715, c, 15, 15);
  
  ellipse( 745, c, 15, 15);
  
  ellipse( 775, c, 15, 15);
  
  ellipse( 800, c, 15, 15);
}


//                           __PIRÄMIDE__

stroke (240, 255, 10);

for ( int h = 10; h < 800; h = h + 10) {
  
  line ( 400, 410, h, 800);
  
}

//                           __LINEAS HORIZONTALES_

stroke (100, 100, 100, 150);

for ( int h = 410; h < 800; h = h + 10) {
  
  line ( 0, h, 400, h);
  
}
