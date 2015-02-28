

// Variables Flor
float centroFlorX;  
float centroFlorY;
float radioFlor;
int numPetalos;
float caule;

//Variables de Giro de la Flor
float anguloFlor;
float giro=0;

//Variables Raiz Fractal
float tamRaiz;
float anchCaule;



void setup(){

  // Tamanho do Stage
  size(800,600);

  // Inicializo las variables  
  centroFlorX=width/2;  
  centroFlorY=(height/2)-100;
  radioFlor=60;
  numPetalos=18;
  caule=height/3;
  tamRaiz=caule/2;
  anchCaule=radioFlor/4;
  anguloFlor=TWO_PI/numPetalos;

}

void draw(){


  //Dibujo el fondo con lineas de colores random
  
  for (int i=0;i<=height;i++)
  {
    stroke(random(200,230),random(150,170),20);
    line(0,i,width,i);
  }  

  // marca el centro de la flor
  translate(centroFlorX,centroFlorY);

  // dibuja caule de la flor
  strokeWeight(anchCaule);
  stroke(0,200,0);
  line (0,0,0,caule);

  //dibuja centro de la flor
  strokeWeight(radioFlor/4);
  stroke(255);
  fill(240,225,25);
  ellipseMode(CENTER);
  ellipse(0,0,radioFlor,radioFlor);

  //dibuja tierra
  translate(0,caule*1.5);
  rectMode(CENTER);
  noStroke();
  fill(240,150,0);
  rect(0,0,width,caule);
  translate(0,-tamRaiz);

  // dibuja Raiz Fractal
  strokeCap(SQUARE);
  stroke(0);  
  
  
  //OBS: he aplicado la variable Giro para mover la raiz
  fractal(tamRaiz,PI/2+(giro*2),anchCaule);




  //vuelve al centro de la flor

  translate (0,-caule*1.5);
  smooth();

  // aplica variación para girar la flor
  giro = giro+0.01;
  // OPCION A -- GIRO UNIFORME
  //rotate(anguloFlor+giro);
  // OPCION B -- GIRO LOCO
  anguloFlor=anguloFlor+0.005;

  pushMatrix();
  ellipseMode(CORNER);
  strokeWeight(6);
  stroke(130,120,100);

//Dibuja petalos en pares, para tener dos colores distintos 
  for (int i=0;i<=numPetalos/2;i++)
  {  

    fill(230,25,200);
    ellipse(radioFlor/2,0,radioFlor,radioFlor/3);
    rotate(anguloFlor);
    fill(255,100,40);
    ellipse(radioFlor/2,0,radioFlor,radioFlor/3);
    rotate(anguloFlor);

  }
  popMatrix();

}


void fractal(float tam, float angulo, float ancho)
{

  if (tam <1)
  {
    return;
  } 

  strokeWeight(ancho);
  line (0,0,0,tam);

  translate(0,tam);

  float novoTam =tam/1.8;
  float novoAncho=ancho/1.5;  

  // um lado
  pushMatrix();
  rotate(angulo/2);
  fractal(novoTam,angulo,novoAncho);
  popMatrix();

  // otro lado

  pushMatrix();
  rotate(-angulo/2);
  fractal(novoTam,angulo,novoAncho);
  popMatrix();


}





