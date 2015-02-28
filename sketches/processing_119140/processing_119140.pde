
//Variabili
int mediaSecMin;
int mediaMill;
int caduta;
int tanica;
int colore;
int a;
int b;
int c;
PFont font;

void setup(){
  size(240,780);
  mediaMill=height/780;
  mediaSecMin=height/60;
  //font
  noStroke();
  font=loadFont("FONT.vlw");
}

void draw() {
  //colore ora
  a=(hour()*5);
  b=(hour()*10)+10;
  c=(hour()*10)+15;
  //colore sfondo
  background(255);
  //orologio
  caduta=second()*mediaSecMin;
  tanica=minute()*mediaSecMin;
  //riempimento goccia
  noStroke();
  fill(a,b,c);
  //goccia
  ellipse(120,caduta,20,20);
  //riempmento acqua
  noStroke();
  fill(a,b,c);
  //acqua
  rect(0,780,240,-(tanica));
  //ora
  fill(0);
  textFont(font);
  if(mousePressed) {
    text((hour()+ ":"+ minute() + ":" + second()),mouseX,mouseY);
    noCursor();
  }
}

