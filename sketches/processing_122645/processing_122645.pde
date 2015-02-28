
 
SpecialText t;
 
Ms MainScreen;
Proyectiles proyectiles;
MyIncline myIncline;
ShowSprings showSprings;
PlanetGravity pg;
ShowSystem ss;
Point [] p = nuevo punto [30];
Enlace enlace ;
 
void setup () {
  textFont ( CreateFont ( "Palatino Linotype" , tsize));
  t = nueva SpecialText (tsize);
  noStroke ();
  tamaño (680, 680);
 
  ms = nueva MainScreen (tsize);
  proyectiles = nuevos proyectiles ();
  myIncline = nueva MyIncline ();
  showSprings = nuevos ShowSprings ();
  pg = nueva PlanetGravity ();
  ss = nueva ShowSystem ();
 
  para ( int i = 0; i <p. longitud ; i + +) {
    p [i] = nuevo Punto ();
  }
  enlace = nuevo Link (p);
}
 
void draw () {
  fondo (255);
  llenar (0);
  / / T.createBullet ("Ejemplo", 300, 300);
  / / T.createSubscript ("Ejemplo", "subíndice", 300, 300);
  / / T.createDivision ("numerador", "denominador", 300, 300);
  / / T.createVector ("v", 300, 300);
  / / T.createVectorWithSubscript ("vector", "subíndice", 40, 40);
  si (ms.scrn == 999) {
    ms.display ();
  }
  si (ms.scrn == 0) {
    projectiles.display ();
  }
  si (ms.scrn == 1) {
    myIncline.display ();
  }
  si (ms.scrn == 2) {
    showSprings.displayHorizontal ();
    showSprings.displayVertical ();
  }
  si (ms.scrn == 3) {
    enlace . pantalla ();
  }
  si (ms.scrn == 4) {
    pg.display ();
  }
  si (ms.scrn == 5) {
    ss.display ();
  }
}
 
