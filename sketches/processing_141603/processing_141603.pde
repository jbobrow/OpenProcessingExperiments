
//
// ISTRUZIONI
// eseguire e usare i tasti freccia per modificare i parametri
//
// autore foto: Brian Gratwicke - http://flic.kr/p/98J4W3
//

/* @pjs preload="scacchi.png,flower.jpg"; */

PImage sfondo;
PImage img;

int rosso = 200;
int verde = 200;
int blu = 200;
int alfa = 200;
int canale = 0;   

void setup() 
{
  size(320,320);
  noStroke();

  sfondo = loadImage("scacchi.png");
  img = loadImage("flower.jpg");

  PFont font = createFont("Courier New Bold", 14);
  textFont( font );
  textAlign( CENTER );
}

void draw() 
{
  background(sfondo);
  
  tint(rosso, verde, blu, alfa);
  image(img, 0, 0);
  noTint();
  
  fill(0,96);
  rect(0,height-20, 320,20);

  String strRosso = (canale==0) ? rosso+"<" : rosso+" ";
  String strVerde = (canale==1) ? verde+"<" : verde+" ";
  String strBlu = (canale==2) ? blu+"<" : blu+" ";
  String strAlfa = (canale==3) ? alfa+"<" : alfa+" ";
  
  String parametri = "R="+strRosso + "  G="+strVerde + "  B="+strBlu + "  A="+strAlfa;
  fill(255);
  text( parametri, 0,height-17, 320,20); 
}

void keyPressed()
{
  switch (keyCode) {
    case LEFT: if (canale>0) --canale;  break;
    case RIGHT: if (canale<3) ++canale;  break;
    case UP:
      switch(canale) {
        case 0:  if (rosso<255) ++rosso;  break;  
        case 1:  if (verde<255) ++verde;  break;  
        case 2:  if (blu<255)   ++blu;    break;  
        case 3:  if (alfa<255)  ++alfa;   break;  
      }
      break;  
    case DOWN:
      switch(canale) {
        case 0:  if (rosso>0) --rosso;  break;  
        case 1:  if (verde>0) --verde;  break;  
        case 2:  if (blu>0)   --blu;    break;  
        case 3:  if (alfa>0)  --alfa;   break;  
      }
      break;  
  }
}

