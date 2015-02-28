
float x1, y1;
float x2, y2;
float x11, y11;
float x21, y21;
float x111, y111;
float x211, y211;

void setup() {
size(600,600);
background(#000000);

}

void draw() {
stroke (#2d74ea);
float x1=random(width); //los puntos x1 y x2 los manda al medio
float x2=random(width);
 y1 = random(width); //a los puntos y1 e y2 los manda al azar hacia el width
  y2 = random(width);
point(x1,y1); //dibuja la linea de todos
point(x2,y2); //dibuja la linea de todos
point(x1,y2); //dibuja la linea de todos

stroke (#f90707);
float x11=random(width); //los puntos x1 y x2 los manda al medio
float x21=random(width);
 y11 = random(width); //a los puntos y1 e y2 los manda al azar hacia el width
  y21 = random(width);
point(x11,y11); //dibuja la linea de todos
point(x21,y21); //dibuja la linea de todos
point(x11,y21); //dibuja la linea de todos

stroke (#12f907);
float x111=random(width); //los puntos x1 y x2 los manda al medio
float x211=random(width);
 y111 = random(width); //a los puntos y1 e y2 los manda al azar hacia el width
  y211 = random(width);
point(x111,y111); //dibuja la linea de todos
point(x211,y211); //dibuja la linea de todos
point(x111,y211); //dibuja la linea de todos


}
