
//Isaac OrtegaAlvarado ITCR-IDI-DVII- Homework #3- 3D Moire Pattern with navigation-
PFont font;//importa la calse para fuentes

float w,i,j,k,s,sep;//Declara las variables
float xmag, ymag = 0;
float newXmag, newYmag = 0; 

void setup() 
{ 
  size(700, 700,P3D);//Indica el tamano de la ventana y que es 3D.
} 

void draw() 
{ 
  background(200);//Color de fondo Negro
  s=s; //Inicicializa las variables de forma local. 
  sep=10;
  w=1;

  if (mousePressed == true) {//Implica que algo sucedera si la condicipon de mouse presionado es cierta
    if (mouseButton == LEFT) {// si se presiona el boton izquierdo
      s=s-0.01;
    }
    else if (mouseButton == RIGHT) {// si se presiona el boton derecho.
      s=s+0.01;
    }
  }

  pushMatrix(); //Comienza la matriz

  stroke(0);//Color de linea de contorno
  strokeWeight(w);//Grosor de linea
  translate(width/2, height/2, 0);//Mueve el punto inicial de los ejes al centro de la ventana.
  newXmag = mouseX/float(width) * TWO_PI;//Porcentaje de rotacion en el eje X
  newYmag = mouseY/float(height) * TWO_PI;//Porcentje de rotacion en el eje Y

  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { //Genera el nuevo valor de rotacion en el eje X.
    xmag -= diff/4.0; 
  }

  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { //Genera el nuevo valor de rotacion en el eje Y.
    ymag -= diff/4.0; 
  }

  rotateX(-ymag); //Rota el ejeX.
  rotateY(-xmag); //Rota el ejeY.

 //Figura... Construción de los cubos
  scale(s,s,s);// Escala la figura, parametro utilizado para simular el zoom in/zoom out.
  for (i = -100; i <=100; i = i+sep){
    for (j =-100; j <=100; j = j+sep){
      for(k=-100;k<=100; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=-100; i = i+sep){
    for (j =-300; j <=-100; j = j+sep){
      for(k=-300;k<=-100; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=-100; i = i+sep){
    for (j =-300; j <=-100; j = j+sep){
      for(k=100;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = 100; i <=300; i = i+sep){
    for (j =-300; j <=-100; j = j+sep){
      for(k=-300;k<=-100; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = 100; i <=300; i = i+sep){
    for (j =-300; j <=-100; j = j+sep){
      for(k=100;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=-100; i = i+sep){
    for (j =100; j <=300; j = j+sep){
      for(k=-300;k<=-100; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=-100; i = i+sep){
    for (j =100; j <=300; j = j+sep){
      for(k=100;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = 100; i <=300; i = i+sep){
    for (j =100; j <=300; j = j+sep){
      for(k=-300;k<=-100; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = 100; i <=300; i = i+sep){
    for (j =100; j <=300; j = j+sep){
      for(k=100;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=300; i = i+sep){
    for (j =-300; j <=300; j = j+sep){
      for(k=300;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=300; i = i+sep){
    for (j =-300; j <=300; j = j+sep){
      for(k=-300;k<=-300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=300; i = i+sep){
    for (j =-300; j <=-300; j = j+sep){
      for(k=-300;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=300; i = i+sep){
    for (j =300; j <=300; j = j+sep){
      for(k=-300;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = -300; i <=-300; i = i+sep){
    for (j =-300; j <=300; j = j+sep){
      for(k=-300;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }
  for (i = 300; i <=300; i = i+sep){
    for (j =-300; j <=300; j = j+sep){
      for(k=-300;k<=300; k=k+sep){
        point(i,j,k);
      }
    }
  }    
  popMatrix();//finaliza la matriz

  font = loadFont("DIN-48.vlw"); //carga la fuente
  textFont(font, 14); //indica la altura de la fuente
  fill(0);//indica el color de la fuente
  text("Utilizando el mouse:",360 , 670);//indica posición y el texto
  textFont(font, 14); //indica la altura de la fuente
  fill(0);//indica el color de la fuente
  text("Botones para regular el zoom.",500 , 670);//indica posición y el texto
  text("Rote moviendo el cursor.",500 , 685);//indica posición y el texto
} 


