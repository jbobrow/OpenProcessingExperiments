
//PONG!!

  int pelotax = 250;
  int pelotay = 150;
  int pelotadireccion = 1; //1 = derecha, 0 = izquierda
  int pelotadirecciony = 0;
  int pelotavelocidad = 5;
  int jugadory = 150;
  int j2puntos = 0;
  int jugador1y = 150;
  int j1puntos = 0;

  PFont font; //Oye processing voy a usar letras y así

void setup(){ //Aquí se declaran las caracteristicas de tu "lienzo"
  size (500,300);
  smooth();
}

void draw(){
  background(3); // el color del fondo, se pone en draw porque con cada cilco "limpia" la pantalla
  stroke(255, 255, 255, 50); // color de la linea se usan 4 canales RGBA, osea rojo-verde-azul-alpha
  line (250,0,250,300); //linea de enmedio
  pelota(); //funcion de la pelota
  jugador(); //funcion del jugador 2 derecha
  jugador1(); //funcion del jugador 1 izauierda
  font = loadFont("Dekers_Bold-48.vlw"); //tipo de fuente (se incluye o importa a la carpeta de nuestro sketch a través de tools > create font
  textFont(font); //Processing ya voy a usar las letras y eso
  textSize(30); 
  text(j1puntos, 100, 280); //puntaje jugador 1
  text(j2puntos, 400, 280); //puntaje jugador 2
}

void pelota(){
  
  ellipse (pelotax, pelotay, 10, 10); //dibuja la pelota
  
  //Movimiento de la pelota en X, aquí se va a checar si le pegan a la pelota o fallan
  
  if (pelotadireccion == 1){ //si la direccion es pa' la derecha
    if (pelotax < 485){ // y si la pelota no ha llegado al extremo o a chocar con el jugador 2
      pelotax += pelotavelocidad; //sumale a su posicion de x el valor de la velocidad
    }else{
      if (pelotay > jugadory && pelotay - jugadory  < 64){ //si si le pega al jugador
        pelotavelocidad += 1; // aumenta la velocidad
        pelotadireccion = 0; // invierte la direccion
      }else{ // sino es que no le pego
       j1puntos += 1; // puntos para el jugador 1
       pelotax = 11; // "el saque" lo tiene el otro jugador
       pelotay = jugador1y + 30; // la pelota sale de enmedio del jugador 1
       pelotavelocidad = 5; // reinicia la velocidad
      }
    }
    }else if (pelotadireccion == 0){ // *lo mismo que arriba pero al reves
      if (pelotax > 15){
        pelotax -= pelotavelocidad;
      }else{
       if (pelotay > jugador1y && pelotay - jugador1y  < 64){
         pelotavelocidad += 1;
         pelotadireccion = 1;
      }else{
       j2puntos += 1;
       pelotax = 489;
       pelotay = jugadory + 30;
       pelotavelocidad = 5;
      }
      }
      
    }
  
  //movimiento de la pelota en Y
  
  if (pelotadirecciony == 1){ 
    if (pelotay > 0){
      pelotay -= 5;   
    }else{
      pelotadirecciony = 0;
    }
    }else if (pelotadirecciony == 0){
      if (pelotay < 300){
        pelotay += 5;
      }else{
        pelotadirecciony = 1;
      }
    }
}


void jugador(){ // funcion del jugador 2, el valor de Y es la variable que cambia para poder moverlo
  rect(490, jugadory, 5, 60);
}

void jugador1(){ // funcion jugador 1.
  rect(5, jugador1y, 5, 60);
}

void keyPressed(){ //si le pican a alguna tecla
  if (keyCode == UP && jugadory > 0){ // y esa tecla es flecha arriba y todavia no se sale entonces
    jugadory -= 30; // al restarle lo movemos hacia arriba
  }else if (keyCode == DOWN && jugadory < 239){
    jugadory += 30;
  }else if (key == 'w' && jugador1y > 0){
    jugador1y -= 30;
  }else if (key == 's' && jugador1y < 239){
    jugador1y += 30;
  }
}

