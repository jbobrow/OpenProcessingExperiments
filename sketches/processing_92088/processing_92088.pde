
/////////////DEFINICION DE VARIABLES////////////////////////////////////////////////
float x;  //Variable 1
float y;  //Variable 2
float vel1;  //Variable velocidad 1
float vel2;  //Variable velocidad 2
///////////DEFINICION DE LOS PARAMRTROS GENERALES QUE SE EJECUTAN UNA SOLA VEZ////// 
  void setup() {  // setup() ANULADOR DE PARAMETROS no regresa un valor
    size(400, 400);//TAMAÑO DEL LIENZO
    background(224,216,63);//Definimos el COLOR del FONDO DEL LIENZO
  //ES IMPORTANTE INICIALIZAR VARIABLES QUE SE EJECUTAN DESDE UN PRINCIPIO
    x = 50;//INICIALIZACION de la variable 1
    y = 50;//INICIALIZACION de la variable 2
    vel1 = 0;//INICIALIZACION de la variable Velocidad 1
    vel2 = 1;//INICIALIZACION de la variable Velocidad 2
   }
///////////DEFINICION DE ELEMENTOS DEL DIBUJO QUE CAMBIAN EN EL TIEMPO///////////////
  void draw() {  // draw() ANULADOR DE DIBUJOS does not return a value
    fill(mouseX,mouseY,x+y,30);
    rect(50, 50, x-50,y-50 );
    ellipse(x, y, 40, 40);
    ellipse(x, x, 40, 40);
    ellipse(y, x, 40, 40);
    fill((mouseX/2),(mouseY/2),mouseX+mouseY);
    ellipse(width/2,height/2, 80, 80);
    line(x, y, width/2,height/2 );
    line(y, x, width/2,height/2 );
    //OPERACIONES DE REPETICION QUE PERMITIRAN EFECTO DE MOVIMIENTO
      //Movimiento VERTICAL
      if(x == 50){//Cuando la X vale 50
        vel1=1;//INCREMENTO de 1 
        y=y + vel1;//la variable Y toma los valores del incremento (vel1)
      }
      //Movimiento HORIZONTAL
      if(y == (height-50)){//Cuando la Y vale height-100 (alto del lienzo - 100)=(400-100=300)
        vel1=1;//INCREMENTO de 1
        x=x + vel1;//la variable toma los valores de X   
     }
     //Movimiento VERTICAL
     if(x == width-50){//Cuando la X vale width-50 (ancho del lienzo - 50)=(400-50=350)
        vel1=1;//INCREMENTO de 1 
        y=y - vel1;//la variable Y toma los valores del incremento (vel1)
     }   
      //Movimiento HORIZONTAL
      if(y == 50){//Cuando la Y vale height-100 (alto del lienzo - 100)
        vel1=1;//INCREMENTO de 1
        x=x - vel1;//la variable toma los valores de X   
  }
  }


