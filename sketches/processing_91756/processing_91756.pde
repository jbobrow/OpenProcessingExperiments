
String[] mensajes;
float posx;
int indice;
int numDichos;
PFont fuente;
PImage buk;

void setup() {
  size (500, 280);
  background(0);

  buk=loadImage("Charles-Bukowski.png");
  posx=width;
  indice=0;
  numDichos=6;
  fuente=loadFont("Monospaced-32.vlw");

  mensajes= new String [numDichos];
  mensajes[0]="A veces un hombre no puede evitar lo que hace.";
  mensajes[1]="Nunca lleves un montón de dinero a la morada de un pobre.";
  mensajes[2]="Tuve que retirarme y ver a la gente desde lejos, como si estuvieran en un escenario.";
  mensajes[3]="Si yo fuera mujer andaría por ahí con las faldas bien altas para excitar a los jóvenes.";
  mensajes[4]="Decidí que siempre me emborracharía... ";
  mensajes[5]= "Todo lo vulgar de la vida desaparecería.";
}


void draw () {
  image(buk, 0, 0);

  fill(0, 0, 0, 150);
  noStroke();  
  rect(0, 0, width, 55);

  fill(255, 255, 0, 145);  
  textFont(fuente, 32);
  text(mensajes[indice], posx, 40);

  text("Bukowski",333, 260);
  posx=posx -2;

  if (posx<0-textWidth( mensajes[indice])) {
    indice=indice +1;
    if (indice>= numDichos) {
      indice=0;
    }
    posx=width;
  }
}


