
int x = 20; //posicion X del invader 1 y 2.
int x2 = x-70;//posicion X del invader 3 y 4.
int x3 = x2+160;//posicion X del invader 5 y 6.
int x4 = x3+160;//posicion X del invader 7, 8.
int x5 = x4+160;//posicion x del invader 9 y 10.
int x6 = x5+160;//posicion X del invader 11, 12.
int y = 60;//posicion X del invader 1, 3, 5, 7, 9.
int y2 = y+70;//posicion Y del invader 2, 4, 6, 8, 10.
 
int speed = 10; //numero de saltos que se realiza en cada iteracion.
int FPS = 8;//frameRate de movReplay.
 
//color tecla arriba.
int keyUpColor1 = 158;
int keyUpColor2 = 93;
int keyUpColor3 = 94;
 
//color tecla abajo.
int keyDownColor1 = 158;
int keyDownColor2 = 93;
int keyDownColor3 = 94;
 
//color boton play.
int playButtonColor1 = 27;
int playButtonColor2 = 27;
int playButtonColor3 = 27;
 
boolean showSpeed = true;//mostrar la velocidad y las teclas para aumentar y decrementar la velocidad de los invaders.
boolean showMoveInvaders = true;//activar el movimiento los invaders hasta llegar al final de la pantalla.
boolean showInvaders = true;//mostrar a los invaders.
boolean showGameOver = true;//mostrar pantalla GAMEOVER.
boolean showMainDisplay = true;//mostrar la pantalla principal.
 
void setup() {
  size(750, 600);
  smooth();
}
 
void draw() {
  println(mouseX+", "+mouseY);
  background(27, 27, 27); 
  mainDisplay();//pantalla principal que se mostrara al iniciar este programa.
  moveInvaders();//mueve los invaders hasta llegar al final de la pantalla y muestra GAMEOVER.
  invaders();//muestra a los invaders en sus posiciones correspondientes. 
  speedControl();//muestra el las flechas para acelerar o decelerar a los invaders.
  //moveTest();
}
 
void mainDisplay() {
  if (showMainDisplay) {
    speedControl();//llamamos al metodo para mostrar la velocidad y las teclas para aumentar y decrementar la velocidad de los invaders. 
    //Titulo mainDisplay.
    stroke(random(0,20));
    fill(random(1,27), random(1,27), random(1,27), 50);
    rect(120, 70, 390, 70, 100);
    textSize(39.4);
    fill(255);   
    text("SPACE INVADERS", random(150,156), 120);//titulo en blanco
    fill(0);
    textSize(40);
    text("SPACE INVADERS", random(145,151), 120);//titulo en negro
     
    /* Alternativa para iniciar a los invaders.
    //Boton play.
    strokeWeight(3);
    stroke(0);
    noSmooth();
    fill(142, 142, 142);
    ellipse(490, 320, 50, 50);//borde del boton play.
    fill(237, 227, 116);
    strokeWeight(2);
    smooth();
    triangle(500, 320, 485, 330, 485, 310);//triangulo play
    */
     
    showMoveInvaders = false;//desactivar el movimiento de los invaders.
    showInvaders = false;//no mostrar los invaders.
         
    //Boton para iniciar.
    stroke(255,255,255,30);
    fill(142, 142, 142, 40);
    rect(90, 455, 32, 40, 8);
    noStroke();
    fill(158, 93, 94);
    triangle(115, 475, 100, 460, 100, 490);//flecha UP, mas velocidad. 
     
    if(keyPressed && key == CODED){
      if (keyCode == RIGHT) {
        showSpeed = true;//mostrar la velocidad y las teclas para aumentar y decrementar la velocidad de los invaders.
        showMainDisplay = false;//no mostrar mainDisplay.
        showMoveInvaders = true;//activar el movimiento de los invaders.
        showInvaders = true;//mostrar los invaders.
        showGameOver = true;//mostrar la pantalla gameOver.
      }
    }
     
    //Atajos de teclas.
    fill(178, 171, 176);  
    textSize(14);
    text("up arrow: faster", 175, 560);
    text("down arrow: slower", 175, 575);
    text("right arrow: START INVADERS", 175, 590);
     
    //CC Alex.
    fill(158, 93, 94);
    textSize(16);
    text("Created by:", 530, 580);
    fill(104, 175, 226);
    text("Àlex Martínez", 630, 580);
  }
}
 
