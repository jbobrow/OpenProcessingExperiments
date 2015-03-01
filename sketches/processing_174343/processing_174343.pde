
boolean doubleP = false;

//situación inicio del balon.

float bolaX = 450; 
float bolaY = 300;

//posiciones bases jugador

float x1 = 90; //jugador 1 cordenadas (izquierda)
float y1 = 200;
float x2 = 805; //jugador 2 cordenadas (derecha)
float y2 = 255;
float speed = 10;//velocitat de les bases

//velocidad de la bola,

float ballSpeedX = 4.5;
float ballSpeedY = 4.5;

// el bolean declara que si o que no 

boolean ballTouchingP1 = false;
boolean ballTouchingP2 = false;

//Correspondencia teclas comoandos. es false para que solo se active si s epresiona, si no l0 estaria siempre

boolean wPressed = false;
boolean sPressed = false;
boolean iPressed = false;
boolean kPressed = false;
boolean goPressed = false; //con la letra espacio emieza el juego.
boolean mPressed = false; 

int p1Score = 0;
int p2Score = 0;

//imagenes.

PImage play;
PImage fondo;
PImage base;
PImage base2;
PImage ulls1;
PImage ulls2;
PImage cara;
PImage bolaca;


void setup() {
  size(1000, 800);
  play = loadImage("play.png");
  fondo = loadImage("fondo.png");
  base = loadImage("bases2.png");
  base2 = loadImage("bases.png");
  ulls1 = loadImage("ulls.png");
  ulls2 = loadImage("ulls.png");
  cara = loadImage("cara.png");
  bolaca = loadImage("bolica.png");
}


void draw() {
  mainPage();
}
void mainPage() {

  image(fondo, 0, 0);       
  buttonPlay();
}

void buttonPlay() {    
  image(play, 230, 0, 0, 0);

  if (mousePressed && (pmouseX >= 400) && (pmouseX <= 700) && (pmouseY >= 400) && (pmouseY <= 500)) { //si el boton esta apretado y ademas dentro de esas cordenadas empieza.
    doubleP = true;
  }
  if (doubleP == true) {
    twoPlayer();
  }
}

void twoPlayer() {
  image(fondo, 0, 0);   
  ulls();

  PFont font;
  font  = loadFont("Helvetica-Bold-48.vlw");
  textFont (font, 15);
  textAlign(CENTER);//para que los numeros crezcan desde el centro.
  
  text(""+p1Score, x1-45, y1+150);//posicion y sumado de puntos 
  text(""+p2Score, x2+150, y2-40);

  player1();
  player2();
  ball();
}

void player1() {
  
  image(base, x1-90, y1-25);
//tope superior.
  if (y1 <= 0) { 
    y1 = 0;
  }
//tope inferior. desde la posición inicial del Y1 es mas grande que la mitat porque la foto ocupa mas y la posición está mas superior.
  if (y1 >= 610) {
    y1 = 610;
  }

// si esta presionada la W a la vertical se le resta el movimiento .
  if (wPressed == true) {
    y1 = y1 - speed;
  } 
// si esta presionada la S a la vertical se le suma el movimiento.
  if (sPressed == true) {
    y1 = y1 + speed;
  }
}

void player2() {
 
  image(base2, x2+75, y2-78);

  if (y2 <= 0) {
    y2 = 0;
  }
  if (y2 >= 630) {
    y2 = 630;
  }

  if (iPressed == true) {
    y2 = y2 - speed;
  }
  if (kPressed == true) {
    y2 = y2 + speed;
  }
}

void ball() {
  
  //cordenadas iniciales
  
  image(bolaca, bolaX, bolaY, 50, 50);

 // si el tabulador está presionado se le suma el movimiento.

  if (goPressed == true) {
    bolaX = bolaX + ballSpeedX;
    bolaY = bolaY + ballSpeedY;
  }
  
  // tope superior y inferior que hace que la vola cambie de sentido y no se salga.

  if (bolaY >= 750) {
    ballSpeedY = ballSpeedY * -1;
  } 
  if (bolaY <= 0) {
    ballSpeedY = ballSpeedY * -1;
  }
  
  //parte donde detecta la zona donde el jugador hacierta, que son el punto de las cordenadas del Jugador + 90 que es la superficie.(anchura igual varia la altura si)

  if ((bolaX <= 90) && (bolaX >= 20) && (bolaY >= y1) && (bolaY <= y1+90)) {
    ballTouchingP1 = true;
  }
  
  // lo mismo pa lotro jugador.
  
  if ((bolaX >= 890) && (bolaX <= 910) && (bolaY >= y2) && (bolaY <= y2+90)) {
    ballTouchingP2 = true;
  }

//si a tocado a la plataforma la pelota va en otra dirección.y vuelve a false hasta que pase otra vez

  if (ballTouchingP1 == true) {
    ballSpeedX = ballSpeedX * -1; 
    ballTouchingP1 = false;
  }
  if (ballTouchingP2 == true) {
    ballSpeedX = ballSpeedX * -1;
    ballTouchingP2 = false;
  }
  
// si la pelota se sale vuelve a la posición inicial y apunta punto para el jugador ganador. 

  if (bolaX >= 1000) {
    bolaX = 450;
    ballSpeedX = ballSpeedX * -1;
    p1Score = p1Score + 1;
  }
  if (bolaX <= 0) {
    bolaX = 450;
    ballSpeedX = ballSpeedX * -1;
    p2Score = p2Score + 1;
  }
}



//especificación de comoandos. 

void keyPressed() {
  if (key == 'w') {
    wPressed = true;
  }
  if (key == 's') {
    sPressed = true;
  }
  if (key =='i') {
    iPressed = true;
  }
  if (key == 'k') {
    kPressed = true;
  }
  if (key == ' ') {
    goPressed = true;
  }
  if (key == 'm') {
    mPressed = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    wPressed = false;
  }
  if (key == 's') {
    sPressed = false;
  }
  if (key =='i') {
    iPressed = false;
  }
  if (key == 'k') {
    kPressed = false;
  }
  if (key == 'm') {
    mPressed = false;
  }
}
void ulls() {

 // map segueix la bola.
  
  float pupilX = map(bolaX, 0, width, 480, 495);//anchura del map.
  
 float pupilY = map(bolaY, 0, height, 205, 240);//altura del map.
 
  image(ulls1, pupilX, pupilY); //ull left.
  image(ulls2, pupilX-140, pupilY); //ull right. la altura es igual pero se le separa.
  
  image(cara, 290, 65);
  
}



