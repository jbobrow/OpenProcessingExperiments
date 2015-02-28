
//Maite Iriondo Lozano-Grupo2-Seminario5



int sz = 70;
int numeroBolas = 20;
float x,y;
int NumBolas=10;

var audioElement1 = document.createElement ("audio");
var audioElement2 = document.createElement ("audio");

 
//creamos un array de posicionesX con "numeroBolas" elementos:
float[] posicionesX = new float[numeroBolas];
//y creamos un array de posicionesY:
float[] posicionesY = new float[numeroBolas];
//creamos un array de velocidadesX con "numeroBolas" elementos:
float[] velocidadesX = new float[numeroBolas];
//y creamos un array de velocidadesY:
float[] velocidadesY = new float[numeroBolas];
 
void setup(){
  
  size(600,600);
  
 audioElement1.setAttribute("src","bhs.mp3");
 audioElement1.play();
  
  //inicializamos las posiciones y velocidades:
  for(int i = 0; i<numeroBolas; i++){
    posicionesX[i] = int(random(35,width-35));
    posicionesY[i] = int(random(35,height-35));

    velocidadesX[i] = random(1,4);
    velocidadesY[i] = random(1,4);
  }
}
 
void draw(){
  background(255);
   
   //(Fondo de repetición)
  //Determinamos un patrón de repetición en el eje X y Y
  for(int i=0; i<NumBolas; i=i+1)
  
    {
  for (int j=0; j<NumBolas; j=j+1)
      {
        x=map(i,0,NumBolas-1,10,width-10);
        y=map(j,0,NumBolas-1,10,height-10);
         
         
        //Si j es mas grande o igual que i, se cumplen unas características
        if(j>=i)
        {
          fill(160,247,247,75);
          stroke(173,223,255);
        }
        //...y sino se cumplen estas otras
        else
        {
        fill(random(100,255), random(100,255),random (100,255));}
        ellipse(x,y,100,100);
        ellipse(x,y,50,50);
        }
         
        }
         
   
 
  //iniciamos un bucle para que realize la acción para todos los
  //elementos del array:
  for(int i = 0; i<numeroBolas; i++){
    //actualitzamos las posiciones
    posicionesX[i]= velocidadesX[i]+posicionesX[i];
    posicionesY[i]= velocidadesY[i]+posicionesY[i];
 
    //comprobamos los bordes X
    if((posicionesX[i]-35<0)||(posicionesX[i]+35>width)){
      velocidadesX[i] = -velocidadesX[i];
      audioElement2.setAttribute("src","boing.mp3");
      audioElement2.play(); 
    }
    //comprobamos los bordes Y
    if((posicionesY[i]-35<0)||(posicionesY[i]+35>height)){
      velocidadesY[i] = -velocidadesY[i];
     audioElement2.setAttribute("src","boing.mp3");
     audioElement2.play(60);
   
    }
  }
 
  //acabado el proceso, creamos otro bucle
  //donde dibujamos las elipses:
  for(int i = 0; i<numeroBolas; i++){
    fill(255,150);
    ellipse(posicionesX[i],posicionesY[i],sz,sz);
    fill(163,249,252,150);
    ellipse(posicionesX[i],posicionesY[i],sz/2,sz/2);
  }
}



