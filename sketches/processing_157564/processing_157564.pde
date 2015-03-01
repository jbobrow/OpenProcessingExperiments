

int numOfBalls = 4;
float velIniX = 1;
float velIniY = 1;
int ballSize = 40;
int incrMax = 1;
int incrMin = 1;

int width = 480;
int height = 650;


boolean MenuShowed = false;

PImage buttonImage1, buttonImage2, buttonImage; 
PImage buttonImage3, buttonImage4; 

float[] posX = new float[numOfBalls];
float[] posY = new float[numOfBalls];
float[] posZ = new float[numOfBalls];

float[] colorsR = new float[numOfBalls];
float[] colorsG = new float[numOfBalls];
float[] colorsB = new float[numOfBalls];

float[] velX = new float[numOfBalls];
float[] velY = new float[numOfBalls];
float[] velZ = new float[numOfBalls];
    
void setup(){
  
size(width,height);
buttonImage1 = loadImage("BOTON1.png");
buttonImage2 = loadImage("BOTON2.png");
buttonImage = buttonImage1;
buttonImage3 = loadImage("BOTON3.png");
buttonImage4 = loadImage("BOTON4.png");

frameRate(15);
smooth();

for(int i = 0; i<(posX.length); i++){
    posX[i] = (width/2)+(random(-30,30));
    posY[i] = (height/2)+(random(-30,30));
    posZ[i] = (ballSize+i/5);

    colorsR[i] = int(random(0,255));   
    colorsG[i] = int(random(0,255)); 
    colorsB[i] = int(random(0,255));     
  }
}

void draw(){

background(0);
imageMode(CENTER);
image(buttonImage, (buttonImage.width)/2 , (buttonImage.height)/2); 

int randMax = 1; 

if((ballSize/20)>=1) {
  randMax = int(ballSize/20);
}

if(numOfBalls<1){
  numOfBalls = 1;
}
if(velIniX<0){
  velIniX = 0;
}
if(velIniY<0){
  velIniY = 0;
}

if(ballSize<0){
  ballSize = 0;
}
if(incrMax<0){
  incrMax = 0;
}
if(incrMin<0){
  incrMin = 0;
}

//iniciamos un bucle para que realize la acción para todos los
//elementos del array:
for(int i = 0; i<(posX.length); i++){

  velX[i] = (random(-randMax,randMax));
  velY[i] = (random(-randMax,randMax));
  velZ[i] = (random(-(incrMin),(incrMax)));
//  int aleatorio = int(5*(random(-20,20)));
  
  //comprobamos los bordes X
  if((posX[i]<(ballSize/2))&&(velX[i]<0)){
    velX[i] = -velX[i];
        } 
  if((posX[i]>(width-(ballSize/2)))&&(velX[i]>0)){
    velX[i] = -velX[i];
        }        
        
  //comprobamos los bordes Y 
  if((posY[i]<(ballSize/2))&&(velY[i]<0)){
    velY[i] = -velY[i];
        } 
  if((posY[i]>(height-(ballSize/2)))&&(velY[i]>0)){
    velY[i] = -velY[i];
        }   

  //comprobamos los tamaños Z 
  if((posZ[i]<(ballSize-incrMin))&&(velZ[i]<0)){
    velZ[i] = -velZ[i];
        } 
  if((posZ[i]>(ballSize+incrMax))&&(velZ[i]>0)){
    velZ[i] = -velZ[i];
        }        

  //actualizamos las pos
  posX[i] = (posX[i])+(velIniX)*(velX[i]);
  posY[i] = (posY[i])+(velIniY)*(velY[i]);
  posZ[i] = (posZ[i])+(velZ[i]);
  
  } 
//acabado el proceso, creamos otro bucle
//donde dibujamos las líneas:
for(int i = 0; i<(posX.length); i++){ 
  int colorsL = int(random(130,255)); 
  strokeWeight(int(ballSize/(2*numOfBalls)));
  stroke(colorsL, colorsL, colorsL);
  for(int j = 0; j<((posX.length)); j++){   
    line(posX[i],posY[i],posX[j],posY[j]);
  }  
}

//y donde dibujamos las elipses o bolas: 
for(int i = 0; i<(posX.length); i++){ 
  strokeWeight(int(ballSize/(numOfBalls*2))+1);
  stroke(0);
  fill(colorsR[i], colorsG[i], colorsB[i]); 
  ellipse(posX[i],posY[i], posZ[i], posZ[i]); 
//  print(posX[i]);
//  print(" - ");
//  println(posY[i]);
  
}

if(!MenuShowed) {
  // Dibujar la imagen del BOTON MENU1 (NO mostrar el MENU)       
  buttonImage = buttonImage2;
}
else{
  // Dibujar la imagen del BOTON MENU2 (SI mostrar el MENU)         
  buttonImage = buttonImage1;

  // Dibujar MENU:

  fill(15,90,10);
  strokeWeight(1);
  rect(3,75,290,360); // Rectangulo muy grande  
  
  fill(50,200,50);   
  strokeWeight(2);
  rect(5,77,165,357);  // Rectangulo grande cartel

  image(buttonImage3, 202, 105); // Rectangulo pequeño + de Num bolas
  image(buttonImage4, 264, 105); // Rectangulo pequeño - de Num bolas
  image(buttonImage3, 202, 165); // Rectangulo pequeño + de Vel eje X 
  image(buttonImage4, 264, 165); // Rectangulo pequeño - de Vel eje X
  image(buttonImage3, 202, 225); // Rectangulo pequeño + de Vel eje Y 
  image(buttonImage4, 264, 225); // Rectangulo pequeño - de Vel eje Y 
  image(buttonImage3, 202, 285); // Rectangulo pequeño + de Tam bolas 
  image(buttonImage4, 264, 285); // Rectangulo pequeño - de Tam bolas 
  image(buttonImage3, 202, 345); // Rectangulo pequeño + de Tam max 
  image(buttonImage4, 264, 345); // Rectangulo pequeño - de Tam max 
  image(buttonImage3, 202, 405); // Rectangulo pequeño + de Tam min  
  image(buttonImage4, 264, 405); // Rectangulo pequeño - de Tam min 
  
  fill(30,160,20);
  strokeWeight(1);
  rect(8,88,159,30);  // Rectangulo grande Num bolas 
  rect(8,148,159,30);  // Rectangulo grande Num bolas 
  rect(8,208,159,30);  // Rectangulo grande Num bolas 
  rect(8,268,159,30);  // Rectangulo grande Num bolas 
  rect(8,328,159,30);  // Rectangulo grande Num bolas 
  rect(8,388,159,30);  // Rectangulo grande Num bolas   
  
  fill(0);
  textSize(20);
  text("Num. balls:   " + numOfBalls, 10, 110);
  text("Vel.  X:       " + velIniX, 10, 170);
  text("Vel.  Y:       " + velIniY, 10, 230);
  text("Size balls:     " + ballSize, 10, 290);
  text("Max. increm: " + incrMax, 10, 350);
  text("Min. increm:  " + incrMin, 10, 410);

  }
}

