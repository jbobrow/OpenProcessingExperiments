
PFont font; // mension de las variables (cuales son los fonts o imagenes que hay)
String quote = "I like Chalupas...";

void setup() {
  size(480,120);
  smooth();
  font = loadFont("AndaleMono-36.vlw"); //Llamada al font creado anteriormente
  textFont(font);
}

void draw() {
  background(102);
  textSize(36); //Tamaño de texto
  text(quote, 26,30,240,100); //Cual es el texto y posicion en el canvas
}

