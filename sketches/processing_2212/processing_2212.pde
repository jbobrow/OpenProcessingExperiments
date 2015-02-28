

float sz = 10;
int numeroBolas = 150;
float g = 255;
float b = 0;
float c1, c2, c3, c4;

//creamos un array de posicionesX con "numeroBolas" elementos:
int[] posicionesX = new int[numeroBolas];
//y creamos un array de posicionesY:
int[] posicionesY = new int[numeroBolas];
//creamos un array de velocidadesX con "numeroBolas" elementos:
float[] velocidadesX = new float[numeroBolas];
//y creamos un array de velocidadesY:
float[] velocidadesY = new float[numeroBolas];




void setup () {
    size (800,500);

  
  
  
  
 
  c1=300;
  c2=200;
  c3=100;
  c4=800;

  background (255);
  
    //inicializamos las posiciones y velocidades:
  for(int i = 0; i<numeroBolas; i++){
    posicionesX[i] = int(random(width));
    posicionesY[i] = int(random(height));
    velocidadesX[i] = random(2,10);
    velocidadesY[i] = random(2,10);
  }
 strokeWeight (0.2);
  smooth();
  
  noCursor ();
  
 
  
}





void draw () {
  
 fill (255,80);
 rect(0,0,width,height);
 

 
  //actualitzamos las posiciones
  for(int i = 0; i<numeroBolas; i++){
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];


    //comprobamos las posiciones X
    if((posicionesX[i]<0)||(posicionesX[i]>width) ){
      velocidadesX[i] = -velocidadesX[i];
    } 
    //comprobamos las posiciones Y
    if((posicionesY[i]<0)||(posicionesY[i]>height) ){
      velocidadesY[i] = -velocidadesY[i];
    } 
  }


  //dibujamos las elipses:
  for(int i = 0; i<numeroBolas; i++){
    //colorMode(HSB,numeroBolas);
   noFill ();
    //stroke (i,g,b);
    stroke (60);
   
    bezier(posicionesX[i],c1,c2,c3,c4,posicionesY[i], mouseX,mouseY);
  }



////// teclas que cambian los parametros de las curvas

 if(keyPressed) {
  if (key == 'A' || key == 'a') {

    c1 = c1+10;
    // print ("c1 "+c1);
 
       }
    }
  
  
  
   if(keyPressed) {
  if (key == 'Z' || key == 'z') {

    c1 = c1-10;
     //print ("c1 "+c1);
 
       }
    }
  
  
  
  
  
   if(keyPressed) {
  if (key == 'S' || key == 's') {

    c2 = c2+10;
    //  print ("c2 "+c2);
 
       }
    }
  
  
  
   if(keyPressed) {
  if (key == 'x' || key == 'X') {

    c2 = c2-10;
  //  print ("c2 "+c2);
 
       }
    }
  
  
  
  
   if(keyPressed) {
  if (key == 'd' || key == 'D') {

    c3 = c3+10;
    // print ("c3 "+c3);
   
 
       }
    }
  
  
  
   if(keyPressed) {
  if (key == 'c' || key == 'C') {

    c3 = c3-10;
   // print ("c3 "+c3);
 
       }
    }
  
  
  
  
   if(keyPressed) {
  if (key == 'f' || key == 'F') {

    c4 = c4+10;
   // print ("c4 "+c4);
 
       }
    }
  
  
  
   if(keyPressed) {
  if (key == 'v' || key == 'V') {

    c4 = c4-10;
  //  print ("c4 "+c4);
    
 
       }
    }
    
    
    

    
  
  }



 
















