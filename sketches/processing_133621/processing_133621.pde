
/**********************************************************
**                    MISIÓN IMPOSIBLE                    **
**      Videojuego creado por Andrea Torres Íñiguez       **
**                                                        **
**********************************************************/

// Libreria para leer y crear el archivo ranking
import java.io.*;
File archivo = null;
FileReader fr = null;
BufferedReader br = null;

// Enemigos
EnemigoVerde enemigoverde1;
EnemigoVerde enemigoverde2;
EnemigoVerde enemigoverde3;
EnemigoRojo enemigorojo1;
EnemigoRojo enemigorojo2;
EnemigoRojo enemigorojo3;
EnemigoRojo enemigorojo4;
EnemigoRojo enemigorojo5;  
Trampa cuadrados1;
Trampa cuadrados2;
Trampa cuadrados3;
Trampa cuadrados4;
EnemigoAzul1 enemigoverticalazul1;
EnemigoAzul1 enemigoverticalazul2;
EnemigoAzul2 enemigohorizontalazul1;
EnemigoAzul2 enemigohorizontalazul2;
Fuego fuego1;
Fuego fuego2;
Fuego fuego3;
Fuego fuego4;
FuegoHorizontal fuegoh1;
FuegoHorizontal fuegoh2;
FuegoHorizontal fuegoh3;
Snake snake1;
Snake snake2;
Snake snake3;
Supersnake supersnakeboss;

// Personaje
Link personaje;

// Imagenes
PImage link;
PImage linkarriba;
PImage linkabajo;
PImage linkizquierda;
PImage hyrule;
PImage soldadoverde;
PImage soldadorojo2;
PImage soldadorojo2_derecha;
PImage vida;
PImage soldadoazul1;
PImage soldadoazul2;
PImage soldadoazul2_izquierda;
PImage ganaste;
PImage perdiste;
PImage casi;
PImage fuego;
PImage snake;
PImage snake_derecha;
PImage supersnakepaint;
PImage dungeon;
PImage dungeon1;
PImage dungeon2;
PImage cave;
PImage menup;
PImage menuins;
PImage menudificultad;

// Musica jugar
import ddf.minim.*;
Minim minim;
AudioPlayer themesong;
public boolean musica = false;

// Musica muerte
Minim minim1;
AudioPlayer muerte;

// Vidas
Vidas vidas;

// Array de movimiententos personaje
boolean keysPressed [];
final int ARRIBA = 0;
final int IZQUIERDA = 1;
final int DERECHA = 2;
final int ABAJO = 3;
final int SPEED = 2;

// Posicion personaje
public int posX;
public int posY;

// Array de booleanos del menu
boolean MenuKeysPressed [];
final int JUGAR = 0;
final int INSTRUCCIONES = 1;
final int DIFICULTAD = 2;
final int INTENTAR = 3;

// Condicion booleana de completar el juego
public boolean ganar = false;

// Cronometro
int centesimas = 0;
int centesimasMax = 100;
int segundos = 0;
int segundosMax = 60;
int minutos = 0;
int plus = 1;

// Condicion booleana del cronometro
boolean tiempo = false;

// Ranking
PrintWriter output;

// Dificultad
boolean easy = true;
boolean hard = false;
boolean good_luck = false;
PFont fuente, fuente2;



