
//EJEMPLO DE FUNCIÓN QUE RETORNA VALOR

//declara las variables y asigna un valor inicial, estas variables tendrán diferentes valores más adelante
int m=50;
float a=50;   //se utiliza para calcular la nueva posición de cx1, que es la posición de “x”
float b=50;
float c=350;
float d=350;

void setup() {
  
  size(400,400);  //define el tamaño de ventana
  smooth();  //suavizado
  PFont fontA = loadFont("Arial-BoldMT-15.vlw"); //carga la fuente "Arial..."con el tamaño 15 y la asigna a fontA
  textFont(fontA, 15);  //asigna fontA con tamaño 15 para cada vez que se utilice la función text()
}
void draw() {

  background(255); //redibuja la ventana de blanco y crea la ilusión de movimiento

  int x1=0+m;
  int y1=0+m;
  float cx1= nuevaBezierX1(a);
  float cy1= nuevaBezierY1(b);
  float cx2= nuevaBezierX2(c);
  float cy2= nuevaBezierY2(d);
  int x2=width-m;
  int y2=height-m;

// llamadas a metodos o funciones 
  nuevaBezierX1(a);  
  nuevaBezierY1(b);
  nuevaBezierX2(c);
  nuevaBezierY2(d);
  pintaBezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2);

// Impresión de las coordenadas en pantalla
  float numeroFotogramaActualx1=cx1;
  float numeroFotogramaActualy1=cy1;
  float numeroFotogramaActualx2=cx2;
  float numeroFotogramaActualy2=cy2;
  fill(0, 102, 153);//color de la letra
//Imprime el texto y los valores en pantalla
  text("x= "+ numeroFotogramaActualx1 + "; y= " + numeroFotogramaActualy1, cx1-(width/6), cy1-(height/16));
  text("x= "+ numeroFotogramaActualx2 + "; y= " + numeroFotogramaActualy2, cx2-(width/6), cy2-(height/16));
  noFill();//anula el relleno de color
}

//FUNCIONES

float nuevaBezierX1(float _a) {    //calcula la posición de a y lo retorna para calcular cx1
  if (mousePressed && (mouseButton == LEFT)) {
    a = mouseX;
  }  
  return a;
}

float nuevaBezierY1(float _b) {   //calcula la posición de b  y lo retorna para calcular cy1
  if (mousePressed && (mouseButton == LEFT)) {
    b=mouseY;
  }  
  return b;
}

float nuevaBezierX2(float _c) {  //calcula la posición de a y lo retorna para calcular cx2
  if (mousePressed && (mouseButton == RIGHT)) {
    c=mouseX;
  }  
  return c;
}

float nuevaBezierY2(float _d) {   //calcula la posición de b  y lo retorna para calcular cy2
  if (mousePressed && (mouseButton == RIGHT)) {
    d=mouseY;
  }  
  return d;
}

void pintaBezier      (int _x1,int _y1,float _cx1,float _cy1, float _cx2, float _cy2,int _x2,int _y2)    {
  stroke(0,0,0);
  strokeWeight(5);
  bezier(_x1,_y1,_cx1,_cy1,_cx2,_cy2,_x2,_y2);   //dibuja la curva
  stroke(255,0,0);
  strokeWeight(2);
  line(_x1,_y1,_cx1,_cy1);    //dibuja las guías en rojo
  line(_x2,_y2,_cx2,_cy2);
  stroke(0,255,0);
  strokeWeight(9);
  point (_cx1,_cy1);   //dibuja las "anclas" en verde
  point (_cx2,_cy2);
}