void moveInvaders() {
  if (showMoveInvaders) {
    for (int i=0; i<6; i++) {
      frameRate(FPS);//velocidad en frames que será aumentada o decrementada con las teclas.
      //println(i);//valor de i, para hacer tests    .
      /* Se desplazan los ejes x-x4 para que los invaders se muevan hacia la derecha.
       */
      x = x+speed;
      x2 = x+speed;
      x3 = x+speed;
      x4 = x+(speed*14);//separacion entre los invaders al moverse
      x5 = x+(speed*23);//separacion entre los invaders al moverse
      x6 = x+(speed*32);//separacion entre los invaders al moverse
      while (x > width) {
        /*Cada vez que los invaders sobrepasen la anchura de la pantalla (derecha), los valores de x, x2 se resetearan a -40 para que empiecen
         desde el principio y los valores de y, y2 para que vayan bajando cuando pasen de la pantalla.
         */
        x = -40;
        x2 = -40;
        x3 = -40;
        x4 = -40;
        x5 = -40;
        x6 = -40;
        y = y+30;
        y2 = y2+30;
      }
      /*
        if (x > width) {
         //Mismo efecto que el while de arriba. Incompleto, creado para probar alternativas.
          x = -40;
          //x2 = -40;
          y = y+30;
          y2 = y2+30;
        }
      */
    }
    //println(y);//mostrar valor de y para hacer tests.
  }
  if (y > 480 && showGameOver) {
    //Cuando los invaders llegan a y=480, han ganado y muestra el mensaje GAME OVER.
    background(0);
    fill(random(255), 0, 0);
    textSize(80);
    text("GAME OVER", 135, 300);
    //damos valor fijo a los invaders para que no sigan bajando y no consumir mas recursos del sistema.
    x = width;
    x2 = width;
    y = height +100;
    y2 = height +100;
    //no mostramos la velocidad por pantalla, ya que los invaders han llegado al final y el juego ha acabado.
    showSpeed = false;
    showMoveInvaders = false;
    showGameOver = true;
     
    //Boton para volver a mainDisplay.
    fill(255, 0, 0);
    rect(560, 530, 50, 20);
    triangle(630, 540, 600, 520, 600, 560);
     
    if (mousePressed && mouseX > 559 && mouseX < 631 && mouseY > 520 && mouseY < 561) {   
      /*Al pulsar sobre la flecha dibujada dentro de gameOver, volveremos a mainDisplay y quitamos de la pantalla los invaders,
        los movimientos y la pantalla gameOver.
      */
      showMainDisplay = true;//mostrar mainDisplay.
      showSpeed = true;//mostrar la velocidad y las teclas para aumentar y decrementar la velocidad de los invaders.
      showMoveInvaders = false;//desactivar movimiento de los invaders.
      showInvaders = false;//no mostrar los invaders.
      showGameOver = false;//no mostrar la pantalla gameOver.
      FPS = 8;//reiniciamos la velocidad a la que se habia asignado por defecto.
       
      //Una vez salimos hacia mainDisplay, asignamos el valor predeterminado que tenian los invaders.
      x = 20; //posicion X del invader 1 y 2.
      x2 = x-70;//posicion X del invader 3 y 4.
      x3 = x2+160;//posicion X del invader 5 y 6.
      x4 = x3+160;//posicion X del invader 7, 8.
      x5 = x4+160;//posicion X del invader 9, 10.
      x6 = x5+160;//posicion X del invader 11, 12.
      y = 60;//posicion X del invader 1, 3, 5, 7.
      y2 = y+70;//posicion Y del invader 2, 4, 6, 8.
    }
  } 
}
 
void moveTest() { 
  //Incompleto. Este metodo ha sido muy util para determinar como se realiza el movimiento de un objeto.
  if (x < 199) {
    x = x+speed;
    //x2 = x2+speed;
  } else {
    x = 30;
    //x2 = 80;
  }
}
 
