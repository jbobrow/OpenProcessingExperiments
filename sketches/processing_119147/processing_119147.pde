
Ejemplo de el uso de una pelota en tiro parabolico para saber su velocidad, y posicion.


/ / Posición,y velocidad:
PVector posición, acc, vel;
int radio = 20;
booleano loop = cierto ;
 
void setup () {
  frameRate (30); / / llamada dibujar esto muchas veces por segundo
  tamaño (600,500);
  suavizar ();
 
  Posición / / del círculo en todo momento
  posición = nueva PVector (( int ) (0,3 * ancho ), 30);
  / / Position.x es la coordenada x, coordenada y es position.y
 
  / / Iniciar velocidad es 4px/frame en la dirección + x
  / / Y cero en la dirección y
  vel = nueva PVector (4,0);
 
  / / Accleration es 0 en x dirección y .2px/frame ^ 2 + y en dir (abajo)
  acc = nueva PVector (0, 0,2);
}
 
anular dibujar () {
  fondo (0);
  noStroke ();
  llenar (0,255,0); / / grn
 
  / / Círculo empate @ ubicación actual
  ellipseMode ( CENTER ); / / colocación de elipse con base en el centro pt
  elipse (position.x, position.y, 2 * radio, 2 * radio);
 
  / / Actualizar la velocidad mediante el aumento de v_x y por v_y
  / / A_x y a_y,
  . vel complemento (acc);
 
  / / Utilizar este aumento de la velocidad para actualizar la posición de la
  / / Próxima vez que dibuje el círculo
  . posición de añadir (vel);
 
  / / Si la posición indica que hemos tocado fondo,
  / / Cambiar v_y ser hacia arriba (neg eje y)
  si (position.y + radio> = altura ) {
    vel.y =-vel.y;
  }
 
  / / Si llegamos a pared de la derecha, envíe v_x vuelta a la izquierda
  si (position.x + radio> = anchura ) {
    vel.x =-vel.x;
  }
 
  / / Si llegamos a la pared izquierda, v_x enviar de nuevo a la derecha
  si (position.x - radio <= 0) {
    vel.x =-vel.x;
  }
 
  Tamaño del texto (12);
  llenar (255,0,255);
  Cadena leyenda = "" ;
  leyenda + = "Posición: (" + position.x + "," + position.y + ")" ;
  leyenda + = "\ n \ nv_horiz =" + vel.x;
  leyenda + = "\ nv_vert =" + vel.y;
  leyenda + = "\ n \ na_horiz =" + acc.x;
  leyenda + = "\ na_vert =" + acc.y;
  texto (leyendas, 15, altura -130);
}
 
void mousePressed () {
  si ( loop ) {
    noLoop ();
    loop = false ;
  }
  más {
    bucle ();
    loop = cierto ;
  }
}
