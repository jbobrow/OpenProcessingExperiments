
//PONGessing

//by Michin


// Este es un primer intento para construir un pong utilizando processing. / This is a first attempt to create a simple pong game using processing.
//El jugador 1 untiliza las teclas w,a,s,d para mover la raqueta izquierda y la tecla 'e' para servir.//player 1 uses the "w,a,s,d" keys to move the left pad and the "e" key to serve.
//El jugador 2 untiliza el ratón para mover la raqueta derecha y el botón izquierdo para servir.//player 2 uses the mouse to move the right pad and the left mouse button to serve.
//El juego reinicia el marcador usando la tecla borrar/ Use the backspace key to restart the scores.




PImage mouse;
PImage wasd;
PFont miFont;
Raqueta player1, player2;
Bola bola1;
int contador1=0;
int contador2=0;

void setup()
{
  smooth();
  noCursor();
  size(400, 400);
  player1 = new Raqueta(20, height/2, 5, 35, 'w', 's');
  player2 = new Raqueta(375, height/2, 5, 35, 'i', 'k');
  bola1 = new Bola (width/2, height/2, 5, 1, 1, 2, 2, false, false);
  miFont = loadFont("MalgunGothicBold-48.vlw"); 
  mouse = loadImage("mouse.png");
  wasd = loadImage("wasd.png");
  textFont(miFont);
}

void draw() {

  background(0);
  image(mouse, 330, 310);
  image(wasd, 30, 310);
  stroke(255);
  fill(255, 20);

  text("PONGessing", 60, 50);

  fill(255);
  text(contador1, 158, 80);
  text(contador2, 218, 80);
  noFill();
  rect(0, 100, 399, 200);
  rect(0, 100, 200, 200);
  noStroke();
  player1.paint();
  player1.playerMove();
  player2.paint();
  player2.useMouse();
  bola1.paintBola();


  //----------------------------------------------------------------------comportamiento de la bola------------------------------------------------------
  if (bola1.bPosX-bola1.bSize < player1.posX+player1.sizeX && 
    bola1.bPosY+bola1.bSize <player1.posY+player1.sizeY && 
    bola1.bPosY+bola1.bSize >player1.posY
    || 
    bola1.bPosX+ bola1.bSize > player2.posX && 
    bola1.bPosY < player2.posY+player2.sizeY && 
    bola1.bPosY+bola1.bSize >player2.posY  )
  {

    if (bola1.bPosY<= player1.posY+player1.sizeY/3 +bola1.bSize &&
      bola1.bPosY >=player1.posY +bola1.bSize ||
      bola1.bPosY<= player2.posY+player2.sizeY/3 +bola1.bSize &&
      bola1.bPosY>= player2.posY +bola1.bSize)
    {
      if (bola1.dirY==1) {
        bola1.cambieDireccionY();
      }
      if (bola1.dirY==0) {
        bola1.dirY = -1;
      }
    }

    if (bola1.bPosY<= player1.posY + player1.sizeY +bola1.bSize &&
      bola1.bPosY >=player1.posY + 2 * (player1.sizeY/3) +bola1.bSize ||
      bola1.bPosY <= player2.posY + player2.sizeY +bola1.bSize &&
      bola1.bPosY>= player2.posY + 2 * (player2.sizeY)/3 +bola1.bSize)
    {
      if (bola1.dirY==-1) {
        bola1.cambieDireccionY();
      }
      if (bola1.dirY==0) {
        bola1.dirY = 1;
      }
    }
    if (bola1.bPosY< player1.posY + 2 * (player1.sizeY/3) +bola1.bSize &&
      bola1.bPosY > player1.posY + player1.sizeY/3 +bola1.bSize ||
      bola1.bPosY< player2.posY + 2 * (player1.sizeY/3) +bola1.bSize &&
      bola1.bPosY> player2.posY + player2.sizeY/3 +bola1.bSize)
    {
      bola1.dirY = 0.3;
      bola1.speedY *= 1.5;
    }
    bola1.cambieDireccionX();
    bola1.speedX *= 1.1;
    bola1.speedY *= 1.1;
  }


  if (bola1.bPosY> 300 - bola1.bSize 
    || bola1.bPosY< 100+bola1.bSize) {
    bola1.cambieDireccionY();
  }



  if (bola1.bPosX>=400+bola1.bSize)
  {
    bola1.quienSirve(false, true);
    contador1++;
  } 

  if (bola1.bPosX< 0)
  {
    bola1.quienSirve(true, false);
    contador2++;
  }


  if (bola1.servicio1 == true)
  {
    bola1.servicioPara(player1);
    bola1.bPosX +=10;
    if (keyPressed) {
      if (key == 'e')
      {
        bola1.quienSirve(false, false);

        if (bola1.bPosY > 200) {
          bola1.dirY = -1 ;
        }
        else {
          bola1.dirY = 1;
        }
        bola1.dirX = 1;
        bola1.speedX = 2; 
        bola1.speedY = 2;
        bola1.bPosX +=1;
        bola1.bPosY +=1; 
        //bola1.paintBola();
      }
    }
  }


  if (bola1.servicio2 == true)
  {
    bola1.servicioPara(player2);
    bola1.bPosX -=5;
    if (mousePressed) {
      bola1.quienSirve(false, false);
      if (bola1.bPosY > 200) {
        bola1.dirY = -1 ;
      }
      else {
        bola1.dirY = 1;
      }
      bola1.dirX = -1;
      bola1.speedX = 2; 
      bola1.speedY = 2;
      bola1.bPosX -=1;
      bola1.bPosY +=1;
      //bola1.paintBola();
    }
  }

  if (keyPressed)
  {
    if (key == BACKSPACE) {
      contador1 =0;
      contador2 =0;
    }
  }


  //----------------------------------------------------------------------comportamiento de la bola------------------------------------------------------
}