void invaders() { 
  /* Creacion de los invaders, que se muestran por pantalla en base a las variables "x" e "y". A medida que se crea otro invader
   se modifican los valores siempre en base a la variable "x" o "y", de este modo se mueven de forma simultanea.
   */
  if (showInvaders) {
    fill(255, 255, 1);//color de los invaders
    noStroke();
   
    //INVADER 1
    rect(x, y, 10, 10);
    rect(x+10, y-10, 40, 10);
    rect(x+50, y, 10, 10);
    rect(x-10, y+10, 20, 10);
    rect(x+50, y+10, 20, 10);
    rect(x, y+20, 10, 20);
    rect(x+50, y+20, 10, 20);
    rect(x+25, y+20, 10, 10);
    rect(x+10, y+20, 15, 5);
    rect(x+35, y+20, 15, 5);
   
    //INVADER 2
    rect(x, y2, 10, 10);
    rect(x+10, y2-10, 40, 10);
    rect(x+50, y2, 10, 10);
    rect(x-10, y2+10, 20, 10);
    rect(x+50, y2+10, 20, 10);
    rect(x, y2+20, 10, 20);
    rect(x+50, y2+20, 10, 20);
    rect(x+25, y2+20, 10, 10);
    rect(x+10, y2+20, 15, 5);
    rect(x+35, y2+20, 15, 5);
   
    //INVADER 3
    rect(x2+80, y, 10, 10);
    rect(x2+90, y-10, 40, 10);
    rect(x2+130, y, 10, 10);
    rect(x2+70, y+10, 20, 10);
    rect(x2+130, y+10, 20, 10);
    rect(x2+80, y+20, 10, 20);
    rect(x2+130, y+20, 10, 20);
    rect(x2+105, y+20, 10, 10);
    rect(x2+90, y+20, 15, 5);
    rect(x2+115, y+20, 15, 5);
   
    //INVADER 4
    rect(x2+80, y2, 10, 10);
    rect(x2+90, y2-10, 40, 10);
    rect(x2+130, y2, 10, 10);
    rect(x2+70, y2+10, 20, 10);
    rect(x2+130, y2+10, 20, 10);
    rect(x2+80, y2+20, 10, 20);
    rect(x2+130, y2+20, 10, 20);
    rect(x2+105, y2+20, 10, 10);
    rect(x2+90, y2+20, 15, 5);
    rect(x2+115, y2+20, 15, 5);
   
    //INVADER 5
    rect(x3+170, y, 10, 10);
    rect(x3+180, y-10, 40, 10);
    rect(x3+220, y, 10, 10);
    rect(x3+160, y+10, 20, 10);
    rect(x3+220, y+10, 20, 10);
    rect(x3+170, y+20, 10, 20);
    rect(x3+220, y+20, 10, 20);
    rect(x3+195, y+20, 10, 10);
    rect(x3+180, y+20, 15, 5);
    rect(x3+205, y+20, 15, 5);
   
    //INVADER 6
    rect(x3+170, y2, 10, 10);
    rect(x3+180, y2-10, 40, 10);
    rect(x3+220, y2, 10, 10);
    rect(x3+160, y2+10, 20, 10);
    rect(x3+220, y2+10, 20, 10);
    rect(x3+170, y2+20, 10, 20);
    rect(x3+220, y2+20, 10, 20);
    rect(x3+195, y2+20, 10, 10);
    rect(x3+180, y2+20, 15, 5);
    rect(x3+205, y2+20, 15, 5);
   
    //INVADER 7
    rect(x4+170, y, 10, 10);
    rect(x4+180, y-10, 40, 10);
    rect(x4+220, y, 10, 10);
    rect(x4+160, y+10, 20, 10);
    rect(x4+220, y+10, 20, 10);
    rect(x4+170, y+20, 10, 20);
    rect(x4+220, y+20, 10, 20);
    rect(x4+195, y+20, 10, 10);
    rect(x4+180, y+20, 15, 5);
    rect(x4+205, y+20, 15, 5);
   
    //INVADER 8
    rect(x4+170, y2, 10, 10);
    rect(x4+180, y2-10, 40, 10);
    rect(x4+220, y2, 10, 10);
    rect(x4+160, y2+10, 20, 10);
    rect(x4+220, y2+10, 20, 10);
    rect(x4+170, y2+20, 10, 20);
    rect(x4+220, y2+20, 10, 20);
    rect(x4+195, y2+20, 10, 10);
    rect(x4+180, y2+20, 15, 5);
    rect(x4+205, y2+20, 15, 5);
    
    //INVADER 9
    rect(x5+170, y, 10, 10);
    rect(x5+180, y-10, 40, 10);
    rect(x5+220, y, 10, 10);
    rect(x5+160, y+10, 20, 10);
    rect(x5+220, y+10, 20, 10);
    rect(x5+170, y+20, 10, 20);
    rect(x5+220, y+20, 10, 20);
    rect(x5+195, y+20, 10, 10);
    rect(x5+180, y+20, 15, 5);
    rect(x5+205, y+20, 15, 5);
        
    //INVADER 10
    rect(x5+170, y2, 10, 10);
    rect(x5+180, y2-10, 40, 10);
    rect(x5+220, y2, 10, 10);
    rect(x5+160, y2+10, 20, 10);
    rect(x5+220, y2+10, 20, 10);
    rect(x5+170, y2+20, 10, 20);
    rect(x5+220, y2+20, 10, 20);
    rect(x5+195, y2+20, 10, 10);
    rect(x5+180, y2+20, 15, 5);
    rect(x5+205, y2+20, 15, 5);
    
    //INVADER 9
    rect(x6+170, y, 10, 10);
    rect(x6+180, y-10, 40, 10);
    rect(x6+220, y, 10, 10);
    rect(x6+160, y+10, 20, 10);
    rect(x6+220, y+10, 20, 10);
    rect(x6+170, y+20, 10, 20);
    rect(x6+220, y+20, 10, 20);
    rect(x6+195, y+20, 10, 10);
    rect(x6+180, y+20, 15, 5);
    rect(x6+205, y+20, 15, 5);
        
    //INVADER 10
    rect(x6+170, y2, 10, 10);
    rect(x6+180, y2-10, 40, 10);
    rect(x6+220, y2, 10, 10);
    rect(x6+160, y2+10, 20, 10);
    rect(x6+220, y2+10, 20, 10);
    rect(x6+170, y2+20, 10, 20);
    rect(x6+220, y2+20, 10, 20);
    rect(x6+195, y2+20, 10, 10);
    rect(x6+180, y2+20, 15, 5);
    rect(x6+205, y2+20, 15, 5);
  }
  /* CORE INVADER. Todos los invaders han sido creados en base a este invader, el original, el grande.
   rect(20, 50, 40, 10);
   rect(30, 50, 40, 10);
   rect(70, 60, 10, 10);
   rect(10, 70, 20, 10);
   rect(70, 70, 20, 10);
   rect(20, 80, 10, 20);
   rect(70, 80, 10, 20);
   rect(45, 80, 10, 10);
   rect(30, 80, 15, 5);
   rect(55, 80, 15, 5);
   */
   /* RANDOM INVADER. Invader con efecto "shaken".
   rect(random(20,25), 60, 10, 10);
   rect(random(30,35), 50, 40, 10);
   rect(random(70,75), 60, 10, 10);
   rect(random(10,15), 70, 20, 10);
   rect(random(70,75), 70, 20, 10);
   rect(random(20,25), 80, 10, 20);
   rect(random(70,75), 80, 10, 20);
   rect(random(45,50), 80, 10, 10);
   rect(random(30,35), 80, 15, 5);
   rect(random(55,60), 80, 15, 5);
   */
}
 