void mouseDragged()
{
int A;

if (ballSize<15) {
  A = 15;
}
else {
  A = ballSize;
}

if(!MenuShowed) {
  for(int i = 0; i<(posX.length); i++){
    if(((mouseX)>(posX[i]-(A)))&&((mouseX)<(posX[i]+(A)))&&((mouseY)>(posY[i]-(A)))&&((mouseY)<(posY[i]+(A)))){
      posX[i] = (mouseX); 
      posY[i] = (mouseY);     
      }
    }
  }    
}

void mousePressed()
{
  // Pulsación en boton de MENU
if((mouseX>0)&&(mouseX<80)&&(mouseY>0)&&(mouseY<80)){
  MenuShowed = !MenuShowed;
  }

if(MenuShowed) {
  
  // Pulsación en boton 1 (incremento de numero de bolas en uno)
  if((mouseX>(202-(buttonImage3.width)/2))&&(mouseX<(202+(buttonImage3.width)/2))&&(mouseY>(105-(buttonImage3.width)/2))&&(mouseY<(105+(buttonImage3.width)/2))){
    numOfBalls +=1;
  
    posX = expand(posX, numOfBalls);
    posY = expand(posY, numOfBalls);
    posZ = expand(posZ, numOfBalls);
  
    velX = expand(velX, numOfBalls);
    velY = expand(velY, numOfBalls);
    velZ = expand(velZ, numOfBalls);

    colorsR = expand(colorsR, numOfBalls);
    colorsG = expand(colorsG, numOfBalls);
    colorsB = expand(colorsB, numOfBalls);  

    //Cuando genero una bola nueva tengo que asignar su posición nueva y su color:
    posX[numOfBalls-1] = (width/2)+(random(-30, 30));
    posY[numOfBalls-1] = (height/2)+(random(-30, 30));
    posZ[numOfBalls-1] = (ballSize+(random(-3, 3)));

    colorsR[numOfBalls-1] = int(random(0,255));   
    colorsG[numOfBalls-1] = int(random(0,255)); 
    colorsB[numOfBalls-1] = int(random(0,255));

    }
  // Pulsación en boton 2 (decremento de numero de bolas en uno)
  if((mouseX>(264-(buttonImage4.width)/2))&&(mouseX<(264+(buttonImage4.width)/2))&&(mouseY>(105-(buttonImage4.width)/2))&&(mouseY<(105+(buttonImage4.width)/2))){
    if(numOfBalls>1){
      numOfBalls -=1;
 
      posX = shorten(posX);
      posY = shorten(posY);
      posZ = shorten(posZ);
  
      velX = shorten(velX);
      velY = shorten(velY);
      velZ = shorten(velZ);

      colorsR = shorten(colorsR);
      colorsG = shorten(colorsG);
      colorsB = shorten(colorsB);  
      }
  }
  // Pulsación en boton 3 (incremento de velocidad eje X en uno)
  if((mouseX>(202-(buttonImage3.width)/2))&&(mouseX<(202+(buttonImage3.width)/2))&&(mouseY>(165-(buttonImage3.width)/2))&&(mouseY<(165+(buttonImage3.width)/2))){
    velIniX +=1;
    }
  // Pulsación en boton 4 (decremento de velocidad eje X en uno)
  if((mouseX>(264-(buttonImage4.width)/2))&&(mouseX<(264+(buttonImage4.width)/2))&&(mouseY>(165-(buttonImage4.width)/2))&&(mouseY<(165+(buttonImage4.width)/2))){
    if(velIniX>0){
      velIniX -=1;
      }
    }
  // Pulsación en boton 5 (incremento de velocidad eje Y en uno)
  if((mouseX>(202-(buttonImage3.width)/2))&&(mouseX<(202+(buttonImage3.width)/2))&&(mouseY>(225-(buttonImage3.width)/2))&&(mouseY<(225+(buttonImage3.width)/2))){
    velIniY +=1;
    }
  // Pulsación en boton 6 (decremento de velocidad eje Y en uno)
  if((mouseX>(264-(buttonImage4.width)/2))&&(mouseX<(264+(buttonImage4.width)/2))&&(mouseY>(225-(buttonImage4.width)/2))&&(mouseY<(225+(buttonImage4.width)/2))){
    if(velIniY>0){
      velIniY -=1;
      }
    }
  // Pulsación en boton 7 (incremento de tamaño bolas en uno)
  if((mouseX>(202-(buttonImage3.width)/2))&&(mouseX<(202+(buttonImage3.width)/2))&&(mouseY>(285-(buttonImage3.width)/2))&&(mouseY<(285+(buttonImage3.width)/2))){
    ballSize +=1;
    }
  // Pulsación en boton 8 (decremento de tamaño bolas en uno)
  if((mouseX>(264-(buttonImage4.width)/2))&&(mouseX<(264+(buttonImage4.width)/2))&&(mouseY>(285-(buttonImage4.width)/2))&&(mouseY<(285+(buttonImage4.width)/2))){
    if(ballSize>0){
      ballSize -=1;
      }
    }
  // Pulsación en boton 9 (incremento de tamaño maximo de bolas en uno)
  if((mouseX>(202-(buttonImage3.width)/2))&&(mouseX<(202+(buttonImage3.width)/2))&&(mouseY>(345-(buttonImage3.width)/2))&&(mouseY<(345+(buttonImage3.width)/2))){
    incrMax +=1;
    }
  // Pulsación en boton 10 (decremento de tamaño maximo bolas en uno)
  if((mouseX>(264-(buttonImage4.width)/2))&&(mouseX<(264+(buttonImage4.width)/2))&&(mouseY>(345-(buttonImage4.width)/2))&&(mouseY<(345+(buttonImage4.width)/2))){
    if(incrMax>0){
      incrMax -=1;
      }
    }
  // Pulsación en boton 11 (incremento de tamaño minimo de bolas en uno)
  if((mouseX>(202-(buttonImage3.width)/2))&&(mouseX<(202+(buttonImage3.width)/2))&&(mouseY>(405-(buttonImage3.width)/2))&&(mouseY<(405+(buttonImage3.width)/2))){
    incrMin +=1;
    }
  // Pulsación en boton 12 (decremento de tamaño minimo bolas en uno)
  if((mouseX>(264-(buttonImage4.width)/2))&&(mouseX<(264+(buttonImage4.width)/2))&&(mouseY>(405-(buttonImage4.width)/2))&&(mouseY<(405+(buttonImage4.width)/2))){
    if(incrMin>0){
      incrMin -=1;
      }
    }
  }
}


