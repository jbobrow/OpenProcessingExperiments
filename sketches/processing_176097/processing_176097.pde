
int celdas= 16;
int[] posX = new int[celdas];
int[] posY = new int[celdas];

int contador=0;
int intervalo=0;

int[] estadoPosX  = new int[celdas];
int[] estadoPosY = new int[celdas];

int variableX, variableY;

void setup() {
  /* for (int j=0; j<posX.length; j++) {
   posX[j]= j*50;
   posY[j]= j*50;
   }*/
  size(400, 400);
}

void draw() {
  background(0);
  for (int i=0; i<400; i+=50) {
    stroke(255, 0, 0);
    line(0, i, height, i);
    line(i, width, i, 0);
  }

  //println(contador);

  ellipseMode(CORNER);
  noStroke();
  fill(255);
  for (int i =0;i<contador;i++) {
    /*int temporalx = estadoPosX[i];
     int temporaly = estadoPosY[i];
     ellipse(posX[temporalx], posY[temporaly],50,50);*/
    ellipse(estadoPosX[i], estadoPosY[i], 50, 50);
  }
}
void mousePressed() {
  variableX=(int)map(mouseX/50, 0, 8, 0, width);
  variableY=(int)map(mouseY/50, 0, 8, 0, width);
 
  for (int i =0;i<contador;i++) {
    if (estadoPosX[i]== variableX&&estadoPosY[i]== variableY) {
      println("estoy haciendlo click donde ya habia hecho click");
    }
    else {
      estadoPosX[contador] = variableX;
      estadoPosY[contador] = variableY;

    }
  }
  contador++;
  if (contador>=celdas) {
    contador=0;
  }
}