void setup() {
  // Tamaño de la pantalla
  size (1400, 800);

  // Background y menu 
  hyrule=loadImage("Hyrule_Temple.png");
  hyrule.resize(width, height);
  menup = loadImage("menu_principal.png");
  menup.resize(width, height);
  menuins = loadImage("instrucciones.png");
  menuins.resize(width, height);
  menudificultad = loadImage("dificultad.png");
  menudificultad.resize(width, height);
  fuente = createFont("Consolas", 16, true);
  fuente2 = createFont("Courier", 16, true);
  background (255);

  // Load Images
  link = loadImage("link.png");
  linkarriba = loadImage("linkarriba.png");
  linkabajo = loadImage("linkabajo.png");
  linkizquierda = loadImage("linkizquierda.png");
  soldadoverde = loadImage("soldadoverde.png");
  soldadorojo2 = loadImage("soldadorojo2.png");
  soldadorojo2_derecha = loadImage("soldadorojo2_derecha.png");
  soldadoazul1 = loadImage("soldadoazul1.png");
  soldadoazul2 = loadImage("soldadoazul2.png"); 
  soldadoazul2_izquierda = loadImage("soldadoazul2_izquierda.png");    
  vida = loadImage("vida.png");
  vida.resize(40, 40);
  ganaste = loadImage("ganaste.png");
  ganaste.resize(width, height);
  perdiste = loadImage("perdiste.png");
  perdiste.resize(width, height);    
  fuego = loadImage("fuego.png");
  snake = loadImage("snake.png");
  snake.resize(20, 20);
  snake_derecha = loadImage("snake_derecha.png");
  snake_derecha.resize(20, 20);
  dungeon = loadImage("dungeon.png");
  dungeon.resize(180, 180);
  dungeon1 = loadImage("dungeon.png");
  dungeon1.resize(240, 200);
  dungeon2 = loadImage("dungeon.png");
  dungeon2.resize(200, 180);
  cave = loadImage("cave.png");
  cave.resize(250, 350);
  supersnakepaint = loadImage("supersnake.png");
  supersnakepaint.resize(895,85);

  // Enemigos Zona 1
  enemigoverde1 = new EnemigoVerde(190, 410);
  enemigoverde2 = new EnemigoVerde(230, 550);
  enemigoverde3 = new EnemigoVerde(270, 410);

  // Enemigos Zona 2
  cuadrados1=new Trampa(400, 580, 0);
  cuadrados2=new Trampa(455, 580, 159);
  cuadrados3=new Trampa(505, 580, 0);
  cuadrados4=new Trampa(555, 580, 159);  

  // Enemigos Zona 3
  enemigorojo1 = new EnemigoRojo(760, 130);
  enemigorojo2 = new EnemigoRojo(760, 190);
  enemigorojo3 = new EnemigoRojo(760, 250);
  enemigorojo4 = new EnemigoRojo(550, 160);
  enemigorojo5 = new EnemigoRojo(550, 220);

  // Enemigos Zona 4
  enemigoverticalazul1 = new EnemigoAzul1(800, 551);
  enemigoverticalazul2 = new EnemigoAzul1(870, 400);
  enemigohorizontalazul1 = new EnemigoAzul2(750, 450);
  enemigohorizontalazul2 = new EnemigoAzul2(915, 520);

  // Enemigos Zona 5
  fuego1 = new Fuego(1110, 160);
  fuego2 = new Fuego(1160, 160);
  fuego3 = new Fuego(1210, 160);
  fuego4 = new Fuego(1260, 160);
  fuegoh1 = new FuegoHorizontal(1330, 200);
  fuegoh2 = new FuegoHorizontal(1330, 300);
  fuegoh3 = new FuegoHorizontal(1330, 400);
  snake1 = new Snake(1330, 150);
  snake2 = new Snake(1330, 250);
  snake3 = new Snake(1330, 350);
  
  // Enemigo Nivel Good Luck!!!
  supersnakeboss = new Supersnake(2000,int(random(60,400)));

  // Personaje
  personaje= new Link(0, height/4+height/22);

  // Vidas
  vidas = new Vidas();

  // Array movimiento del personaje
  keysPressed = new boolean[4];
  for (int i=0; i < keysPressed.length; i++) {
    keysPressed[i] = false;
  }
  
  // Array menu
    MenuKeysPressed = new boolean[4];
  for (int i=0; i < MenuKeysPressed.length; i++) {
    MenuKeysPressed[i] = false;
  }
  
  // Musica de fondo
  if(musica == false){ // Para que no se repita la cancion cuando se elija la opcion intentar
    musica = true;
    minim = new Minim(this);
    themesong = minim.loadFile("zelda_theme.mp3");
    themesong.play();
    themesong.loop();
  } 
} // Fin de setup

