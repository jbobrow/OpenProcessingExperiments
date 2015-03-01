

int numeroPelotas = 550;
pelota [] p = new pelota [numeroPelotas]; //creamos el objeto pelota

void setup() { 
  size(800, 300); 

  for (int i = 0; i<p.length; i++) { //creación de las 550 pelotas a partir del elemento pelota
    p [i] = new pelota();
  }
} 

void draw() { 
  fill(255, 25); //fondo blanco(255) con grado de transparencia (25)
  rect(0, 0, width, height);

  for (int i = 0; i<p.length; i++) { //ejecutamos las pelotas
    p[i].run(); //estamos ejecutando las pelotas desde void run
  } 

  noCursor();
} 

class pelota { 

  float posX ; //variable posicion X pelotas 
  float posY ; //variable posicion X pelotas para que aparezcan desde cualquier punto del eje Y de la pantalla

  float velX = random(1, 6); //variable velocidad en X
  float velY = random(0, 4); //variable velocidad en Y


  void run() { //equivalente a void draw: función de ejecución de las funciones;
    display(); 
    move(); 
    rebote();
  } 

  void display() { //orden para dibujar las pelotas
    float sz = (dist(posX, posY, mouseX, mouseY))/10; //calculo de distancia entre posicion pelotas y el mouse: definimos variable "sz": cuánto más me acerco a las pelotas, más pequeña es la distancia y por tanto más pequeñas serán las pelotas(elipses)

    noStroke(); //eliminamos el borde de las pelotas
    fill(random(255), random(255), random(255)); //color variable de las pelotas
    ellipse(posX, posY, sz/2, sz/2); //el tamaño de las pelotas depende de la distancia entre pelotas y el mouse

    strokeWeight(5); //grosor del punto centro pelotas
    stroke(255); //color del punto centro pelotas
    point(posX, posY); //punto centro pelotas

    if (mousePressed) {
      
      noStroke(); //eliminamos el borde de las pelotas
      fill(255,100); //color variable de las pelotas
      ellipse(posX, posY, sz/2, sz/2); //el tamaño de las pelotas depende de la distancia entre pelotas y el mouse

      strokeWeight(5); //grosor del punto centro pelotas
      stroke(0); //color del punto centro pelotas
      point(posX, posY); //punto centro pelotas
    }
  } 

  void move() { //movimiento de las pelotas
    posX = posX+velX; //actualice posiciones pelotas
    posY = posY+velY;
  } 

  void rebote() { //rebote de las pelotas contra los bordes de la pantalla
    if (posX<0 || posX>width) { 
      velX = -velX;
    } 

    if (posY<0 || posY>height) { 
      velY = -velY;
    }
  }
}