void speedControl() { 
  //Mostrar las flechas de subir y bajar velocidad de los invaders.
  //Si la condicion showSpeed no se cumple, entonces no se mostrara la velocidad (cuando sale GAME OVER, showSpeed no se muestra). 
  if (showSpeed) {
    //Flechas para incrementar y decrementar velocidad.
    noStroke();
    fill(keyUpColor1, keyUpColor2, keyUpColor3);//colores tecla UP.
    triangle(50, 450, 65, 470, 35, 470);//flecha UP, mas velocidad. 
    fill(keyDownColor1, keyDownColor2, keyDownColor3);//colores tecla DOWN.
    triangle(50, 500, 65, 480, 35, 480);//flecha DOWN, menos velocidad.
    /* Opcion para pausar, que no funciono del todo y lo deje de lado
    //Simbolo pausa para pausar la velocidad.
    fill(keySpaceColor1, keySpaceColor2, keySpaceColor3);
    rect(85, 457, 8, 35);
    rect(100, 457, 8, 35);
    */
    //Mostrar la velocidad en FPS actual.
    fill(255);
    textSize(20);
    text("Speed: "+FPS, 65, 550);//mostrar el valor de FPS por pantalla, equivalente a la velocidad de los invaders.
  }
}
 
void keyPressed() {
  /* Si se pulsa la flecha de arriba, incrementa los frameRate en 1, hasta 35.
   Si se pulsa la flecha de abajo, decrementa los frameRate en 1.
   Si la condicion showSpeed no se cumple, no se ejecutara este metodo.
   */
  if (showSpeed) {
    if (key == CODED && keyPressed) {
      if (keyCode == UP && FPS <= 34) {
        FPS = FPS+1;
        //flecha UP, mas velocidad.
        keyUpColor1 = 152;
        keyUpColor2 = 55;
        keyUpColor3 = 57;
        //devolvemos el valor que tenia la tecla DOWN.
        keyDownColor1 = 158;
        keyDownColor2 = 93;
        keyDownColor3 = 94;
      } else if (keyCode == DOWN && FPS >= 2) {
        FPS = FPS-1;
        //flecha DOWN, menos velocidad.
        keyDownColor1 = 152;
        keyDownColor2 = 55;
        keyDownColor3 = 57;
        //devolvemos el valor que tenia la tecla UP.
        keyUpColor1 = 158;
        keyUpColor2 = 93;
        keyUpColor3 = 94;
      }
      //println(FPS);muestra el valor de FPS por pantalla para comprobar los limites.
    }
  }   
}