void draw() {
  // Menú principal
  if (MenuKeysPressed[JUGAR] == false) {
    // Menú principal tras reiniciar la partida
    if (MenuKeysPressed[INTENTAR] == true) {
      vidas.run();
      setup();
      MenuKeysPressed[JUGAR] = false;
    }
    image(menup, 0, 0);
    fill(255, 255, 255);
    textAlign(LEFT);
    textFont(fuente2, 34);
    text("E. START", 547, 700);
    text("I. INSTRUCCIONES", 547, 735);
    text("L. DIFICULTAD", 547, 770);
    // Instrucciones
    if (MenuKeysPressed[INSTRUCCIONES] == true) {
      image(menuins, 0, 0);
    } // Fin menu de instrucciones
    if (MenuKeysPressed[DIFICULTAD] == true){
      image(menudificultad,0,0);
      textFont(fuente, 66);
      fill(255, 0, 0);
      text("Elija el nivel de dificultad:", 160, 70);
      fill(255, 255, 255);
      textFont(fuente, 46);
      text("1. Easy", 250, 250);
      text("2. Hard", 250, 350);
      text("3. Good Luck!!!", 250, 450);
      text("E. Start", 600, 770);
      if (easy == true && key == '1') {
        fill(60, 242, 37);
        textFont(fuente, 46);
        text("1. Easy", 250, 250);
        elegirDificultad();
        hard = false;
        good_luck = false;
      }
      if (hard == true && key == '2') {
        fill(60, 242, 37);
        textFont(fuente, 46);
        text("2. Hard", 250, 350);
        elegirDificultad();
        easy = false;
        good_luck = false;
      }
      if (good_luck == true && key == '3') {
        textFont(fuente,26);
        fill(255,255,255);
        text("¿Estas seguro?", 260, 480);
        fill(60, 242, 37);
        textFont(fuente, 46);
        text("3. Good Luck!!!", 250, 450);
        elegirDificultad();
        easy = false;
        hard = false;
      }
    } // Fin de menu dificultad
  } // Fin de menu pantalla principal
  
  // Comenzar partida
  if (MenuKeysPressed[JUGAR] == true) {
    image(hyrule, 0, 0);
    MenuKeysPressed[INSTRUCCIONES] = false;

    // Laberinto
    // Entrada
    stroke(0);
    noStroke();
    fill(39, 242, 240);
    rect(0, 220, 60, 60);
    fill(227, 221, 44, 180);
    // Tunel 1
    noStroke();
    rect(60, 20, 60, 260);
    rect(120, 20, 40, 40);
    rect(160, 20, 40, 380);
    stroke(0);
    line(59, 220, 59, 20);
    line(59, 280, 120, 280);
    line(120, 280, 120, 60);
    line(120, 60, 160, 60);
    line(60, 20, 200, 20);
    // Tunel 2
    stroke(0);
    line(160, 60, 160, 500);
    line(200, 20, 200, 500);
    noStroke();
    rect(300, 580, 40, 140);
    rect(340, 680, 60, 40);
    // Tunel 3
    stroke(0);
    line(340, 580, 340, 680);
    line(300, 580, 300, 720);
    line(340, 680, 400, 680);
    line(300, 720, 400, 720);
    noStroke();
    rect(580, 680, 120, 40);
    rect(660, 300, 40, 380);
    // Tunel 4
    stroke(0);
    line(580, 720, 700, 720);
    line(580, 680, 660, 680);
    line(660, 680, 660, 200);
    line(700, 720, 700, 200);
    noStroke();
    rect(780, 200, 220, 40);
    rect(1000, 200, 50, 250);
    rect(950, 450, 100, 50);
    // Tunel 5
    stroke(0);
    line(780, 200, 1050, 200);
    line(780, 240, 1000, 240);
    line(1000, 240, 1000, 450);
    line(1050, 200, 1050, 500);
    line(950, 450, 1000, 450);
    line(950, 500, 1050, 500);
    noStroke();
    rect(750, 500, 50, 250);
    rect(800, 700, 350, 50);
    rect(1150, 500, 50, 250);
    // Tunel 6
    stroke(0);
    line(800, 580, 800, 700);
    line(750, 580, 750, 750);
    line(800, 700, 1150, 700);
    line(750, 750, 1200, 750);
    line(1150, 700, 1150, 500);
    line(1200, 750, 1200, 500);
    rect(1290, 100, 60, 50);
    // Tunel 7
    line(1290, 150, 1290, 100);
    line(1350, 150, 1350, 100);
    // META
    fill(255, 255, 255);
    rect(1290, 40, 60, 60);
    fill(0);
    rect(1290, 40, 15, 15);
    rect(1320, 40, 15, 15);
    rect(1305, 55, 15, 15);
    rect(1335, 55, 15, 15);
    rect(1290, 70, 15, 15);
    rect(1320, 70, 15, 15);
    rect(1305, 85, 15, 15);
    rect(1335, 85, 15, 15);

    // Zona de obstaculos 1
    image(dungeon, 160, 400);
    // Enemigo zona 1
    enemigoverde1.run();
    enemigoverde2.run();
    enemigoverde3.run();

    // Zona de obstaculos 2
    fill(147, 117, 53);
    stroke(0);
    rect(400, 580, 180, 180);
    // Trampa zona 2
    noStroke();
    cuadrados1.run();
    cuadrados2.run();
    cuadrados3.run();
    cuadrados4.run();
    fill(0);
    triangle(400, 580, 415, 610, 430, 580);
    triangle(430, 580, 445, 610, 460, 580);
    triangle(460, 580, 475, 610, 490, 580);
    triangle(490, 580, 505, 610, 520, 580);
    triangle(520, 580, 535, 610, 550, 580);
    triangle(550, 580, 565, 610, 580, 580);

    // Zona de obstaculos 3
    image(dungeon1, 550, 100);
    // Enemigo zona 3
    enemigorojo1.run();
    enemigorojo2.run();
    enemigorojo3.run();
    enemigorojo4.run();
    enemigorojo5.run(); 

    // Zona de obstaculos 4
    image(dungeon2, 750, 400);
    // Enemigo zona 4
    enemigoverticalazul1.run();
    enemigoverticalazul2.run();
    enemigohorizontalazul1.run();
    enemigohorizontalazul2.run();

    // Zona de obstaculos 5
    image(cave, 1100, 150);
    // Enemigos zona 5
    fuego1.run();
    fuego2.run();
    fuego3.run();
    fuego4.run();
    fuegoh1.run();
    fuegoh2.run();
    fuegoh3.run();
    snake1.run();
    snake2.run();
    snake3.run();
    // Zona 5: lanzallamas
    fill(0);
    rect(1105, 120, 30, 30);
    rect(1155, 120, 30, 30);
    rect(1205, 120, 30, 30);
    rect(1255, 120, 30, 30);
    rect(1350, 195, 30, 30);
    rect(1350, 295, 30, 30);
    rect(1350, 395, 30, 30);
    
    if(good_luck == true){ // Clase supersnake solo se activa cuando la dificultad good_luck es TRUE
      supersnakeboss.run();
    }

    // Personaje
    personaje.move(keysPressed);
    if (personaje.muerto == true){
      minim1 = new Minim(this);
      muerte = minim.loadFile("OOT_YoungLink_Scream2.wav");
      muerte.play();
    } // Personaje musica de muerte

    // Vidas
    vidas.run();

    // Cronometro
    cronometro();
    
    // GANAR
    if (personaje.posX >= 1290 && personaje.posX <= 1350 && personaje.posY >= 40 && personaje.posY <= 60) {
      ganar = true;
      fill(255, 255, 255);
      rect(0, 0, 100, 100);
      rect(1000, 10, 300, 50);
    }
    if (ganar == true) {
      // Ranking
      output = createWriter("Ranking/Ranking_List.txt");
      
      try{
        // Ranking en fichero
        archivo = new File ("Ranking_List.txt");
        fr = new FileReader (archivo);
        br = new BufferedReader(fr);
        String linea;
        while((linea=br.readLine())!=null)
        System.out.println(linea);
        //output.readLine();
        //println(output.readln());
        }
        catch(Exception e){
        }
        output.println("Minutos: "+ minutos + ", " + "Segundos: " + segundos + ", " + "Centesimas: " + centesimas);
        output.println(" ");
        output.flush();
        output.close();
    } // Fin de bucle GANAR
  } // Fin de bucle JUGAR == TRUE
} // Fin de draw

