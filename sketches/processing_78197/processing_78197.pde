
// Exercice taken from the  Jer Thorp's web site. 
// http://blog.blprnt.com/blog/blprnt/tutorial-processing-javascript-and-data-visualization
// Datas in arrays are random data. 

PFont tit, labelsTit; // incializa variable para texto titulo
String info = "Esta es la info para colocar arriba bajo el titul de la muestra.";
int[] alto = {  
  80, 180, 210, 240, 330, 60, 90, 200, 90, 60, 90, 120, 150, 120, 150, 180, 120, 150, 180, 210, 240, 80, 30, 60, 90, 120, 150, 180, 210, 240 
};
int[] labels = {  
  80, 180, 210, 240, 330, 60, 90, 200, 90, 60, 90, 120, 150, 120, 150, 180, 120, 150, 180, 210, 240, 80, 30, 60, 90, 120, 150, 180, 210, 240 
};
int barra = 25; 
int sep = 50;
int posX, posY = 0; // posiciones absolutas de los elementos
int w = width; // ancho elementos
int h = height; // alto elementos
int dis = 75; // distancia lados desde borde
int disB = dis*2; // disB es separacion de lados
color col=255; // valor color
//int myColor = color(0, 0, 0); //slider
int myColor = 0; //slider
int sliderValue = 10; //slider

void setup() {
  size(800, 600);
  tit = loadFont("BellGothic-Black-48.vlw");
  labelsTit = loadFont("BellGothic-Black-48.vlw");
  smooth();
  textFont(tit, 14);
  fill(50, 50, 50);
}

void draw() {
  background(200, 210, 200);

  pushMatrix();
  translate(dis, dis/1.9);
  textSize(20);
  text("Título", 0, 0);
  textSize(12);
  fill(255);
  text(info, 0, 12);
  float infoW = textWidth(info);
  rectMode(CORNER);
  noStroke();
  rect(0, +15, infoW, 4);
  popMatrix();

  int w2 = width-disB;
  int h2 = height-disB;

  pushMatrix();  
  translate(dis, dis); 
  for (int i=0; i < alto.length; i++) {
    int resto = w2/alto.length; // dide ancho total x cant datos
    float colNew = map(alto[i], min(alto), max(alto), 10, 255); // mapeo para el color de la sbarras 

    fill(colNew, 100, 0); // color de las barras 
    noStroke();
    rectMode(CENTER);    //    rect(resto*i, h2, resto-1, -alto[i] );
    rect(resto*i+20, h2/2, resto-1, -alto[i] );

    stroke(colNew, 0, 0);
    line(0, h2, w2, h2); //abcisa X
    line(resto*i+20, h2, resto*i+20, h2+10); //lineas X

    line(0, 0, 0, h2); //ordenada Y
//   line(0, 15*i, -10, 15*i); //lineas Y
     line(0, 15*i, -10, 15*i); //lineas Y


    fill(255); // color de las barras 
    //    rotate(radians(20));
    textMode(CENTER);
    textSize(10);
    text(labels[i], resto*i+11, h2/2, 10);
  }
  popMatrix();
}



