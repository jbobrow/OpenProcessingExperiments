
//Dibujare un angry bird que se movera de manera random walker. 
//Cuando se clique en la ventana se cambiara la posicion del dibujo
//a la del mouse y la medida de las pupilas.
//El color de de las cejas variara en funcion de la posicion del dibujo.

int a,b;
int i;
int numAngry = 7;

//Creo una matriz de posiciones y vel con "numAngry" elementos:
float[] posicionsX = new float[numAngry];
float[] posicionsY = new float[numAngry];
float[] ojoDerecho = new float[numAngry];
float[] ojoIzquierdo = new float[numAngry];
color[] colorcejas = new color[numAngry];


void setup(){
  size(700,700);
  a = width;
  b = height;
  noCursor();
   
  //Inicializo posición X e Y inicial
  for(int i = 0 ; i<numAngry; i++){
  posicionsX[i] = a/2;
  posicionsY[i] = b/2;
 
  //Defino la medida de las pupilas inicial
  ojoDerecho[i] = 5;
  ojoIzquierdo[i] = 7;
  
  //Defuino color inicial random en los pupilas
  colorcejas[i] = color(random(255),random(255),random(255));
  }
}

void draw(){
  background(183,44,44);
for(int i=0;i<numAngry; i++){ 
  //Se genera un random walker en el movimiento del angry bird 
  //y el cambio de color de cejas
    posicionsX[i] += random(-10,10);
    posicionsY[i] += random(-10,10);
    colorcejas[i] = colorcejas[i]+10;
  //Determino el recorrido del random walker
    if((posicionsX[i]+50) >= a || (posicionsX[i]-50) <= 0) {
    posicionsX[i] = -posicionsX[i];
  }
  if((posicionsY[i]+50) >= b || (posicionsY[i]-50) <= 0) {
    posicionsY[i] = posicionsY[i];
  }
//Dibujo
  fill(255); //ojos
  stroke(0);
  strokeWeight(7);
  ellipse(posicionsX[i]-25,posicionsY[i]-7,50,50);
  ellipse(posicionsX[i]+25,posicionsY[i]-7,50,50);
  fill(0);  //pupilas
  ellipse(posicionsX[i]-20,posicionsY[i]-7, ojoDerecho[i], ojoDerecho[i]);
  ellipse(posicionsX[i]+15,posicionsY[i]-7, ojoIzquierdo[i], ojoIzquierdo[i]);
  strokeWeight(5);
  fill(colorcejas[i]);  //cejas
  quad(posicionsX[i]-60,posicionsY[i]-35,posicionsX[i],posicionsY[i]-15,posicionsX[i],posicionsY[i]-25,posicionsX[i]-52,posicionsY[i]-55);
  quad(posicionsX[i]+60,posicionsY[i]-30,posicionsX[i],posicionsY[i]-15,posicionsX[i],posicionsY[i]-25,posicionsX[i]+52,posicionsY[i]-45); 
  strokeWeight(5);  //boca
  fill(255,196,0);
  triangle(posicionsX[i]-40,posicionsY[i]+30,posicionsX[i],posicionsY[i],posicionsX[i]+50,posicionsY[i]+40);
  fill(234,173,40);
  triangle(posicionsX[i]-38,posicionsY[i]+32,posicionsX[i],posicionsY[i]+60,posicionsX[i]+40,posicionsY[i]+40);
  }
}

void mousePressed() {
  for(int i = 0; i<numAngry; i++){
  //Se genera un tamaño de pupila nuevo random
  ojoDerecho[i] = random(5,25);
  ojoIzquierdo[i] = random(5,25);
  //Se ejecuta el dibujo segun posicion del raton
  posicionsX[i] = mouseX;
  posicionsY[i] = mouseY;
  } 
}