void mouseReleased () {  eventos / / todo mouseReleased tienen que suceder aquí - a menos que utilice un poco de materia Java ... : (
  si (showSprings.mouseIsDragging) {
    showSprings.mouseIsDragging = false ;
  }
  si (showSprings.vmouseIsDragging) {
    showSprings.vmouseIsDragging = false ;
  }
}
 
 
clase Point {
  float x;
  flotar Y;
  flotar LASTx;
  flotar Lasty;
  flotar nextX;
  flotar Nexty;
  flotar velX;
  flotar Vely;
  flotar t;
  flotar deltaTScale = 570;
  flotar deltaT = 0,05;
  boolean followMouse = false ;
 
  Punto () {
  }
 
  void move ( boolean pin) {
    si (pin == false ) {
      velX = x - LASTx;  / / esto es donde la velocidad se calcula con la integración verlet
      Vely = y - Lasty;
 
      velX * = 0,97;
      Vely * = 0,97;
 
      nextX = x + velX;
      Nexty = y + Vely;  / / añadir 0.1 para agregar la gravedad
 
      LASTx = x;
      Lasty = y;
 
      x = nextX;
      y = Nexty;
    } 
    más {
      si (followMouse == false ) {  / / la correa de sujeción se desplaza en un círculo, normalmente
        circlePath ();
        deltaTScale = slider (deltaTScale, 600, 40, "Speed ​​Orbit" );
        / / Esto sigue el formato: lowerBound + ((whateverScale + 40 - x) / 80) * (upperBound - lowerBound);
        delta T = 0.01 + ((deltaTScale + 40-600) / 80) * (0,2 a 0,01);
      } 
      más {
        x = mouseX ;  / / ... o sigue el ratón
        y = mouseY ;
      }
    }
  }
 
  void circlePath () {  / / crear la trayectoria circular
    strokeWeight (1);
    accidente cerebrovascular (0);
    elipse (340, 340, 10, 10);
    noFill ();
    elipse (340, 340, 260, 260);
    t + = deltaT;
    x = cos (t) * 130 + 340;
    y = pecado (t) * 130 + 340;
    si (t> 2 * PI ) {
      t = 0;
    }
  }
 
  flotar slider ( float a, float x, float y, Cadena de título) {  / / crea escalas móviles, donde 'a' es la ubicación de la corredera
    accidente cerebrovascular (0);
    línea (x - 40, y, x + 40, y);
    line (x - 40, y - 5, x - 40, y + 5);
    line (x + 40, y - 5, x + 40, y + 5);
    noStroke ();
    llenar (0);
    TEXTSIZE (12);
    textAlign ( CENTRO );
    texto (título, x, y - 10);
    textAlign ( IZQUIERDA );
    si ( mouseX > = x - 40 && mouseX <= x + 40 && mouseY > = y - 5 && mouseY <= y + 5 && mousePressed ) {
      A = mouseX ;
      si (a <x - 40) {
        a = x - 40;
      }
      si (a> x + 40) {
        a = x + 40;
      }
    }
    llenar (150, 150, 150);
    elipse (un, y + 1, 10, 10);
    volver a;
  }
}
 
clase Enlace {
  flotar restingDistance = 2;  / / qué distancia cada enlace quiere ser
  flotar [] DIFFX;
  flotar [] Diffy;
  float [] a distancia;
  float [] la diferencia;
  flotar [] TranslateX;
  flotar [] TranslateY;
  Point [] p;
  PVector velVector = nueva PVector (0, 0);
  PVector centripAccel = nueva PVector (0, 0);
  flotar deltaTheta;
  flotar omega;
  flotar prettyOmega;
  flotar mouseTimer = 0;
  SpecialText t;
 
  Link (Point [] punto ) {
    p = punto ;
    DIFFX = nuevo float [. p longitud ];
    Diffy = nuevo float [. p longitud ];
    distancia = nuevo float [p. longitud ];
    diferencia = nuevo float [p. longitud ];
    TranslateX = nuevo float [. p longitud ];
    TranslateY = nuevo float [. p longitud ];
    t = nueva SpecialText (14);
  }
  void solve () {
    para ( int i = 0; i <p. longitud -1, i + +) {
      / / Calcular la distancia
      .. DIFFX [i] = p [i] x - p [i +1] x;
      .. Diffy [i] = p [i] y - p [i +1] y;
      distancia [i] = sqrt (DIFFX [i] * DIFFX [i] + Diffy [i] * Diffy [i]);
 
      / / Diferencia escalar
      diferencia [i] = (restingDistance - distancia [i]) / distancia [i];
 
      / / Traducción para cada punto. Van a ser empujadas 1/2 la distancia necesaria para igualar sus distancias de descanso.
      TranslateX [i] = DIFFX [i] * 0.5 * Diferencia [i];
      TranslateY [i] = Diffy [i] * 0.5 * Diferencia [i];
 
      . p [i] = x + TranslateX [i];
      . p [i] y + = TranslateY [i];
 
      . p [i +1] x - = TranslateX [i];
      . p [i +1] y - = TranslateY [i];
    }
  }
 
  void display () {
    . p [0] mover ( verdadero );  / / pin = true sólo para el primer punto
    para ( int i = 1; i <p. longitud ; i + +) {
      . p [i] move ( falso );
    }
    solve ();
    para ( int i = 0; i <p. longitud -1, i + +) {
      accidente cerebrovascular (0);
      línea (.... p [i] x, p [i] y, p [i +1] x, p [i +1] y);
      noStroke ();
      llenar (0);
      elipse (.. p [i] x, p [i] y, 2, 2);
      elipse (.. p [i +1] x, p [i +1] y, 2, 2);
    }
    noStroke ();
    elipse (p [. p longitud . -1] x, p [. p longitud . -1] y, 20, 20);
 
    PVector last = nueva PVector (p [p. longitud -1] LASTx -. ancho / 2, p [p. longitud Lasty - -1]. Altura / 2);  / / ángulo entre los últimos y próximos lugares (desde el centro de la pantalla )
    PVector next = nueva PVector ([. p p longitud -1]. - nextX ancho [. p / 2, p longitud -1]. Nexty - altura / 2);
    deltaTheta = PVector . angleBetween (apellido, siguiente);
    omega = deltaTheta * frameRate ;  / / velocidad angular = rad / seg, frameRate tiene 60 bucles por segundo, por lo que los cambios de ángulo de 60 * theta radianes por segundo
    prettyOmega = int (omega / PI * 100);
    TEXTSIZE (14);
    si (p [0]. followMouse == false ) {
      texto ( "La velocidad angular Ï ‰ =" + prettyOmega/100 + "Ï € radianes / seg" , 40, 120);
      flotar prettyCA = int (centripAccel. mag () * 100) / 100;
      texto ( "aceleración centrípeta ==" + prettyCA, 40, 80);
      t.createVectorWithSubscript ( "a" , "c" , 192, 80);
      t.createDivision ( "v ^ 2" , "r" , 237, 80);
      accidente cerebrovascular (255, 0, 0);
      línea (350, 60, 350, 100);
      línea (350, 60, 345, 65);
      línea (350, 60, 355, 65);
    }
    accidente cerebrovascular (0, 255, 0);
    línea (190, 20, 190, 60);
    línea (190, 20, 185, 25);
    línea (190, 20, 195, 25);
    flotar prettyV = int (velVector. mag () * 100) / 100;
    texto ( "Velocity =" + prettyV, 40, 40);
    llenar (200, 206, 250);
    noStroke ();
    Rect (500, 70, 170, 35, 10);
    Rect (560, 120, 55, 35, 10);
    si ( mouseX > = 560 && mouseX <= 615 && mouseY > = 120 && mouseY <= 155 && mousePressed == verdadero ) {  / botón / BACK
      ms.scrn = 999;
    }
    mouseTimer + +;
    si ( mouseX > = 500 && mouseX <= 670 && mouseY > = 70 && mouseY <= 105 && mousePressed == verdadero ) {  botón CONTROL / / CAMBIO DE RATÓN
      si (p [0]. followMouse == false && mouseTimer> 7) {
        . p [0] followMouse = verdadero ;
        mouseTimer = 0;
      } 
      si (p [0]. followMouse == verdadero && mouseTimer> 7) {
        . p [0] followMouse = false ;
        mouseTimer = 0;
      }
    }
    llenar (0);
    texto ( "Toggle Control del ratón" , 515, 92);
    texto ( "Volver" , 560 + textWidth ( "Atrás" ) / 2, 142);
 
 
    pushMatrix ();  / / dibujar el vector de velocidad
    traducir (p [p. longitud -1] x, p [p.. longitud -1] y.);
    strokeWeight (2);
    accidente cerebrovascular (0, 255, 0);
    velVector.x = p [. p longitud . -1] nextX - p [. p longitud . -1] LASTx;  / ángulo / velocidad es la secante entre los últimos y próximos lugares de la última Point
    velVector.y = p [. p longitud . -1] Nexty - p [. p longitud . -1] Lasty;
    . velVector normalizar ();
    velVector. mult (8 * sqrt (p [p. longitud -1]. velX * p [p. longitud -1]. velX + p [p. longitud -1]. Vely * p [p. longitud -1]. vamente));
    línea de (0, 0, velVector.x, velVector.y);
 
    si (p [0]. followMouse == false ) {
      accidente cerebrovascular (255, 0, 0);  / / magnitud aceleración centrípeta = V ^ 2 / r
      centripAccel.x = velVector.x;
      centripAccel.y = velVector.y;
      . centripAccel normalizar ();
      . centripAccel mult (velVector. mag . () * velVector mag () / dist ( ancho / 2, altura / 2, p [p. longitud -1] x, p. [p. longitud y) -1].);
      pushMatrix ();
      rotar ( PI / 2);
      línea de (0, 0, centripAccel.x, centripAccel.y);
      popMatrix ();
 
      pushMatrix ();
      accidente cerebrovascular (255, 0, 0);  / / la punta de flecha para el vector de la aceleración centrípeta
      rotar ( PI / 2);
      traducir (centripAccel.x, centripAccel.y);
      . centripAccel div (8);
      girar (3 * PI / 4);
      línea de (0, 0, centripAccel.x, centripAccel.y);
      rotar ( PI / 2);
      línea de (0, 0, centripAccel.x, centripAccel.y);
      popMatrix ();
    }
 
    pushMatrix ();
    accidente cerebrovascular (0, 255, 0);  / / la punta de flecha para el vector de velocidad
    traducir (velVector.x, velVector.y);
    . velVector div (8);
    girar (3 * PI / 4);
    línea de (0, 0, velVector.x, velVector.y);
    rotar ( PI / 2);
    línea de (0, 0, velVector.x, velVector.y);
    popMatrix ();
 
    popMatrix ();
    strokeWeight (1);
  }
}
 
 
clase Descripciones {  / / esta clase simplemente proporciona las descripciones cuando se pasa el ratón sobre cada cuadro de menú
 
  SpecialText t;
 
  Descripciones () {
    llenar (0);
    t = nueva SpecialText (14);
  }
 
  void projectilesDescription () {
    TEXTSIZE (14);
    textAlign ( IZQUIERDA );
    texto ( "Observe la trayectoria de un proyectil" , 400, 160);
    texto ( "ya que se puso en marcha en diferentes" , 400, 178);
    texto ( "ángulos, velocidades iniciales, y" , 400, 196);
    texto ( "alturas también cambiar la altura." , 400, 214);
    texto ( "del lugar de aterrizaje y examinar" , 400, 232);
    texto ( "tiempo aire, máxima del proyectil" , 400, 250);
    texto ( "la altura, y el desplazamiento." , 400, 268);
    t.createDivision ( "Supuestos" , "" , 505, 340);
    t.createBullet ( "Sin resistencia al viento" , 400, 360);
    t.createBullet ( "La fuerza aplicada al centro de gravedad" , 400, 378);
    t.createBullet ( "Aceleración de la gravedad = - 0,1" , 400, 396);
    t.createBullet ( "No se pierde la energía para calentar" , 400, 414);
  }
 
  void inclineDescription () {
    TEXTSIZE (14);
    textAlign ( IZQUIERDA );
    texto ( "Examinar la física detrás de una" , 400, 160);
    texto ( . "bloque deslizándose por un plano inclinado" , 400, 178);
    texto ( "Cambie la masa del bloque, el ángulo" , 400, 196);
    texto ( "de la pendiente, y la fricción." , 400, 214);
    texto ( "Un diagrama visual rompe la" , 400, 232);
    texto ( "fuerza de la gravedad en su paralelo" , 400, 250);
    de texto ( "y componentes perpendiculares" , 400, 268);
    texto ( ". respecto a la inclinación" , 400, 286);
    t.createDivision ( "Supuestos" , "" , 505, 340);
    t.createBullet ( "Sin resistencia al viento" , 400, 360);
    t.createBullet ( "La fuerza aplicada al centro de gravedad" , 400, 378);
    t.createBullet ( "No se pierde la energía para calentar" , 400, 396);
  }
  void springsDescription () {
    TEXTSIZE (14);
    textAlign ( IZQUIERDA );
    texto ( "Observar el movimiento de un resorte" , 400, 160);
    texto ( "y cambie su valor K, descansando" , 400, 178);
    texto ( ". posición y masa También examine" , 400, 196);
    texto ( "los efectos de estas variables" , 400, 214);
    texto ( "en la fuerza de recuperación del" , 400, 232);
    texto ( ".. primavera Arrastre los bloques para moverlos" , 400, 250);
    t.createDivision ( "Supuestos" , "" , 505, 340);
    t.createBullet ( "Sin resistencia al viento" , 400, 360);
    t.createBullet ( "La fuerza aplicada al centro de gravedad" , 400, 378);
    t.createBullet ( "No se pierde la energía para calentar" , 400, 396);
    t.createBullet ( "Cero fricción" , 400, 414);
    t.createBullet ( "Los vectores representados como + / - valores" , 400, 432);
    t.createBullet ( "misma primavera no tiene masa" , 400, 450);
  }
  void curvedDescription () {
    TEXTSIZE (14);
    textAlign ( IZQUIERDA );
    texto ( "Mira como movimiento a lo largo de una curva" , 400, 160);
    texto ( "trazado cambia la velocidad angular" , 400, 178);
    texto ( ". y la aceleración centrípeta" , 400, 196);
    texto ( "Ajustar la velocidad de rotación y" , 400, 214);
    texto ( ". utilizar el ratón para girar el objeto" , 400, 232);
    texto ( "El \" correa \ ". utiliza la integración verlet" , 400, 250);
    t.createDivision ( "Supuestos" , "" , 505, 340);
    t.createBullet ( "Sin resistencia al viento" , 395, 360);
    t.createBullet ( "La fuerza aplicada al centro de gravedad" , 395, 378);
    t.createBullet ( "No se pierde la energía para calentar" , 395, 396);
    t.createBullet ( "Sin gravedad" , 395, 414);
    t.createBullet ( "velocidad angular es una pseudovector" , 395, 432);
    t.createBullet ( "r = distancia desde el centro del círculo" , 395, 450);
  }
  void gravityDescription () {
    TEXTSIZE (14);
    textAlign ( IZQUIERDA );
    texto ( "Examinar los efectos de la de Newton" , 400, 160);
    texto ( "Ley de la Gravitación Universal sobre" , 400, 178);
    texto ( "cuerpos en movimiento circulares cuerpos." , 400, 196);
    texto ( "puede ser añadido al sistema por" , 400, 214);
    texto ( "clic Opcionalmente, los cuerpos." , 400, 232);
    texto ( "formar masas más grandes tras la colisión" , 400, 250);
    texto ( . "hasta que se crea un agujero negro" , 400, 268);
    t.createDivision ( "Supuestos" , "" , 505, 340);
    t.createBullet ( "Sin resistencia al viento" , 400, 360);
    t.createBullet ( "La fuerza aplicada al centro de gravedad" , 400, 378);
    t.createBullet ( "No se pierde la energía para calentar" , 400, 396);
    t.createBullet ( "El agujero negro es sólo por diversión" , 400, 414);
    t.createBullet ( "G = 5,0 × 10 ^ -8" , 400, 432);
  }
  void thermoDescription () {
    TEXTSIZE (14);
    textAlign ( IZQUIERDA );
    texto ( "Observar la relación entre" , 400, 160);
    texto ( "la presión, volumen y temperatura" , 400, 178);
    texto ( "en una cámara cerrada llena de" , 400, 196);
    texto ( "partículas velocidad de las partículas y." , 400, 214);
    texto ( "masa son ajustables, como es la masa" , 400, 232);
    texto ( "de la tapa de la cámara de estos." , 400, 250);
    texto ( "variables determinan interno" , 400, 268);
    texto ( "la energía cinética y la energía." , 400, 286);
    t.createDivision ( "Supuestos" , "" , 505, 340);
    t.createBullet ( "Sin resistencia al viento" , 400, 360);
    t.createBullet ( "La fuerza aplicada al centro de gravedad" , 400, 378);
    t.createBullet ( "No se pierde la energía para calentar" , 400, 396);
    t.createBullet ( "número constante de partículas" , 400, 414);
    t.createBullet ( "constante de gas ideal = 8.31" , 400, 432);
    t.createBullet ( "Aceleración de la gravedad = - .07" , 400, 450);
    t.createBullet ( "100% colisiones elásticas de partículas" , 400, 468);
    t.createBullet ( "Las partículas no interactúan" , 400, 486);
  }
}
 
 
clase PlanetGravity {
 
  int mouseTimer = 0;
  int keytime = 0;
  int buttonTimer = 0;
  int numPlanets = 2;
  ArrayList planetList;
  boolean pausa = false ;
  booleanos useBlackHoles = false ;
  boolean isOverButton = false ;
  SpecialText t;
 
  PlanetGravity () {
    planetList = nuevo ArrayList ();
    para ( int i = 0; i <numPlanets; i + +) {
      . planetList añadir ( nuevo myPLaneT (0, 0, i * 300 100, 340, 20, false ));
    }
    t = nueva SpecialText (14);
  }
 
  void display () {
    keytime + +;
    si ( keyPressed && clave == 'p' && keytime> 7) {
      si (en pausa == false ) {
        pausa = verdadero ;
      } 
      más {
        pausa = false ;
      }
      keytime = 0;
    }
    para ( int i = 0; i <numPlanets; i + +) {
      . MyPLaneT p = (myPLaneT) planetList obtener (i);
      numPlanets = p.display (planetList, useBlackHoles, pausa);
    }
    mouseTimer + +;
    si ( mousePressed && mouseTimer> 7 && isOverButton == false ) {
      . planetList añadir ( nuevo myPLaneT (0, 0, mouseX , mouseY , 30, false ));
      numPlanets + +;
      mouseTimer = 0;
    }
    llenar (200, 206, 250);
    noStroke ();
    Rect (560, 40, 55, 35, 10);
    Rect (510, 80, 150, 35, 10);
    Rect (560, 120, 55, 35, 10);
    llenar (0);
    TEXTSIZE (14);
    texto ( "Reset" , 572, 61);
    texto ( "Toggle Colisiones" , 530, 101);
    texto ( "Volver" , 573, 141);
    texto ( "Haga clic para añadir cuerpos" , 530, 180);
    texto ( "Pulse P para hacer una pausa" , 540, 200);
    t.createVector ( "F" , 40, 40);
    de texto ( "=" , 60, 40);
    t.createDivision ( "masa 1 Ã-masa 2" , "distancia ^ 2" , 130, 40);
    si ( mouseX > = 560 && mouseX <= 615 && mouseY > = 40 && mouseY <= 75 && mousePressed ) {
      numPlanets = 0;
      planetList.clear ();
    }
    buttonTimer + +;
    si ( mouseX > = 510 && mouseX <= 660 && mouseY > = 80 && mouseY <= 115) {
      isOverButton = verdadero ;
      si ( mousePressed && buttonTimer> 7) {
        buttonTimer = 0;
        si (useBlackHoles) {
          useBlackHoles = false ;
        } 
        más {
          useBlackHoles = verdadero ;
        }
      }
    } 
    más {
      isOverButton = false ;
    }
    si ( mouseX > = 560 && mouseX <= 615 && mouseY > = 120 && mouseY <= 155 && mousePressed ) {
      ms.scrn = 999;
    }
  }
}
 
clase myPLaneT {
  flotar G = .00000005;
  flotar R;
  flotar en masa;
  flotar CRITICALMASS = 320;
  flotar totalX;
  flotar totalmente;
  flotar totalDist;
  flotar avgDist;
  flotar totalMass;
  flotar avgMass;
  PVector fuerza = nueva PVector (0, 0);
  PVector accel = nueva PVector (0, 0);
  PVector velocidad = nueva PVector (0, 0);
  PVector posición = nueva PVector (0, 0);
  color de c;
  boolean golpe;
  boolean isBlackHole;
  flotar RotateAngle = 0;
 
  MyPLaneT ( flotar velX, flotar Vely, float x, float y, float radio, boolean Blackhole) {
    velocity.x = velX;
    velocity.y = Vely;
    position.x = x;
    position.y = y;
    r = radio;
    masa = r * r * PI ;
    isBlackHole = Blackhole;
    si (isBlackHole == false ) {
      c = de color ( al azar (0, 180), al azar (0, 180), al azar (0, 180), 170);
    } 
    más {
      c = de color (0);
    }
  }
 
  int pantalla ( ArrayList planetList, booleanos useBlackHoles, boolean pausa) {
    si (isBlackHole == false ) {
      si (planetList. tamaño ()> 1) {
        setForce (planetList, position.x, position.y);
        accel.x = force.x / masa;
        accel.y = force.y / masa;
        . velocidad añadir (aceleración);
      }
      si (en pausa == false ) {
        . posición de añadir (velocidad);
      }
      para ( int i = 0; i <planetList. tamaño (); i + +) {
        . MyPLaneT p = (myPLaneT) planetList obtener (i);
        si (p! = este ) {
          golpear = checkCollision ( este , p, useBlackHoles);
        }
        si (hit) {
          flotar newVelX = (masa * velocity.x + p.mass * p.velocity.x) / (masa + p.mass);
          flotar newVelY = (masa * velocity.y + p.mass * p.velocity.y) / (masa + p.mass);
          flotar newPosX = (position.x + p.position.x) / 2;
          flotar newPosY = (position.y + p.position.y) / 2;
          flotar NEWR = r + pr;
          si (p.isBlackHole == false ) {
            . planetList añadir ( nuevo myPLaneT (newVelX, newVelY, newPosX, newPosY, NEWR, falso ));
            planetList.remove ( este );
            planetList.remove (p);
          } 
          más {
            planetList.remove ( este );
          }
        }
      }
    }
    si (position.xr <0) {
      position.x = r;
      velocity.x * = -1;
    }
    si (position.x + r> ancho ) {
      position.x = ancho -r;
      velocity.x * = -1;
    }
    si (position.yr <0) {
      position.y = r;
      velocity.y * = -1;
    }
    si (position.y + r> altura ) {
      position.y = altura -r;
      velocity.y * = -1;
    }
    si (r> = CRITICALMASS && isBlackHole == false ) {
      createBlackHole (planetList);
    }
    si (isBlackHole) {
      lineAnimation ();
    }
    llenar (c);
    elipse (position.x, position.y, 2 * r, 2 * r);
 
    devolver . planetList tamaño ();
  }
 
  void setForce ( ArrayList planetList, float x, float y) {
    totalX = 0;
    Totalmente = 0;
    totalDist = 0;
    totalMass = 0;
    . fuerza mult (0);
    para ( int i = 0; i <planetList. tamaño (); i + +) {
      . MyPLaneT p = (myPLaneT) planetList obtener (i);
      si (p! = este ) {
        totalX + = p.position.x - x;
        Totalmente + = p.position.y - y;
        totalDist + = dist (x, y, p.position.x, p.position.y);
        si (p.isBlackHole == false ) {
          totalMass + = p.mass;
        } 
        más {
          totalMass = 100.000;
        }
      }
    }
    force.x = totalX / (planetList. tamaño () -1);  / / -1 porque no estamos incluyendo este planeta en el cálculo
    force.y = Totalmente / (planetList. tamaño () -1);
    si (avgDist> 0,1) {
      avgDist = totalDist / (planetList. tamaño () -1);
    } 
    más {
      avgDist = 0,1;
    }
    avgMass = totalMass / (planetList. tamaño () -1);
    . vigor normalizar ();
    . fuerza mult ((G * masa * avgMass) / (avgDist * avgDist));
  }
 
  boolean checkCollision (myPLaneT a, b myPLaneT, booleanos useBlackHoles) {
    boolean hit = false ;
    si ( dist (a.position.x, a.position.y, b.position.x, b.position.y) <br A.R + && useBlackHoles == verdadero ) {
      golpear = verdadero ;
    }
    volver golpeado;
  }
 
  void createBlackHole ( ArrayList planetList) {
    MyPLaneT bh = nueva myPLaneT (0, 0, position.x, position.y, 10, cierto );
    . planetList añadir (bh);
    planetList.remove ( este );
  }
 
  void lineAnimation () {
    RotateAngle + = 0,05;
    accidente cerebrovascular (0);
    noFill ();
    para ( int i = 0; i <22; i + +) {
      pushMatrix ();
      traducir (position.x, position.y);
      rotar (i * 10);
      rotar (RotateAngle);
      bezier (0, 0, 15, -25, 55, -25, 70, 0);
      popMatrix ();
    }
    llenar (0);
    noStroke ();
  }
}
 
 
clase MainScreen {
  int tsize;
  int numBoxes;
  boolean [] se hace clic;
  boolean [] mouseIsHovering;
  Cadena [] = {boxTitle
    "Proyectiles" , "La fricción y la pendiente" , "Springs" , "movimiento curvo" , "Gravity" , "Termodinámica"
  };
  flotar scrn = 999;
  Descripciones D;
 
  MainScreen ( int tsize) {
    este . tsize = tsize;
    . numBoxes = boxTitle longitud ;
    hecho clic = nueva boolean [numBoxes];
    mouseIsHovering = nueva boolean [numBoxes];
    para ( int i = 0; i <se hace clic. longitud ; i + +) {
      clic en [i] = false ;
      mouseIsHovering [i] = false ;
    }
    d = nuevos Descripciones ();
  }
 
  boolean MenuBox ( float x, float y, float w, float h, Cadena etiqueta) {  / / método para dibujar cada cuadro de menú
    boolean selected = false ;
    si ( mouseX > = x && mouseX <= x + w && mouseY > = y && mouseY <y + h) {
      llenar (200, 206, 250);
      noStroke ();
      Rect (380, 130, 250, 450, 10);
      triángulo (x + w, y + h / 2, 381, y + h / 2 - 22, 381, y + h / 2 + 22);
      si ( mousePressed == verdadero ) {
        selected = verdadero ;
      }
    }
    más {
      noFill ();
    }
    accidente cerebrovascular (0);
    rect (x, y, w, h);
    TEXTSIZE (24);
    llenar (0);
    texto (etiqueta, x + w / 2, y + h / 2 + 8);
 
    volver seleccionado;
  }
  boolean cernido ( float x, float y, float w, float h) {  / / método para mostrar las descripciones, si el ratón sobre
    boolean vuelo estacionario;
    si ( mouseX > = x && mouseX <= x + w && mouseY > = y && mouseY <y + h) {
      libración = verdadero ;
    } 
    más {
      libración = false ;
    }
    volver flotar;
  }
 
  void display () {
    textAlign ( CENTRO );
    TEXTSIZE (30);
    texto ( "Física" , 340, 70);
    para ( int i = 0; i <numBoxes; i + +) {
      mouseIsHovering [i] = flotando (100, i * 80 + 130, 250, 50);
      clic en [i] = MenuBox (100, i * 80 + 130, 250, 50, boxTitle [i]);
      si (hace clic en [i]) {
        scrn = i;
      }
    }
    si (mouseIsHovering [0]) {
      d.projectilesDescription ();
    }
    si (mouseIsHovering [1]) {
      d.inclineDescription ();
    }
    si (mouseIsHovering [2]) {
      d.springsDescription ();
    }
    si (mouseIsHovering [3]) {
      d.curvedDescription ();
    }
    si (mouseIsHovering [4]) {
      d.gravityDescription ();
    }
    si (mouseIsHovering [5]) {
      d.thermoDescription ();
    }
    textAlign ( CENTRO );
    TEXTSIZE (tsize);
    texto ( "TrevPhil" , 630, 665);
    textAlign ( IZQUIERDA );
  }
}
 
 
clase MyIncline {
 
  flotar iHeightScale = 340;
  flotar frictionScale = 340;
  flotar massScale = 380;
  flotar iAltura = 250;
  flotar inclineAngle = 0;
  flotar RotateAngle = 0;
  flotar x = 650;
  flotan y = 600;
  int timer = 0;
 
  flotar masa = 1,700;
 
  flotar frictionLevel;
  flotar frictionLine;
 
  flotar grav = - 0,07 * masa;  / / - 0,07 es la aceleración debida a la gravedad
  PVector velocidad = nueva PVector (0, 0);
  PVector posición = nueva PVector (x, y);
 
  PVector gravPerp = nueva PVector (- pecado ( radianes (36,3)) * grav * cos ( radianes (36,3)), cos ( radianes (36,3)) * grav * cos ( radianes (36,3)));
  PVector gravParallel = nueva PVector ( cos ( radianes (36,3)) * grav * sen ( radianes (36,3)), el pecado ( radianes (36,3)) * grav * sen ( radianes (36,3)));
  PVector gravForce = nueva PVector (gravPerp.x + gravParallel.x, gravPerp.y + gravParallel.y);
  PVector NormalForce = nueva PVector (gravPerp.x * -1, gravPerp.y * -1);
  PVector fricción = nueva PVector (gravParallel.x * -1, gravParallel.y * -1);
 
  SpecialText t;
 
  MyIncline () {
    t = nueva SpecialText (14);
  }
 
  void display () {
    iHeightScale = slider (iHeightScale, 340, 40, "Inclinación Altura" );  escalas / / correderas y sus valores relativos
    frictionScale = slider (frictionScale, 340, 80, "fricción" );
    massScale = slider (massScale, 340, 120, "Misa del Bloque" );
 
    velocity.x + = gravForce.x / masa;  / / añadir aceleración
    velocity.y + = gravForce.y / masa;
    . posición de añadir (velocidad);
 
    inclineAngle = grados ( Atan (iHeight/340));  / / encontrar el ángulo de la pendiente
    gravPerp.x = - pecado ( radianes (inclineAngle)) * grav * cos ( radianes (inclineAngle));  / / reajustar vectores cuando la altura de inclinación cambia
    gravPerp.y = cos ( radianes (inclineAngle)) * grav * cos ( radianes (inclineAngle));
    normalForce.x = gravPerp.x * -1;  / / fuerza normal contrarresta la gravedad componente perpendicular a la pendiente
    normalForce.y = gravPerp.y * -1;
    gravParallel.x = cos ( radianes (inclineAngle)) * grav * pecado ( radianes (inclineAngle));
    gravParallel.y = pecado ( radianes (inclineAngle)) * grav * pecado ( radianes (inclineAngle));
    friction.x = gravParallel.x * -1;
    friction.y = gravParallel.y * -1;
    . fricción normalizar ();
    . fricción mult (frictionLevel);
    si (friction. mag ()> gravParallel. mag ()) {  / / no queremos fricción para mover el bloque por la rampa!
      . fricción normalizar ();
      . fricción mult (gravParallel. mag ());
    }
    gravForce.x = gravPerp.x + gravParallel.x;  / / gravedad es la suma de sus componentes perpendiculares y paralelas a la pendiente
    gravForce.y = gravPerp.y + gravParallel.y;
 
    llenar (200, 206, 250);  botón / / RESET
    noStroke ();
    Rect (22.5, 220, 55, 35, 10);
    Rect (22.5, 170, 55, 35, 10);
    si ( mouseX > = 22,5 && mouseX <= 77,5 && mouseY > = 220 && mouseY <= 255 && mousePressed == verdadero ) {
      init ();
    }
    si ( mouseX > = 22,5 && mouseX <= 77,5 && mouseY > = 170 && mouseY <= 192 && mousePressed == verdadero ) {
      init ();
      ms.scrn = 999;
    }
    llenar (0);
    TEXTSIZE (14);
    texto ( "Reset" , 34, 242);
    texto ( "Volver" , 36, 192);
    texto ( int (iAltura), 390, 40);
    texto (frictionLevel, 390, 80);
    texto ( int (masa), 390, 120);
    grav = - 0,07 * masa;
    llenar (0);
    accidente cerebrovascular (0);
    texto ( "Fuerza de gravedad (donde = - 0,07)" , 100, 300);
    t.createVectorWithSubscript ( "F" , "G" , 100 + textWidth ( "Fuerza de gravedad" ), 300);
    t.createVector ( "a" , 100 + textWidth ( "Fuerza de gravedad (donde" ), 300);
    llenar (255, 0, 0);
    accidente cerebrovascular (255, 0, 0);
    texto ( "componente perpendicular = cos Ó ¨" , 100, 420);
    t.createVectorWithSubscript ( "F" , "G" , 100 + textWidth ( "componente perpendicular =" ), 420);
    llenar (0, 0, 255);
    accidente cerebrovascular (0, 0, 255);
    texto ( "componente paralelo = sen Ó ¨" , 100, 460);
    t.createVectorWithSubscript ( "F" , "G" , 100 + textWidth ( "componente paralelo =" ), 460);
    llenar (150, 40, 180);
    texto ( "Fuerza normal" , 100, 500);
    llenar (0, 255, 0);
    texto ( "Fuerza de fricción" , 100, 540);
    llenar (0);
    flotar prettyAngle = int (inclineAngle * 100) / 100;
    texto ( "Ángulo de inclinación (Ó ¨) =" + prettyAngle + "Â °" , 100, 340);
    texto ( "Ó ¨" , 153, 158);
    flotar . prettyNum = fricción mag . () / NormalForce mag ();
    texto ( "Coeficiente de fricción Î ¼ ==" + prettyNum, 100, 380);
    t.createDivision ( "| fuerza de fricción |" , "| fuerza normal |" , 100 + textWidth ( "Coeficiente de fricción estática =" ), 380);
    pushMatrix ();
    escala (1, -1);  / / establece las coordenadas de sistema estándar (de origen en la parte inferior izquierda)
    traducir (0, - altura );
 
    / / Esto sigue el formato: lowerBound + ((whateverScale + 40 - x) / 80) * (upperBound - lowerBound);
    iAltura = 0 + ((iHeightScale + 40-340) / 80) * (500-0);
    frictionLevel = 0 + ((frictionScale + 40-340) / 80) * (60 - 0);
    frictionLine = frictionLevel/25;
    masa = 800 + ((massScale + 40-340) / 80) * (1700-800);
 
    si (position.y <(iHeight/340) * (position.x-340)) {  / / si el bloque golpea la pendiente
      si (temporizador <1) {  / / restablece la velocidad vertical a cero
        velocity.y = 0;
        tiempo + +;
      }
      velocity.x + = normalForce.x / masa;  / / añadir fuerza normal si se produce una colisión
      velocity.y + = normalForce.y / masa;
      velocity.x + = friction.x / masa;  / / añadir fricción si se produce una colisión
      velocity.y + = friction.y / masa;
 
      si (RotateAngle <inclineAngle) {
        RotateAngle + = 5;
      }
    }
 
    pushMatrix ();  / / dibujar la caída del bloque
    traducir (position.x, position.y);
    rotar ( radianes (RotateAngle));
    llenar (0);
    Rect (-50, 0, 50, 50);
    popMatrix ();
    accidente cerebrovascular (0);
    noFill ();
    rect (x-50, 600, 50, 50);
 
    pushMatrix ();  / / fuerza de vectores y componentes gravedad dibujar
    traducir (150, 550);
    línea de (0, 0, gravForce.x, gravForce.y);
    line (gravForce.x, gravForce.y, gravForce.x - 5, gravForce.y + 5);
    line (gravForce.x, gravForce.y, gravForce.x + 5, gravForce.y + 5);
    accidente cerebrovascular (150, 40, 180);
    línea de (0, 0, normalForce.x, normalForce.y);
    accidente cerebrovascular (255, 0, 0);
    línea de (0, 0, gravPerp.x, gravPerp.y);
    accidente cerebrovascular (0, 0, 255);
    pushMatrix ();
    traducir (gravPerp.x, gravPerp.y);
    línea de (0, 0, gravParallel.x, gravParallel.y);
    accidente cerebrovascular (0, 255, 0);
    línea de (0, 0, friction.x, friction.y);
    popMatrix ();
    popMatrix ();
 
    accidente cerebrovascular (0);  / / dibujar inclinación
    llenar (0);
    beginShape ();
    vértice (340, 0);
    vértice (680, 0);
    vértice (680, iAltura);
    vértice (340, 0);
    endShape ();
    para ( int i = 0; i < sqrt (iAltura * iAltura + 340 * 340); i + = 3) {
      flotar yBump = (iHeight/340) * (i - 340);
      línea (680-i,-yBump, 680-i,-yBump + frictionLine);
    }
 
    popMatrix ();
  }
 
  void init () {  / / reset para trastornos que comienzan
    RotateAngle = 0;
    timer = 0;
    masa = 1,700;
    grav = - 0,07 * masa;
    velocity.x = 0;
    velocity.y = 0;
    position.x = x;
    position.y = y;
  }
 
  flotar slider ( float a, float x, float y, Cadena de título) {  / / crea escalas móviles, donde 'a' es la ubicación de la corredera
    accidente cerebrovascular (0);
    línea (x - 40, y, x + 40, y);
    line (x - 40, y - 5, x - 40, y + 5);
    line (x + 40, y - 5, x + 40, y + 5);
    noStroke ();
    llenar (0);
    TEXTSIZE (12);
    textAlign ( CENTRO );
    texto (título, x, y - 10);
    textAlign ( IZQUIERDA );
    si ( mouseX > = x - 40 && mouseX <= x + 40 && mouseY > = y - 5 && mouseY <= y + 5 && mousePressed ) {
      A = mouseX ;
      si (a <x - 40) {
        a = x - 40;
      }
      si (a> x + 40) {
        a = x + 40;
      }
    }
    llenar (150, 150, 150);
    elipse (un, y + 1, 10, 10);
    volver a;
  }
}
 
 
clase Proyectiles {
 
  flotar Y;
  flotar ángulo;
  flotar landingY;
  flotar initialV;
  flotar cannonHeightScale = 540;
  flotar cannonAngleScale = 520;
  flotar landingYScale = 540;
  flotar initialVScale = 580;
  boolean impacto = false ;
 
  PVector accel = nueva PVector (0, 0.1);
  PVector velocidad = nueva PVector (0, 0);
  PVector posición = nueva PVector (0, 680);
 
  int tiempo = 0;
 
  SpecialText t;
 
  Proyectiles () {
    y = 480;
    t = nueva SpecialText (14);
  }
 
  void display () {
    si (impacto == false ) {  / / la bola se mueve con tal de que no afecta a nada
      . velocidad añadir (aceleración);
      . posición de añadir (velocidad);
      tiempo + +;
    }
 
    llenar (0);
    elipse (position.x, position.y, 20, 20);
 
    llenar (200, 206, 250);  botón / / FIRE
    noStroke ();
    Rect (22.5, 220, 55, 35, 10);
    Rect (22.5, 170, 55, 35, 10);
    llenar (0);
    TEXTSIZE (14);
    texto ( "Fire" , 39, 242);
    texto ( "Volver" , 36, 192);
    si ( mouseX > = 22,5 && mouseX <= 77,5 && mouseY > = 220 && mouseY <= 255 && mousePressed == verdadero ) {
      velocity.x = - cos ( radianes (ángulo-450)) * initialV;
      velocity.y = - pecado ( radianes (ángulo-450)) * initialV;
      position.x = 50;
      position.y = y - 62,5;
      impacto = false ;
      tiempo = 0;
    }
    si ( mouseX > = 22,5 && mouseX <= 77,5 && mouseY > = 170 && mouseY <= 192 && mousePressed == verdadero ) {
      ms.scrn = 999;
    }
 
    beginShape ();  / brazo de soporte de cañón / derecha
    vértice (100, y + 10);
    vértice (100, Y - 70);
    vértice (60, Y - 70);
    vértice (60, Y - 55);
    vértice (85, Y - 55);
    vértice (85, y + 10);
    endShape ();
 
    cannonHeightScale = slider (cannonHeightScale, 540, 40, "Cannon Altura" );  escalas / / correderas y sus valores relativos
    cannonAngleScale = slider (cannonAngleScale, 540, 80, "Ángulo Cannon" );
    landingYScale = slider (landingYScale, 540, 120, "Altura de la plataforma" );
    llenar (0);
    t.createVectorWithSubscript ( "v" , "i" , 504, 150);
    texto ( int (62,5 680-y), 590, 40);
    texto (270-angle + "Â °" , 590, 80);
    texto ( int (680-landingY), 590, 120);
    texto (initialV, 590, 160);
    initialVScale = control deslizante (initialVScale, 540, 160, "Magnitud" );
    / / Esto sigue el formato: lowerBound + ((whateverScale + 40 - x) / 80) * (upperBound - lowerBound);
    Y = 660 + ((cannonHeightScale + 40-540) / 80) * (380 a 660);
    ángulo = 255 + ((cannonAngleScale + 40-540) / 80) * (20-75);
    landingY = 660 + ((landingYScale + 40-540) / 80) * (380 a 660);
    initialV = 3 + ((initialVScale + 40-540) / 80) * (6,2 - 3);
 
    accidente cerebrovascular (0);
    para ( int pointx = 0; pointx <630; pointx + +) {
      flotar beforePointY = pecado ( radianes (ángulo-450)) * initialV * (pointx-1) + (- 0,1 / 2) * (pointx-1) * (pointx-1);  / / puntos utilizados para determinar la altura máxima
      flotar puntiagudas = pecado ( radianes (ángulo-450)) * initialV * pointx + (- 0,1 / 2) * pointx * pointx;
      flotar afterPointY = pecado ( radianes (ángulo-450)) * initialV * (pointx 1) + (- 0,1 / 2) * (pointx 1) * (pointx 1);
      punto (pointx * initialV * - cos ( radianes (ángulo-450)) + 50, y-62.5-puntiagudas);
      si (puntiagudas> beforePointY && puntiagudas> afterPointY) {
        llenar (0, 255, 0);
        elipse (pointx * initialV * - cos ( radianes (ángulo-450)) + 50, y-62.5-puntiagudo, 10, 10);
        TEXTSIZE (14);
        llenar (0);
        texto (puntiagudas 62,5 + (680-y), de 40 textWidth ( "Altura máxima == (pecar Ó ¨) ^ 2/2 =" ), 120);
      }
      llenar (150, 150, 150);
    }
 
    pushMatrix ();  / / dibujar cañón
    accidente cerebrovascular (0);
    traducir (50, y - 62,5);
    rotar ( radianes (ángulo));
    beginShape ();
    vértice (-10, 15);
    vértice (10, 15);
    vértice (10, 20);
    vértice (-10, 20);
    vértice (-15, -40);
    bezierVertex (-10, -60, 10, -60, 15, -40);
    vértice (10, 20);
    endShape ();
    noStroke ();
    popMatrix ();
 
    llenar (0);
    rect (0, y, 100, 680 - y);  / / dibujar la plataforma de izquierda
    rect (0, 660, 680, 20);  / / dibujar el rectángulo inferior
    rect (380, landingY, 300, 680 - landingY);  / / dibujar la plataforma derecha
 
    Pruebas / / colisión
    si (position.x 10> = 380 && position.y-5> = landingY && position.y 10 <= 660) {  / / si el lado derecho de la bola golpea la pared
      impacto = verdadero ;
      position.x = 370;
    }
    si (position.x-5> = 380 && position.x <= 680 && position.y 10> = landingY) {  / / si el fondo del balón pegó en la parte superior de aterrizaje
      impacto = verdadero ;
      position.y = landingY-10;
    }
    si (position.y> = 660) {  / / si el fondo del balón pegó en la base
      impacto = verdadero ;
      position.y = 650;
    }
 
    beginShape ) (;  brazo de soporte de cañón / / izquierda
    vértice (0, y + 10);
    vértice (0, Y - 70);
    vértice (40, Y - 70);
    vértice (40, Y - 55);
    vértice (15, Y - 55);
    vértice (15, y + 10);
    endShape ();
 
    Tamaño del texto (14);  las estadísticas de vuelo / / de bolas
    texto ( "Desplazamiento = (+ 0,5 i" t) Î "t =" , 40, 40);
    t.createVectorWithSubscript ( "v" , "i" , de 40 textWidth ( "Desplazamiento = (" ), 40);
    t.createVector ( "a" , de 40 textWidth ( "Desplazamiento = (+ 0,5" ), 40);
    si (position.x> 50) {
      texto ( dist (position.x, position.y, 50, y - 62,5), 40 + textWidth ( "Desplazamiento = (+ 0,5 i" t) Î "t =" ), 40);
    }  más   {
      tiempo = 0;
    }
    texto ( "Tiempo Aire =" , 40, 80);
    texto (hora, 40 + textWidth ( "Tiempo Aire =" ), 80);
    texto ( "Altura máxima == (pecar Ó ¨) ^ 2/2 =" , 40, 120);
    t.createVectorWithSubscript ( "s" , "y" , de 40 textWidth ( "Altura máxima =" ), 120);
    t.createVectorWithSubscript ( "v" , "i" , de 40 textWidth ( "Altura máxima == (" ), 120);
    t.createVector ( "a" , de 40 textWidth ( "Altura máxima == (pecar Ó ¨) ^ 2/2" ), 120);
  }
 
  flotar slider ( float a, float x, float y, Cadena de título) {  / / crea escalas móviles, donde 'a' es la ubicación de la corredera
    accidente cerebrovascular (0);
    línea (x - 40, y, x + 40, y);
    line (x - 40, y - 5, x - 40, y + 5);
    line (x + 40, y - 5, x + 40, y + 5);
    noStroke ();
    llenar (0);
    TEXTSIZE (12);
    textAlign ( CENTRO );
    texto (título, x, y - 10);
    textAlign ( IZQUIERDA );
    si ( mouseX > = x - 40 && mouseX <= x + 40 && mouseY > = y - 5 && mouseY <= y + 5 && mousePressed ) {
      A = mouseX ;
      si (a <x - 40) {
        a = x - 40;
      }
      si (a> x + 40) {
        a = x + 40;
      }
    }
    llenar (150, 150, 150);
    elipse (un, y + 1, 10, 10);
    volver a;
  }
}
 
 
clase ShowSprings {
  int numCoils = 10;  / variables de primavera / horizontales
  flotar kScale = 70;
  flotar restScale = 210;
  flotar massScale = 250;
  flotar w;
  flotar tiempo = 0;
  flotar Restpos = 50;
  flotar initialPos = 300;
  flotar A = abs (initialPos - Restpos);
  flotar K = 0,7;
  flotar amortiguar = 0,99;
  flotar masa = 100;
  flotar desplazamiento;
  flotar restorativeForce;
  boolean mouseIsDragging = false ;
 
  flotar vh;  / / variables spriing verticales
  flotar vkScale = 400;
  flotar vrestScale = 400;
  flotar vmassScale = 380;
  flotar VTIME = 0;
  flotar vacceleration = 2;
  flotar vmass = 100;
  flotar vdisplacement;
  flotar vrestorativeForce;
  flotar vrestPos = vmass * vacceleration;
  flotar vinitialPos = 250;
  flotar vA = abs (vinitialPos - vrestPos);
  flotar Uk = 0,7;
  flotar vdampen = 0,99;
  boolean vmouseIsDragging = false ;
 
  ShowSprings () {
  }
 
  void displayHorizontal () {  
    rectMode ( CENTRO );
    kScale = slider (kScale, 70, 500, "k Valor" );  / / escalas y sus valores relativos de deslizamiento
    restScale = slider (restScale, 170, 500, "Rest Position" );
    massScale = slider (massScale, 270, 500, "Misa del Bloque" );
    / / Esto sigue el formato: lowerBound + ((whateverScale + 40 - x) / 80) * (upperBound - lowerBound);
    K = 0,1 + ((kScale + 40 - 70) / 80) * (0,9 a 0,1);
    Restpos = -100 + ((restScale + 40-170) / 80) * (200 a 100);
    masa = 10 + ((massScale + 40-270) / 80) * (500 - 10);
    llenar (200, 206, 250);  botón / / BACK
    noStroke ();
    Rect (50, 400, 55, 35, 10);
    llenar (0);
    accidente cerebrovascular (0);
    textAlign ( CENTRO );  text / / pantalla, ecuaciones y los valores en tiempo real
    texto (K, 70, 470);
    texto ( int (Restpos), 170, 470);
    texto ( int (masa), 270, 470);
    texto ( "0" , 340, 473);
    textAlign ( ESQUINA );
    TEXTSIZE (14);
    texto ( "Desplazamiento = A cos (como (k / m) en tiempo Ã) =" , 30, 200);
    flotar prettyVD = int (vdisplacement * 100) / 100;
    texto ( "(primavera vertical)" + prettyVD, 30, 225);
    flotar prettyD = int (desplazamiento * 100) / 100;
    texto ( "(primavera horizontal)" + prettyD, 30, 250);
    texto ( "fuerza restauradora =-k × desplazamiento =" , 30, 290);
    flotar prettyVR = int (vrestorativeForce * 100) / 100;
    texto ( "(primavera vertical)" +-prettyVR, 30, 315);
    flotar prettyR = int (restorativeForce * 100) / 100;
    texto ( "(primavera horizontal)" + prettyR, 30, 340);
    texto ( "Haga clic y arrastre para mover los bloques" , 40, 650);
    texto ( "Volver" , 50 - textWidth ( "Atrás" ) / 2, 404);
    TEXTSIZE (12);
    texto ( "Dada movimiento unidimensional, asumir" , 40, 40);
    texto ( "que los valores positivos representan vector" , 40, 65);
    de texto ( "direcciones hacia la derecha / hacia abajo y" , 40, 90);
    de texto ( "valores negativos a la izquierda / hacia arriba" , 40, 115);
    si ( mouseX > = 22,5 && mouseX <= 77,5 && mouseY > = 382.5 && mouseY <= 417.5 && mousePressed == verdadero ) {  / botón / BACK
      ms.scrn = 999;
    }
 
    si (mouseIsDragging == false ) {  / / la amplitud disminuye cuando el usuario no está arrastrando bloques
      tiempo + +;
      si ( abs (A) <0.1) {
        A = 0;
      } más {
        A * = amortiguar;
      }
      desplazamiento = A * cos ( sqrt (K / m) * tiempo);
      restorativeForce = -1 * K * desplazamiento;
    }
 
    pushMatrix ();
    traducir (340, 580);
    Rect (0, 10, 680, 20);
    línea de (0, 0, 0, -100);
    línea (Restpos, 60, Restpos, -60);
    texto ( "Rest Position" , Restpos- textWidth ( "Rest Position" ) / 2, 75);
    rectMode ( ESQUINA );
    w = desplazamiento + Restpos;
    noFill ();
    para ( int i = 0; i <numCoils; i + +) {  / / Dibuja el muelle (para la estética solamente)
      bezier (i * (w / numCoils), -15, i * (w / numCoils) 5, -45, (i +1) * (w / numCoils) -5, -45, (i +1) * ( W / numCoils), -15);
    }
    rectMode ( CENTRO );
 
    traducir (Restpos, 0);
    llenar (0);
    si ( mouseX > = desplazamiento + Restpos-25 340 && mouseX <= desplazamiento + Restpos 25 340 && mouseY > = -50 600 && mouseY <= 0 && 600 mousePressed ) {
      mouseIsDragging = verdadero ;
    }
    si (mouseIsDragging) {  / / cuando el usuario arrastra los bloques
      tiempo = 0;
      desplazamiento = mouseX - 340 - Restpos;
      A = desplazamiento;
    }
    rect (desplazamiento, -25, 50, 50);  / / dibujar el bloque
    popMatrix ();
  }
 
  anular displayVertical () {  / / esto es exactamente lo mismo que displayHorizontal () salvo invertidas visualmente (x, y) -> (y, x)
    rectMode ( CENTRO ); 
    vkScale = slider (vkScale, 400, 40, "k Valor" );  escalas / / correderas y sus valores relativos
    vrestScale = slider (vrestScale, 400, 80, "Rest Position" );
    vmassScale = slider (vmassScale, 400, 120, "Misa del Bloque" );
    / / Esto sigue el formato: lowerBound + ((whateverScale + 40 - x) / 80) * (upperBound - lowerBound); (¿o lo hace)
    Uk = - 0,9 + ((vkScale + 40-480) / 80) * (0,1 hasta 0,9);
    vrestPos = 300 + ((vrestScale + 40-480) / 80) * (550-300) - vmass/30;  / / la masa afecta ligeramente la posición de reposo (la estética solamente)
    vmass = -500 + ((vmassScale + 40-480) / 80) * (10 a 500);
    llenar (0);
    accidente cerebrovascular (0);
    textAlign ( CENTRO );
    texto (-VK, 335, 40);
    texto ( int (vrestPos), 335, 80);
    texto (- int (vmass), 335, 120);
    textAlign ( ESQUINA );
 
    si (vmouseIsDragging == false ) {
      VTIME + +;
      si ( abs (vA) <0.1) {
        vA = 0;
      } más {
        vA * = vdampen;
      }
      vdisplacement = vA * cos ( sqrt (VK / vmass) * VTIME);
      vrestorativeForce = -1 * vK * vdisplacement;
    }
 
    línea (490, vrestPos, 610, vrestPos);
    texto ( "Descanso" , 620, vrestPos-10);
    texto ( "Posición" , 620, vrestPos 10);
    rectMode ( ESQUINA );
    vh = vdisplacement + vrestPos;
    noFill ();
    para ( int i = 0; i <numCoils; i + +) {
      bezier (540, i * (vh / numCoils), 555, i * (vh / numCoils) 5, 585, (i +1) * (vh / numCoils) -5, 540, (i +1) * (vh / numCoils));
    }
    rectMode ( CENTRO );
 
    traducir (0, vrestPos);
    llenar (0);
    si ( mouseY > = vdisplacement + vrestPos-25 && mouseY <= vdisplacement + vrestPos 25 && mouseX > = 550-25 && mouseX <= 550 25 && mousePressed ) {
      vmouseIsDragging = verdadero ;
    }
    si (vmouseIsDragging) {
      VTIME = 0;
      vdisplacement = mouseY - vrestPos;
      vA = vdisplacement;
    }
    Rect (550, vdisplacement, 50, 50);
    rectMode ( ESQUINA );
  }
 
  flotar slider ( float a, float x, float y, Cadena de título) {  / / crea escalas móviles, donde 'a' es la ubicación de la corredera
    accidente cerebrovascular (0);
    línea (x - 40, y, x + 40, y);
    line (x - 40, y - 5, x - 40, y + 5);
    line (x + 40, y - 5, x + 40, y + 5);
    noStroke ();
    llenar (0);
    TEXTSIZE (12);
    textAlign ( CENTRO );
    texto (título, x, y - 10);
    textAlign ( IZQUIERDA );
    si ( mouseX > = x - 40 && mouseX <= x + 40 && mouseY > = y - 5 && mouseY <= y + 5 && mousePressed ) {
      A = mouseX ;
      si (a <x - 40) {
        a = x - 40;
      }
      si (a> x + 40) {
        a = x + 40;
      }
    }
    llenar (150, 150, 150);
    elipse (un, y + 1, 10, 10);
    volver a;
  }
}
 
 
clase SpecialText {  / / clase para todos los vectores y los subíndices de lujo
  int tsize;
 
  SpecialText ( int tsize) {
    este . tsize = tsize;
  }
 
  void createBullet ( Cadena escrito, float x, float y) {
    llenar (0);
    elipse (x, y, 6, 6);
    texto (escritura, x + 11, y + 5);
  }
 
  void createSubscript ( Cadena bigLetter, Cadena subíndice, float x, float y) {
    texto (bigLetter, x, y);
    flotar sw = textWidth (bigLetter);
    textFont ( CreateFont ( "Palatino Linotype cursiva" , tsize - 5));
    texto (subíndice, x + sw, y + 5);
    textFont ( CreateFont ( "Palatino Linotype" , tsize));
  }
 
  void createDivision ( cuerda superior, cuerda inferior, float x, float y) {
    textAlign ( CENTRO );
    texto (arriba, x, y - tsize);
    texto (abajo, x, y + tsize);
    flotar topWidth = textWidth (arriba);
    flotar bottomWidth = textWidth (abajo);
    si (topWidth> = bottomWidth) {
      accidente cerebrovascular (0);
      line (x - topWidth / 2, y - 5, x + topWidth / 2, y - 5);
      noStroke ();
    } más {
      accidente cerebrovascular (0);
      line (x - bottomWidth / 2, y - 5, x + bottomWidth / 2, y - 5);
      noStroke ();
    }
    textAlign ( IZQUIERDA );
  }
 
  void createVector ( Cadena vec, float x, float y) {
    texto (VEC, x, y);
    flotar vecWidth = textWidth (vec);
    accidente cerebrovascular (0);
    line (x, y - tsize + 2, x + vecWidth, y - tsize + 2);
    line (x + vecWidth, y - tsize + 2, x + vecWidth - 2, y - tsize);
    noStroke ();
  }
   
  void createVectorWithSubscript ( Cadena vec, Cadena subíndice, float x, float y) {
    texto (VEC, x, y);
    flotar vecWidth = textWidth (vec);
    line (x, y - tsize + 2, x + vecWidth, y - tsize + 2);
    line (x + vecWidth, y - tsize + 2, x + vecWidth - 2, y - tsize);
    noStroke ();
    textFont ( CreateFont ( "Palatino Linotype cursiva" , tsize - 5));
    texto (subíndice, x + vecWidth, y + 5);
    textFont ( CreateFont ( "Palatino Linotype" , tsize));
  }
}
 
 
clase ShowSystem {
  int col = 30;
  int fila = 30;
  Partículas [] [] p = nueva partícula [col] [fila];
 
  int timer = 0;  / / variables para determinar el estado del sistema
  flotar avgKE;
  flotar avgPressure;
  flotar avgVelocity;
  flotar initialAvgKE;
  flotar initialMass;
  flotar lidHeight;
  flotar lidLength = 260;
  flotar R;
  float temp;
  flotar totalVelocity = 0;
  flotar velocityMag;
  flotar volumen;
 
  SpecialText t;
 
  ShowSystem () {
    t = nueva SpecialText (14);
    para ( int i = 0; i <col; i + +) {
      para ( int j = 0; j <row; j + +) {
        p [i] [j] = nueva partícula ( random (130, 360), al azar (220, 580));
        .. totalVelocity + = p [i] [j] velocidad mag ();
      }
    }
    avgVelocity = totalVelocity / (col * fila);
    initialMass = (p [0] [0] r * p [0] [0] r *.. PI );
    avgKE = 0.5 * initialMass * avgVelocity * avgVelocity;  / / KE = 1/2 mv ^ 2
    initialAvgKE = avgKE;
  }
 
  void display () {
    flotar totalParticleMomentum = 0;
    flotar lidPos = p [0] [0] displayOtherFeatures (totalParticleMomentum).;
    velocityMag = p [0] [0] velocitySlider ().;
    R = p [0] [0] rSlider ().;
    totalVelocity = 0;
    para ( int i = 0; i <col; i + +) {
      para ( int j = 0; j <row; j + +) {
        totalParticleMomentum + = p [i] [j] de la pantalla (lidPos, velocityMag, r).;
        .. totalVelocity + = p [i] [j] velocidad mag ();
      }
    }
    lidPos = p [0] [0] displayOtherFeatures (totalParticleMomentum).;
    avgVelocity = totalVelocity / (col * fila);
    tiempo + +;
    si (temporizador> 50) {
      / / Presión = (masa * velocidad ^ 2) / volumen * (numberOfParticles / 2)
      avgPressure = ((r * r * PI * avgVelocity * avgVelocity) / volumen) * ((fila col *) / 2);
      lidHeight = 580 - lidPos;
      volumen = lidLength * lidHeight;
      / / Temperatura = PV / nR
      temp = (volumen avgPressure *) / (fila col * * 8,31);
      avgKE = (R * R * PI * avgVelocity * avgVelocity) / 2;
      timer = 0;
    }
 
    llenar (200, 206, 250);
    noStroke ();
    Rect (560, 560, 55, 35, 10);
    llenar (0);
    t.createSubscript ( "P" , "i" , 440, 200);
    t.createSubscript ( "V" , "i" , 452, 200);
    t.createSubscript ( "P" , "f" , 480, 200);
    t.createSubscript ( "V" , "f" , 495, 200);
    texto ( "== nRT" , 440, 200);
    flotar prettyPressure = int (avgPressure * 100) / 100;
    texto ( "P =" + prettyPressure, 440, 230);
    texto ( "V =" + int (volumen), 440, 260);
    texto ( "n = 900" , 440, 290);
    texto ( "R = 8,31 (arbitraria)" , 440, 320);
    flotar prettyTemp = int (temp * 100) / 100;
    texto ( "T =" + prettyTemp, 440, 350);
    flotar prettyPV = int (avgPressure * Volumen * 100) / 100;
    texto ( "PV =" + prettyPV, 440, 380);
    texto ( "U interior de la energía = 3/2 PV =" + int ((3/2) * avgPressure * volumen), 440, 410);
    texto ( "media KE = 1/2 mv ^ 2 =" + int (avgKE), 440, 440);
    texto (velocityMag, 510, 80);
    texto (r * r * PI , 510, 120);
    texto ( "Volver" , 558 + textWidth ( "Atrás" ) / 2, 582);
    accidente cerebrovascular (0);
    línea (90, 200, 100, 200);
    línea (90, 510, 100, 510);
    noStroke ();
    texto ( "max" , 55, 204);
    texto ( "min" , 55, 514);
 
    si ( mouseX > = 560 && mouseX <= 615 && mouseY > = 560 && mouseY <= 595 && mousePressed ) {  / botón / BACK
      ms.scrn = 999;
    }
  }
}
 