void elegirDificultad(){
  if (easy == true){
    enemigoverde1.speed = 2;
    enemigoverde2.speed = 2;
    enemigoverde3.speed = 2;
    enemigoverticalazul1.speed = 2;
    enemigoverticalazul2.speed = 2;
    enemigohorizontalazul1.speed = 2;
    enemigohorizontalazul2.speed = 2;
    enemigorojo1.speed = 2;
    enemigorojo2.speed = 2;
    enemigorojo3.speed = 2;
    enemigorojo4.speed = 2;
    enemigorojo5.speed = 2;
    fuego1.speed = int(random(1, 4));
    fuego2.speed = int(random(1, 4));
    fuego3.speed = int(random(1, 4));
    fuego4.speed = int(random(1, 4));
    fuegoh1.speed = int(random(1, 4));
    fuegoh2.speed = int(random(1, 4));
    fuegoh3.speed = int(random(1, 4));
    snake1.speed = int(random(1, 4));
    snake2.speed = int(random(1, 4));
    snake3.speed = int(random(1, 4));
    hard = false;
    good_luck = false;
  }
  if (hard == true){
    enemigoverde1.speed = 3;
    enemigoverde2.speed = 3;
    enemigoverde3.speed = 3;
    enemigoverticalazul1.speed = 3;
    enemigoverticalazul2.speed = 3;
    enemigohorizontalazul1.speed = 3;
    enemigohorizontalazul2.speed = 3;
    enemigorojo1.speed = 3;
    enemigorojo2.speed = 3;
    enemigorojo3.speed = 3;
    enemigorojo4.speed = 3;
    enemigorojo5.speed = 3;
    fuego1.speed = int(random(2, 4));
    fuego2.speed = int(random(2, 4));
    fuego3.speed = int(random(2, 4));
    fuego4.speed = int(random(2, 4));
    fuegoh1.speed = int(random(2, 4));
    fuegoh2.speed = int(random(2, 4));
    fuegoh3.speed = int(random(2, 4));
    snake1.speed = int(random(2, 4));
    snake2.speed = int(random(2, 4));
    snake3.speed = int(random(2, 4));
    easy = false;
    good_luck = false;
  }
  if (good_luck == true){
    enemigoverde1.speed = 3;
    enemigoverde2.speed = 4;
    enemigoverde3.speed = 3;
    enemigoverticalazul1.speed = 3;
    enemigoverticalazul2.speed = 3;
    enemigohorizontalazul1.speed = 3;
    enemigohorizontalazul2.speed = 3;
    enemigorojo1.speed = 3;
    enemigorojo2.speed = 3;
    enemigorojo3.speed = 3;
    enemigorojo4.speed = 3;
    enemigorojo5.speed = 3;
    fuego1.speed = int(random(3, 4));
    fuego2.speed = int(random(3, 4));
    fuego3.speed = int(random(3, 4));
    fuego4.speed = int(random(3, 4));
    fuegoh1.speed = int(random(3, 4));
    fuegoh2.speed = int(random(3, 4));
    fuegoh3.speed = int(random(3, 4));
    snake1.speed = 4;
    snake2.speed = 4;
    snake3.speed = 4;
    easy = false;
    hard = false;
  }
} // Fin de metodo elegir dificultad

