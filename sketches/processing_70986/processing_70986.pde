
PFont fuente;
float x,y;
String[] fontList =PFont.list();
String preguntas[]=new String[6];
String parrafos[]=new String[6];
int po;
void setup()
{
  size(1000,500);
  frameRate(20);
  background(0);
  preguntas[0]="¿Qué es programación estructurada?";
  preguntas[1]="¿Cómo funciona la programación estructurada?";
  preguntas[2]="¿Cómo funciona la estructura de secuencia?";
  preguntas[3]="¿Qué es y cómo funciona la estructura de decisión?";
  preguntas[4]="¿Que es y cómo funciona la estructura de repetición?";
  preguntas[5]="Referencias";
  parrafos[0]="Es un estilo, forma o paradicma de programación, la cual esta basada en realizar las instrucciones en forma\n\nsecuencial (linea por linea), esto es para manejar el control de la ejecución. Lo único que se tiene que realizar\n\nes seguir una secuencia de instrucciones de un algoritmo. Esta forma de programar se basa en un famoso teorema,\n\ndesarrollado por Edsger Dijkstra, que demuestra que todo programa puede escribirse utilizando únicamente\n\ncon las tres estructuras básicas de control siguientes:\n\n        *  Secuencia \n\n        *  Selección \n\n        *  Iteración";
  parrafos[1]="Funciona a traves de la ejecución lineas de código de manera secuencial, es decir, se puede seguir el programa\n\no algoritmo de principio a fin sin perder la continuidad de la tarea que se esta realizando. Relacionados a este\n\ntipo de programación estan los diagramas de flujo, los cuales, como su numbre dice, funcionan para seguir un \n\nflujo de un algoritmo, con ayuda de las estructuras básicas de este tipo de digramas como son: if o decisión\n\n y for o ciclos. \n\nIMAGEN Y EJEMPLO";
  parrafos[2]="Esta estructura hace referencia al bloque secuencial de instrucciones, instrucciones ejecutadas sucesivamente, \n\nuna detrás de otra. \n\nIMAGEN Y EJEMPLO";
  parrafos[3]="Esta estructura nos ayuda a realizar una interrogante o pregunta sobre alguna variable o condición que se \n\nquiere saber si se cumple, y en base a eso realizar o no una serie de instrucciónes. \n\nIMAGEN Y EJEMPLO";
  parrafos[4]="Esta estructura nos permite realizar en repetidas ocaciones una o varias instrucciones, siempre y cuando se \n\ncumpla una condición. \n\nIMAGEN Y EJEMPLO.";
  parrafos[5]="Referencias";
  po=0;
}

void draw()
{
  background(0);
  fill(255,255,204);
  rect(2,2,996,496);
  fill(204,0,102);
  fuente= createFont(fontList[300],25); 
  textFont(fuente);
  text(preguntas[po],250,40);
  fuente= createFont(fontList[200],15);
  textFont(fuente);
  text(parrafos[po],14,120);
}
  
void keyPressed()
{
  if(keyCode==UP)
    if(po>0)
       po--;
  if(keyCode==DOWN)
    if(po<5)
      po++;
}

