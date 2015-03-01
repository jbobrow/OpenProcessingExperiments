

//TWEAK Tomado de un tutorial 

int sz = 30;
int numeroBolas = 100;
int pX, pY, vX, vY;
int t = 30;


//creamos un array de posicionesX con "numeroBolas" elementos:
float[] posicionesX = new float[numeroBolas];
//y creamos un array de posicionesY:
float[] posicionesY = new float[numeroBolas];
//creamos un array de velocidadesX con "numeroBolas" elementos:
float[] velocidadesX = new float[numeroBolas];
//y creamos un array de velocidadesY:
float[] velocidadesY = new float[numeroBolas];


void setup() {
  size(800, 600);
  colorMode (HSB);
  //inicializamos las posiciones y velocidades:
  for (int i = 0; i<numeroBolas; i++) {
    posicionesX[i] = width/2;
    posicionesY[i] = height/2;
    velocidadesX[i] = random(1, 3);
    velocidadesY[i] = random(1, 3);
    
    pX = width/2;
  pY = height/2;
  vX = 20;
  vY = 20;
  }
}

void draw() {
  background(random(mouseX),mouseY,120);
pX = pX+vX;
  pY = pY+vY;
   
fill(random(t),255,255);
  ellipse(pX,pY,t*2,t*2);
   
  if((pX<0)||(pX>width)){
    vX = -vX;
  }
 
  if((pY<0)||(pY>height)){
    vY = -vY;
  }
if (mousePressed){
  pX = pX+vX;
  pY = pY+vY;
   
fill(random(t),255,255);
  ellipse(pX,pY,t,t);
   
  if((pX<0)||(pX>width)){
    vX = -vX;
  }
 
  if((pY<0)||(pY>height)){
    vY = -vY;
  }
}
  //primero, dibujamos toda las bolas:
  dibujaBolas();
  //y finalmente, dibujamos el marcador de la posiciÃ�Æ�Ã�Â³n media:
}

//////////////FUNCIONES(///////////////////////////////////

void dibujaBolas() {
 
  

  //iniciamos un bucle para que realize la acciÃ�Æ�Ã�Â¯Ã�â��Ã�Â¿Ã�â��Ã�Â½n para todos los
  //elementos del array:
  for (int i = 0; i<numeroBolas; i++) {
    //actualitzamos las posiciones
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];

    //comprobamos los bordes X
    if ((posicionesX[i]<0)||(posicionesX[i]>width)) {
      velocidadesX[i] = -velocidadesX[i];
    } 
    //comprobamos los bordes Y
    if ((posicionesY[i]<0)||(posicionesY[i]>height)) {
      velocidadesY[i] = -velocidadesY[i];
    } 

    //dibujamos las elipses:
    fill(random(sz),69,100);
    ellipse(posicionesX[i], posicionesY[i], sz, sz);
  }
  //acabado esto, dibujamos una elipse que represente la posiciÃ�Â³n media:
    //y dibujamos el elemento
  fill(random(sz),100,110);
  stroke(200,0,0);
  float xMedia = dameLaMedia(posicionesX);
  float yMedia = dameLaMedia(posicionesY);
  
  ellipse(xMedia,yMedia,sz,sz);
  line(xMedia-sz/4,yMedia,xMedia+sz/4,yMedia);
  line(xMedia,yMedia-sz/4,xMedia,yMedia+sz/4);
}

float dameLaMedia(float[] _a) {
  float suma=0, media =0;
 
  //sumamos todas las posiciones 
  for (int i = 0; i<numeroBolas; i++) {
   suma += _a[i];
  }
  //...y las dividimos por el nÃ�Æ�Ã�Âºmero de bolas:
  media = suma/numeroBolas;
  return media;
}

void mousePressed(){
   for (int i = 0; i<numeroBolas; i++) {
    posicionesX[i] = mouseX;
    posicionesY[i] = mouseY;
    velocidadesX[i] = random(1, 20);
    velocidadesY[i] = random(1, 5);
  }                            
}