void cronometro() {
  centesimas = centesimas + plus;
  if (centesimas == centesimasMax) {
    segundos = segundos + plus;
    centesimas = 0;
    if (segundos == segundosMax) {
      minutos = minutos + plus;
      segundos = 0;
    }
  }
} // Fin de metodo cronometro

void keyPressed() {  
  if (key == 'w') {
    keysPressed[ARRIBA] = true;
  }
  else if (key == 'a')
    keysPressed[IZQUIERDA] = true;
  else if (key == 'd')
    keysPressed[DERECHA] = true;
  else if (key == 's') {
    keysPressed[ABAJO] = true;
  }
  if (key == 'e') {
    MenuKeysPressed[JUGAR] = true;
    tiempo = true;
  }
  if (key == 'i') {
    MenuKeysPressed[INSTRUCCIONES] = true;
  }
  if (key == ' ') {
    MenuKeysPressed[INTENTAR] = true;
    MenuKeysPressed[JUGAR] = false;
    MenuKeysPressed[DIFICULTAD] = false;
  }
  if (key == 'l'){
    MenuKeysPressed[DIFICULTAD] = true;
  }
  if (key == '1'){
    easy = true;
  }
  if (key == '2'){
    hard = true;
  }
  if (key == '3'){
    good_luck = true;
  }
} // Fin de metodo keysPressed

void keyReleased() {    
  if (key == 'w') {
    keysPressed[ARRIBA] = false;
    image(linkarriba, posX, posY);
  }
  else if (key == 'a')
    keysPressed[IZQUIERDA] = false;
  else if (key == 'd')
    keysPressed[DERECHA] = false;
  else if (key == 's') {
    keysPressed[ABAJO] = false;
    image(linkabajo, posX, posY);
  }
  if (key == 'e') {
    MenuKeysPressed[JUGAR] = true;
    tiempo = true;
  }
  if (key == 'i') {
    MenuKeysPressed[INSTRUCCIONES] = true;
  }
  if (key == ' ') {
    MenuKeysPressed[INTENTAR] = true;
    MenuKeysPressed[JUGAR] = false;
    MenuKeysPressed[DIFICULTAD] = false;
  }
  if (key == 'l'){
    MenuKeysPressed[DIFICULTAD] = true;
  }
  if (key == '1'){
    easy = true;
  }
  if (key == '2'){
    hard = true;
  }
  if (key == '3'){
    good_luck = true;
  }
} // Fin de metodo keysReleased

class EnemigoAzul1 {
  // Atributos
  private int x;
  private int y;
  private int speed = 2;
  private boolean arriba=false;
  // Constructor
  EnemigoAzul1(int xpos, int ypos) {
    x=xpos;
    y=ypos;
  }  
  // Metodos
  void run() {
    drawEnemigo();
    move();
    ;
  }
  void move() {
    if (arriba==false) {
      y = y + speed;
      if (y > 551) {
        arriba=true;
      }
    }
    if (arriba==true) {
      y = y - speed;
      if (y<400) {
        arriba=false;
      }
    }
  }
  void drawEnemigo() {
    image(soldadoazul1, x, y);
  }
}

class EnemigoAzul2 {
  // Atributos
  private int x;
  private int y;
  private int speed = 2;
  private boolean botarhorizontal=false;
  // Constructor
  EnemigoAzul2(int xpos, int ypos) {
    x=xpos;
    y=ypos;
  } 
  // Metodos
  void run() {
    drawEnemigo();
    move();
  }
  void move() {
    if (botarhorizontal==false) {
      x = x - speed;
      if (x < 750) {
        botarhorizontal=true;
      }
    }
    if (botarhorizontal==true) {
      x = x + speed;
      if (x > 915) {
        botarhorizontal=false;
      }
    }
  }
  void drawEnemigo() {
    if (botarhorizontal==true) {
      image(soldadoazul2, x, y);
    }
    else {
      image(soldadoazul2_izquierda, x, y);
    }
  }
}

class EnemigoRojo {
  // Atributos
  private int x;
  private int y;
  private int speed = 2;
  private boolean girarderecha=false;
  // Constructor
  EnemigoRojo(int xpos, int ypos) {
    x=xpos;
    y=ypos;
  }  
  // Metodos
  void run() {
    drawEnemigo();
    move();
  }
  void move() {  
    if (girarderecha==false) {
      x = x - speed;
      if (x < 550) {
        girarderecha=true;
      }
    }
    if (girarderecha==true) {
      x = x + speed;
      if (x > 760) {
        girarderecha=false;
      }
    }
  }
  void drawEnemigo() {
    if (girarderecha==true) {
      image(soldadorojo2_derecha, x, y);
    }
    else {
      image(soldadorojo2, x, y);
    }
  }
}

