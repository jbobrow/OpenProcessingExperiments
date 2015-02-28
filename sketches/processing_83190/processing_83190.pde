
import ddf.minim.*;

AudioPlayer player;
Minim minim;

float tempoexplodiu;

PImage a ;//backgroud
PImage x ;//boom!
PImage w ;//chegada

PImage b ;

PImage d ;//carros
PImage e ;
PImage f ;
PImage g ;
PImage h ;
PImage i ;
PImage j ;


int posX; //carro bom
int posY;

int posX1;//carros malvados
int posY1;
int posX2;
int posY2;
int posX3;
int posY3;

int posX4;
int posY4;
int posX5;
int posY5;
int posX6;
int posY6;
int posX7;
int posY7;

boolean teclaEsq; 
boolean teclaDir;
boolean teclacima; 
boolean teclabaixo;

boolean batida;
boolean chegada;



void setup () {
  size(800, 800);
  
   minim = new Minim(this);
   player = minim.loadFile("audio.mp3", 2048);
    player.play();



  a = loadImage("pista__.jpg");//backgound
  x = loadImage("boom.gif");
  b = loadImage("carroamigo.gif");

  d = loadImage("carroinim.gif");  
  e = loadImage("carroinim.gif");
  f = loadImage("carroinim.gif");
  g = loadImage("carroinim.gif");
  h = loadImage("carroinim.gif");
  i = loadImage("carroinim.gif");
  j = loadImage("carroinim.gif");
  w = loadImage("trofeu1..jpg");

  posX = 380;
  posY = 750;

  posX1 = 200;
  posY1 = 0;
  posX2 = 400;
  posY2 = 0;
  posX3 = 650;
  posY3 = 0;
  posX4 = 300;
  posY4 = 0;
  posX5 = 450;
  posY5 = 0;
  posX6 = 700;
  posY6 = 0;
  posX7 = 100;
  posY7 = 0;

  batida = false;
  chegada = false;
}

void draw () {



    if (teclaEsq==true) {
      posX=posX-10;
      if (posX<=0) {
        posX=0;
      }
    }
    if (teclaDir==true) {
      posX=posX+10;
      if (posX>=750) {
        posX=750;
      }
    }
    if (teclacima==true) {
      posY=posY-10;
      if (posY<=0) {
        posY=0;
      }
    }
    if (teclabaixo==true) {
      posY=posY+10;
      if (posY>=690) {
        posY=690;
      }
    }

    // colisão

    //chegada


    if (posX >=10 && 
      posX <=790 &&
      posY <=90 &&
      posY >=30)
    {
      chegada=true;
      print ("chegou");
    }


    if (posX+25 >=170 && // carro 1
    posX+25 <=230 &&
      posY <=posY1+10 &&
      posY >=posY1-10)
    {
      batida = true;
      tempoexplodiu=millis();
    }


    if (posX+25 >=370 && //carro 2
    posX+25 <=430 &&
      posY <=posY2+10 &&
      posY >=posY2-10)
    {
      batida = true;
      tempoexplodiu=millis();
    }

    if (posX+25 >=620 && //carro 3
    posX+25 <=680 &&
      posY <=posY3+10 &&
      posY >=posY3-10)
    {
      batida = true;
      tempoexplodiu=millis();
    }

    //carro 4,5,6 e 7


    if (posX+25 >=270 && 
      posX+25 <=320 &&
      posY <=posY4+10 &&
      posY >=posY4-10)
    {
      batida = true;
      tempoexplodiu=millis();
    }


    if (posX+25 >=440 && //carro 3
    posX+25 <=460 &&
      posY <=posY5+10 &&
      posY >=posY5-10)
    {
      batida = true;
      tempoexplodiu=millis();
    }


    if (posX+25 >=690 && //carro 3
    posX+25 <=750 &&
      posY <=posY6+10 &&
      posY >=posY6-10)
    {
      batida = true;
      tempoexplodiu=millis();
    }

    if (posX+25 >=95 && //ok
    posX+25 <=120 &&
      posY <=posY7+10 &&
      posY >=posY7-10)
    {
      batida = true;
      tempoexplodiu=millis();
    }

    if (batida && (millis()- tempoexplodiu>500)) {
      batida= false;
      posX = 380;
      posY = 750;
    }




    // velocidade dos carros
    posY1 = posY1 +5;
    if (posY1>=800) {
      posY1=0;
    } 

    posY2 = posY2 +10;
    if (posY2>=800) {
      posY2=0;
    } 

    posY3 = posY3 +15;
    if (posY3>=800) {

      posY3=0;
    }

    posY4 = posY4 +20;
    if (posY4>=800) {
      posY4=0;
    } 

    posY5 = posY5 +5;
    if (posY5>=800) {
      posY5=0;
    }  

    posY6 = posY6 +25;
    if (posY6>=800) {
      posY6=0;
    } 
    posY7 = posY7 +19;
    if (posY7>=800) {
      posY7=0;
    } 







    //desenha
    image(a, 0, 0);//fundo

    //chegada
    if (chegada==true) {    
      image (w, 200, 200);
      posX = 380;
      posY = 750;
    }

    if (chegada && (millis()- tempoexplodiu>3000)) {
      chegada= false;
      posX = 380;
      posY = 750;
    }



    if (batida==true) {
      image (x, posX, posY);
    }
    else {
      image(b, posX, posY);//carro amigo
    }
    image(d, posX1, posY1);//carro inimigo
    image(e, posX2, posY2);
    image(f, posX3, posY3);
    image(g, posX4, posY4);
    image(h, posX5, posY5);
    image(i, posX6, posY6);
    image(j, posX7, posY7);
  }



  // meus controles

  void keyPressed() {
    if (keyCode==LEFT) {
      teclaEsq=true;
    }
    if (keyCode==RIGHT) {
      teclaDir=true;
    }

    if (keyCode==UP) {
      teclacima=true;
    }
    if (keyCode==DOWN) {
      teclabaixo=true;
    }
  }
  void keyReleased () {
    if (keyCode==LEFT) {
      teclaEsq=false;
    }
    if (keyCode==RIGHT) {
      teclaDir=false;
    }

    if (keyCode==UP) {
      teclacima=false;
    }
    if (keyCode==DOWN) {
      teclabaixo=false;
    }
  }