clase de partículas {
  flotar rscale = 632.727;
  flotar R;
  flotar velocityScale = 592.94118;
  flotar velocityMag;
  PVector velocidad = nueva PVector (0, 0);
  flotar initialVx;
  flotar initialVy;
  PVector posición = nueva PVector (0, 0);
 
  flotar lidMassScale = 580;
  flotar lidMass = 1,000;
  flotar gravedad = 0,07;
  flotar lidForce;
  flotar lidAccel;
  flotar lidVelocity;
  flotar lidPos = 220;
  flotar lidMomentum;
 
  Partículas ( float x, float y) {
    velocity.x = aleatorio (-5, 5);
    initialVx = velocity.x;
    velocity.y = aleatorio (-5, 5);
    initialVy = velocity.y;
    position.x = x;
    position.y = y;
  }
 
  flotar visualización ( flotar lidTop, flotar VMAG, flotar r) {
    velocity.x = initialVx * VMAG;
    velocity.y = initialVy * VMAG;
    este . r = r;
    flotar particleMomentum = 0;
    llenar (0);
    elipse (position.x, position.y, r, r);
    . posición de añadir (velocidad);
    si (position.xr <120) {
      position.x = r 120;
      velocity.x * = -1;
      initialVx * = -1;
    }
    si (position.x + r> 380) {
      position.x = 380-R;
      velocity.x * = -1;
      initialVx * = -1;
    }
    si (position.yr <lidTop-20) {
      position.y = r + lidTop-20;
      particleMomentum = ( PI * r * r) * velocity.y;
      velocity.y * = -1;
      initialVy * = -1;
    }
    si (position.y + R> 580) {
      position.y = 580-r;
      velocity.y * = -1;
      initialVy * = -1;
    }
    volver particleMomentum;
  }
  flotar displayOtherFeatures ( flotar totalParticleMomentum) {
    lidForce = lidMass * grav;
    lidAccel = lidForce / lidMass;
    lidVelocity + = lidAccel;
    lidMomentum = lidVelocity * lidMass;
    lidMomentum + = totalParticleMomentum;
    lidVelocity = lidMomentum / lidMass;
    lidPos + = lidVelocity;
    si (lidPos <220) {
      lidPos = 220;
      lidVelocity = 0;
    }
    si (lidPos> 530) {
      lidPos = 530;
      lidVelocity = 0;
    }
    llenar (0);
    Rect (100, 200, 20, 400);
    Rect (100, 580, 300, 20);
    Rect (380, 200, 20, 400);
    beginShape ();
    vértice (120, lidPos-20);
    vértice (380, lidPos-20);
    vértice (350, lidPos-50);
    vértice (150, lidPos-50);
    vértice (120, lidPos-20);
    endShape ();
    elipse (250, lidPos-70, 50, 50);
    llenar (255);
    elipse (250, lidPos-70, 30, 30);
 
    lidMassScale = slider (lidMassScale, 600, 40, "Tapa Misa" );
    / / Esto sigue el formato: lowerBound + ((whateverScale + 40 - x) / 80) * (upperBound - lowerBound);
    lidMass = 1000 + ((lidMassScale + 40-600) / 80) * (2000-1000);
    accidente cerebrovascular (0);
    llenar (0);
    TEXTSIZE (14);
    texto ( int (lidMass), 515, 40);
 
    volver lidPos;
  }
 
  flotar velocitySlider () {
    velocityScale = slider (velocityScale, 600, 80, "Velocity escalar" );
    velocityMag = 0,3 + ((velocityScale + 40-600) / 80) * (2-0,3);
    accidente cerebrovascular (0);
    volver velocityMag;
  }
  flotar rSlider () {
    rscale = slider (rscale, 600, 120, "partícula de masa" );
    R = 0,3 + ((rscale + 40-600) / 80) * (2,5 a 0,3);
    accidente cerebrovascular (0);
    volver r;
  }
 
  flotar slider ( float a, float x, float y, Cadena de título) {  / / crea escalas móviles, donde 'a' es la ubicación de la corredera
    accidente cerebrovascular (0);
    línea (x - 40, y, x + 40, y);
    line (x - 40, y - 5, x - 40, y + 5);
    line (x + 40, y - 5, x + 40, y + 5);
    noStroke ();
    llenar (0);
    TEXTSIZE (12);
    textAlign ( CENTRO );
    texto (título, x, y - 10);
    textAlign ( IZQUIERDA );
    si ( mouseX > = x - 40 && mouseX <= x + 40 && mouseY > = y - 5 && mouseY <= y + 5 && mousePressed ) {
      A = mouseX ;
      si (a <x - 40) {
        a = x - 40;
      }
      si (a> x + 40) {
        a = x + 40;
      }
    }
    llenar (150, 150, 150);
    elipse (un, y + 1, 10, 10);
    volver a;
  }
}