class EnemigoVerde {
  // Atributos
  private int x;
  private int y;
  private int speed = 2;
  private boolean arriba=false;
  // Constructor
  EnemigoVerde(int xpos, int ypos) {
    x=xpos;
    y=ypos;
  }  
  // Metodos
  void run() {
    drawEnemigo();
    move();
  }
  void move() {
    if (arriba==false) {
      y = y + speed;
      if (y >= 550) {
        arriba=true;
      }
    }
    if (arriba==true) {
      y = y - speed;
      if (y < 400) {
        arriba=false;
      }
    }
  }
  void drawEnemigo() {
    image(soldadoverde, x, y);
  }
}

class Fuego {
  // Atributos
  private int x;
  private int y;
  private int speed = int(random(1, 4));
  private boolean repeticion = false;
  // Constructor
  Fuego (int xpos, int ypos) {
    x=xpos;
    y=ypos;
  }  
  // Metodos
  void run() {
    drawEnemigo();
    move();
  }
  void move() {
    if (repeticion == false) {
      y = y + speed;
      if (y > 480) {
        repeticion = true;
      }
    }
    if (repeticion == true) {
      y = 120;
      speed = int(random(1, 3));
      repeticion = false;
    }
  }
  void drawEnemigo() {
    image(fuego, x, y);
  }
}

class FuegoHorizontal {
  // Atributos
  private int x;
  private int y;
  private int speed = int(random(1, 4));
  private boolean repeticion = false;
  // Constructor
  FuegoHorizontal (int xpos, int ypos) {
    x=xpos;
    y=ypos;
  }
  // Metodos
  void run() {
    drawEnemigo();
    move();
  }
  void move() {
    if (repeticion == false) {
      x = x - speed;
      if (x < 1100) {
        repeticion = true;
      }
    }
    if (repeticion == true) {
      x = 1350;
      speed = int(random(1, 2));
      repeticion = false;
    }
  }
  void drawEnemigo() {
    image(fuego, x, y);
  }
}