class Raqueta  

{

  public float posX, posY;

  public float sizeX, sizeY;

  char uup, ddwn;

  Raqueta (float iposX, float iposY, float isizeX, float isizeY, char iup, char idwn) {

    posX = iposX;  
    posY = iposY; 
    sizeX  = isizeX; 
    sizeY =  isizeY; 
    uup = iup;
    ddwn = idwn;
  }

  void paint () {

    fill(255);
    rect(posX, posY, sizeX, sizeY);
  } 

  void playerMove () {

    if (keyPressed) {

      if (key == uup && posY>=105)
      {
        posY-=8;
      }
      if (key== ddwn && posY<=260)
      {
        posY+=8;
      }
    }
  }
  void useMouse()

  {
    float rango = constrain(mouseY, 100, 300-35);


    posY=rango;
  }
}

class Bola 

{
  public Raqueta servidor;

  public float bPosX, bPosY;

  public float bSize; 

  float dirX, dirY;

  public float speedX, speedY;

  public boolean servicio1;

  public boolean servicio2;

  Bola (float iposX, float iposY, float isize, float idirX, float idirY, float ispeedX, float ispeedY, boolean iservicio1, boolean iservicio2) 

  {

    bPosX = iposX;  
    bPosY = iposY; 
    bSize  = isize; 

    dirX = idirX;
    dirY = idirY;
    speedY = ispeedY;
    speedX = ispeedX;
    servicio1 = iservicio1;
    servicio2 = iservicio2;
  }

  void paintBola() {
    noStroke(); 
    fill (255);
    bPosX = bPosX+(speedX*dirX);
    bPosY = bPosY+(speedY*dirY); 

    ellipse(bPosX, bPosY, bSize, bSize);
  } 
  void cambieDireccionY() {
    dirY *=-1;
  }

  void cambieDireccionX() {
    dirX *=-1;
  }

  void servicioPara ( Raqueta servidor)
  {

    bPosX = servidor.posX;
    bPosY = servidor.posY + servidor.sizeY/2;
    speedY = 0;
    speedX = 0;
    dirY = 0;
    dirX = 0;
  }

  void quienSirve(boolean player1, boolean player2)
  {
    if (player1 == true)
    {
      servicio1=true;

      servicio2=false;
    }

    if (player2 ==true)
    {
      servicio1 = false;

      servicio2 = true;
    }
    if (player1 == false && player2 == false)
    {
      servicio1 = false;

      servicio2 = false;
    }
  }
}


