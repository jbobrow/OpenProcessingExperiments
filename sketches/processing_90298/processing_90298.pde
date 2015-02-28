
import hypermedia.video.*; //impotação de bibliotecas
import java.awt.Rectangle;

OpenCV opencv;

PFont fontTitulo;
PFont fontSerie;
int textH;

float noiseX = 0.0; // declaração de váriaveis para oscilação do ponto aleatório
float noiseY = 0.0;

String[] data;
int contador;

int r = int(random(255)); // declaração de cor da linha
int g = int(random(255));
int b = int(random(255));

int captX = 1066;
int captY = 600;

int bg = 250; // declaração de cor de background

boolean ligado = false;

int savedTime; // declaração de variáveis para o cronométro
int totalTime = 8000;

int randomCicloS = int (random(1, 100)); // declaração de randomização
int randomCicloC = int (random(1, 100));
int randomStroke = int (random(1, 10));
//int randomCollor;

//———————————————————————————————————————————————————————————————————————————————————————————

void setup () // definição inicial, roda apenas uma vez
{
  size ( 1224, 680); // definição do canvas
  background ( bg ); // definição de background

  data = loadStrings("data/contador.txt");
  //println (contador);
  //println (int(data[0]));
  contador = (int(data[0])); // declaração para contador

  savedTime = 0; // definição de unidade para o cronométro;
  ligado = false;

  opencv = new OpenCV(this); // definição do OpenCV
  opencv.capture( captX/4, captY/4, 12 );
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT ); // load the FRONTALFACE description file

  fontTitulo = loadFont("data/OCRAStd-48.vlw");
  textFont(fontTitulo, 32);

  desenhaTexto();
}

void desenhaTexto() {
  fill(0);
  text ("Desenho Aleatório Colaborativo", 260, 300);
}

void serial() {
  fill(bg);
  noStroke();
  rect(0, 630, width, 40);
  fill(0);
  
  textH = height-30;

  fontSerie = loadFont("data/OCRAStd-28.vlw");
  textFont(fontSerie, 14);
  text ("Bienal#" + contador, 20, textH);
  text ("Desenho Aleatório Colaborativo", 480, textH);

  int d = day();    // Values from 1 - 31
  int m = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  
  text (d + "/" + m + "/" + y, width - 120, textH);
  
  save ("PAsBienal/Bienal#" + contador + ".pdf");
  contador++;
  data[0] = str(contador);
  saveStrings ("data/contador.txt", data);
}

//——————————————————————————————————————————————————————————————————————————————————————————

void draw() // parametros para execução do desenho
{
  opencv.read(); // acesso ao OpenCV
  opencv.flip( OpenCV.FLIP_HORIZONTAL ); // espelhamento da imagem
  //Rectangle[] faces = opencv.detect(); // detect anything ressembling a FRONTALFACE
  Rectangle[] faces = opencv.detect(1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, width/16, height/16); 
  //image ( opencv.image(), (width - (captX/2)) / 2, (height - (captY / 2)) / 2 );

  /*
   // draw face area(s)
   noFill();
   //stroke(255, 0, 0);
   for ( int i=0; i<faces.length; i++ ) {
   rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height );
   }//*/

  // alteração do valor para oscilação do ponto aleatório
  //noiseX = noiseX + random ( 0, 1 ); 
  //noiseY = noiseY + random ( 0, 1 );

  noiseX = noiseX + .01; 
  noiseY = noiseY + .01;

  //  for ( int s = 0; s<randomCicloS; s++ ) {
  strokeWeight (randomStroke); 



  float X = noise(noiseX, 0) * width;
  float Y = noise(0, noiseY) * height;


  if ((faces.length>=1)&&(ligado==false)) {
    ligado = true;
    //println ("Ligado");
    background(bg);
  } 

  if (ligado == true) {
    for ( int i=0; i<faces.length; i++ ) {
      float faceW = faces[i].x*12 + faces[i].width/4;
      float faceH = faces[i].y*12 + faces[i].height/4;
      if (faceW > width) {
        faceW = width-10;
      }
      if (faceH > height-30) {
        faceH = height-30;
      }
      line (faceW, faceH, X, Y);
    }

    for ( int c=0; c<randomCicloC; c++) {
      stroke( r*( random (-2.1, 2.1) ), g*( random (-2.1, 2.1) ), b*( random (-2.1, 2.1)));
      //randomStroke = int (random(1, 10));
    }
    r = int (random(255));
    g = int (random(255));
    b = int (random(255));
    randomCicloC = int (random(1, 100));
  }

  if (faces.length == 0 && ligado == true && savedTime == 0) {
    savedTime = millis();
  }

  if (faces.length >= 1 && ligado == true && savedTime > 0) {
    savedTime = 0;
  }

  int passedTime = 0;
  if (savedTime > 0) {
    passedTime = millis() - savedTime;
  }

  if (passedTime > totalTime) {
    //println ("Final da espera");
    serial();
    ligado = false;
    //println ("Desligado");
    //background (bg);
    //desenhaTexto();
    savedTime = 0;
  }

  randomCicloS = int (random(1, 100));
  randomStroke = int (random(1, 10));
}