class Link {
  // Atributos
  private int posX;
  private int posY;
  private boolean salirse = false;
  private boolean muerto = false;
  private int invulnerable = 60;
  private boolean ganar = false;  
  // Constructor
  Link(int x, int y) {
    posX=x;
    posY=y;
  }  
  // Metodos
  void move(boolean[]  keysPressed) {
    if (keysPressed[ARRIBA] == true) {
      posY = posY - SPEED;
      image (linkarriba, posX, posY);
    }
    if (keysPressed[DERECHA] == true) {
      posX = posX + SPEED;
      image (link, posX, posY);
    }
    if (keysPressed[ABAJO] == true) {
      posY = posY + SPEED;  
      image (linkabajo, posX, posY);
    }      
    if (keysPressed[IZQUIERDA] == true) {
      posX = posX - SPEED;
      image (linkizquierda, posX, posY);
    }
    if (keysPressed[ARRIBA] == false && keysPressed[DERECHA] == false && keysPressed[ABAJO] == false && keysPressed[IZQUIERDA] == false) {
      image (link, posX, posY);
    }
    salirse();
    muertoRojo(enemigorojo1);
    muertoRojo(enemigorojo2);
    muertoRojo(enemigorojo3);
    muertoVerde(enemigoverde1);
    muertoVerde(enemigoverde2);
    muertoVerde(enemigoverde3);
    muertoAzul1(enemigoverticalazul1);
    muertoAzul1(enemigoverticalazul2);
    muertoAzul2(enemigohorizontalazul1);
    muertoAzul2(enemigohorizontalazul2);
    muertoTrampa(cuadrados1);
    muertoTrampa(cuadrados2);
    muertoTrampa(cuadrados3);
    muertoFuego(fuego1);
    muertoFuego(fuego2);
    muertoFuego(fuego3);
    muertoFuego(fuego4);
    muertoFuegoH(fuegoh1);
    muertoFuegoH(fuegoh2);
    muertoFuegoH(fuegoh3);
    muertoSnake(snake1);
    muertoSnake(snake2);
    muertoSnake(snake3); 
    muertoSupersnake(supersnakeboss);
    ganar();
  } // Fin de void move
  void salirse() { // Salirse del laberinto
    // Entrada
    if (posX<0 || posX>width) {
      salirse = true;
    }
    if (posX<57 && posY<220) {//salirse en la entrada arriba
      salirse = true;
      if (posY>290) {
        salirse = true;
      }
    }
    if (posX>80 && posY>260) {
      salirse = true;
    }
    //tunel 1
    if (posX>57 && posX<200 && posY<18) {//salirse en tunel 1 izquierda
      salirse = true;
    }
    if (posX>220 && posY>220) {
      salirse = true;
    }
    if (posX>98 && posX<157 && posY>32) {//salirse en tunel 1 derecha
      salirse = true;
      if (posX>157 && posX<180 && posY<300) {
        salirse = false;
      }
    }
    if (posX>178 && posY<370) {//salida tunel 3 derecha
      salirse = true;
    }
    if (posY>250) {
      salirse = true;
      if (posY>250 && posY<550 && posX>157 && posX<180) {//salida tunel 3 y zona 1
        if (posX==174) {
          posX=175;
        }
        salirse = false;
      }
    }
    if (posY>395 && posY<550 && posX>180 && posX<320) {//salirse zona 1
      salirse = false;
    }
    if (posX>=290 && posX<=320) { //salirse tunel 3 salida de la zona 1
      if (posY>=550 && posY<=690) {
        salirse = false;
      }
    }
    if (posY>675 && posY<690 && posX>320 && posX<380) {// salirse tunel 4
      if (posX==320) {
        posX=321;
      }
      salirse = false;
    }
    if (posX>380 && posX<560 && posY>575 && posY<735) {//salirse zona 2
      salirse = false;
    }
    if (posX>560 && posX<680 && posY>670 &&  posY<690) {//salirse tunel 5 a la salida de zona 2
      salirse = false;
    }
    if (posX>650 && posX<680 && posY>290 &&  posY<690) {//salirse tunel 5
      salirse = false;
    }
    if (posX>547 &&  posX<770 && posY>95 &&  posY<300) {//salirse zona 3
      salirse = false;
    }
    if (posX>760 && posX<1035 && posY>195 &&  posY<215) {//salirse tunel 6
      if (posX==770) {
        posX=771;
      }
      salirse = false;
    }
    if (posX>995 && posX<1035 && posY>215 &&  posY<473) {//salirse tunel 6
      salirse = false;
    }
    if (posX>950 && posX<1035 && posY>443 &&  posY<473) {//salirse tunel 6
      salirse = false;
    }
    if (posX>745 && posX<950 && posY>395 &&  posY<585) {//salirse zona 4
      salirse = false;
    }
    if (posX>745 && posX<780 && posY>550 &&  posY<721) {//salirse tunel 6
      salirse = false;
    }
    if (posX>780 && posX<1180 && posY>695 &&  posY<721) {//salirse tunel 6
      salirse = false;
    }
    if (posX>1150 && posX<1180  && posY>499  &&  posY<695 ) {//salirse tunel 6
      salirse = false;
    }
    if (posX>1100 && posX<1330 && posY>140 &&  posY<500) {//salirse zona 5
      salirse = false;
    }
    if (posX>1288 && posX <1330 && posY>30 && posY<150) { // salirse tunel 7 y salida
      salirse = false;
    } 
    // CONDICION BOOLEANA DE SALIRSE DEL LABERINTO    
    if (salirse == true) {
      // Para mostrar pantalla de ganaste sin tener que pasarse todo el juego: posX=1310; posY=100;
      posX = 0;
      posY = height/4 + height/22;// 236
      salirse=false;
    }
  } // Fin de void salirse
  void muertoRojo(EnemigoRojo e) {
    if ((e.y+24 >= this.posY+3) && (e.y+2 <= this.posY+22) && (e.x+27 >= this.posX+3) && (e.x+3 <= this.posX+21)) {
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      delay(1000);
    }
  }
  void muertoVerde(EnemigoVerde e) {
    if ((e.y+24 >= this.posY+3) && (e.y+3 <= this.posY+22) && (e.x+23 >= this.posX+3) && (e.x+4 <= this.posX+21)) {
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      delay(1000);
    }
  }
  void muertoAzul1(EnemigoAzul1 e) {
    if ((e.y+25 >= this.posY+3) && (e.y+3 <= this.posY+22) && (e.x+18 >= this.posX+3) && (e.x+3 <= this.posX+21)) {
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      delay(1000);
    }
  }
  void muertoAzul2(EnemigoAzul2 e) {
    if ((e.y+25 >= this.posY+3) && (e.y+3 <= this.posY+22) && (e.x+27 >= this.posX+3) && (e.x+3 <= this.posX+21)) {
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      delay(1000);
    }
  }  
  void muertoTrampa(Trampa e) {
    if ((e.altura+e.y+16 >= this.posY+3) && (e.y <= this.posY+22) && (e.x+25 >= this.posX+3) && (e.x <= this.posX+21)) { 
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      delay(1000);
    }
  }
  void muertoFuego(Fuego e) {
    if ((e.y+14 >= this.posY+3) && (e.y+3 <= this.posY+22) && (e.x+18 >= this.posX+3) && (e.x+4 <= this.posX+21)) {
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      delay(1000);
    }
  }
  void muertoFuegoH(FuegoHorizontal e) {
    if ((e.y+18 >= this.posY+3) && (e.y+3 <= this.posY+22) && (e.x+17 >= this.posX+3) && (e.x+4 <= this.posX+21)) {
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      delay(1000);
    }
  }
  void muertoSnake(Snake e) {
    if ((e.y+18 >= this.posY+3) && (e.y+3 <= this.posY+20) && (e.x+15 >= this.posX+4) && (e.x+2 <= this.posX+20)) {
      println("MUERTO SNAKE");
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      delay(1000);
    }
  }
  void muertoSupersnake(Supersnake e){
   if ((e.y+59 >= this.posY+3) && (e.y+25 <= this.posY+20) && (e.x+870 >= this.posX+4) && (e.x+20 <= this.posX+20)) { 
      posX = 0;
      posY = height/4 + height/22;
      muerto = true;
      if(muerto == true){
        e.x = 7000;
        e.y = int(random(60,400));
      }
      delay(1000); 
    } 
  }
  void ganar() {
    if (this.posX >= 1290 && this.posX <= 1350 && this.posY >= 40 && this.posY <= 60) {
      ganar = true;
    }
    if (ganar == true) {
      image(ganaste, 0, 0);
      centesimas = centesimas;
      segundos = segundos;
      minutos = minutos;
      fill(0);
      textFont(fuente2, 34);
      fill(255,0,0);
      text ("Tu tiempo: ", 900, 115);
      textFont(fuente2, 24);
      fill(0);
      text ("Hundredths of seconds: " + centesimas, 900, 150);
      text ("Seconds: " + segundos, 900, 175);
      text ("Minutes: " + minutos, 900, 200); 
      ganar = false;
      noLoop();
    }
  }
} // Fin clase Link

