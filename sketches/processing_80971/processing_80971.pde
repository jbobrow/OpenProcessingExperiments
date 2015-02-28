
int tam;
void setup(){
  
size(800,400);

tam=5;
}
void draw(){
  background(0);
  PFont tipo_letra;
tipo_letra=loadFont("SansSerif.bolditalic-48.vlw");
textFont(tipo_letra,tam);
text("Hola Mundo",10,200);
tam+=5;
}