class Snake {
  // Atributos
  private int x;
  private int y;
  private int speed = int(random(1, 4));
  private boolean botar = false;
  // Constructor
  Snake (int xpos, int ypos) {
    x=xpos;
    y=ypos;
  }  
  // Metodos
  void run() {
    drawEnemigo();
    move();
  }
  void move() {
    if (botar == false) {
      x = x - speed;
      if (x < 1100) {
        botar = true;
      }
    }
    if (botar == true) {
      speed = int(random(1, 4));
      x = x + speed;
      if (x > 1330) {
        botar = false;
      }
    }
  }
  void drawEnemigo() {
    if (botar == false) {
      image(snake, x, y);
    }
    if (botar == true) {
      image(snake_derecha, x, y);
    }
  }
}

class Supersnake {
  // Atributos
  private int x;
  private int y;
  private boolean aparecer = false;  
  // Constructor
  Supersnake(int xpos, int ypos) {
    x=xpos;
    y=ypos;
  }  
  // Metodos
  void run() {
    drawEnemigo();
    move();
  }
  void move() {
    if (aparecer == false) {
      x = x - 5;
      if (x < -2000) {
        aparecer = true;
      }
    }
    if (aparecer == true) {
      x = 7000;
      y = int(random(60, 500));
      aparecer = false;
    }
    if ( x < 195 && y < 250){
        x = x - 3102;
    }
  }
  void drawEnemigo() {
    if (x > -500 && x < 1400){
      textFont(fuente2, 34);
      fill(183,39,44);
      text("ALERTA, UN CHORIZOO!!!!!!", 220, 50);
      text("ALERTA, UN CHORIZOO!!!!!!", 220, 790);
    }
    image(supersnakepaint, x, y);
  }
}

class Trampa {
  // Atributos
  private int x; //posicion x de la trampa
  private int y; // posicion y de la trampa
  private int altura; // altura de la trampa
  private int speed = 2; // velocidad con la que baja/sube la trampa
  private boolean subir = false;
  // Constructor
  Trampa(int xpos, int ypos, int zpos) {
    x=xpos;
    y=ypos;
    altura=zpos;
  }
  // Metodos
  void run() {
    move();
    display();
  }
  void move() {
    if (subir == false) {
      altura = altura + speed;
      if (altura >= 160) {
        subir = true;
      }
    }
    if (subir == true) {
      altura = altura - speed;
      if (altura <= 0) {
        subir = false;
      }
    }
  }
  void display() {
    fill(82, 81, 77);
    rect(x, y, 25, 20 + altura);
  }
}

class Vidas { 
  // Atributos
  private int vidas = 3;
  private int x = 1000;
  private int y = 10;
  // Constructor
  Vidas () {
  } 
  // Metodos
  void run() { 
    drawVida();
    bajaVidas(personaje);
  } 

  void drawVida() {
    for (int i = vidas;i>0;i--) {
      image(vida, (x+i*50), y);
    }
  }

  void bajaVidas(Link personaje) {
    if (personaje.muerto == true) {
      if (personaje.invulnerable > 0 && personaje.invulnerable <= 60) {
        personaje.invulnerable--;
      }
      else {
        vidas = vidas - 1;
        personaje.muerto = false;
        personaje.invulnerable = 60;
      }
    }
    if (vidas == 0) {
      image(perdiste, 0, 0);
    }
  }
}


