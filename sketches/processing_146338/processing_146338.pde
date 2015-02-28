
int sz = 20;
int numSkull = 10;
int colornuevo;
//Creamos la matriz de posiciones con el número de elementos que queremos mostrar:
float[] posicionesX = new float[numSkull];
float[] posicionesY = new float[numSkull];
//Y lo mismo para las velocidades en X e Y:
float[] velocidadesX = new float[numSkull];
float[] velocidadesY = new float[numSkull];
//También la introduciremos para el color de los ojos:
color[] colorojos = new color[numSkull];

//Inicio  
void setup(){
  //quitamos el cursor
  noCursor();
  //presentación o título del trabajo
  println("Skull _ P4");
  println("Asier García 2GEDI Grup03 _ Elisava");

  size (500,500);
  //posiciones i velocidades
    
  for(int i=0; i<numSkull; i++){
    posicionesX[i]=random (width/2+250, width/2-250);
    posicionesY[i]=random (height/2+250, height/2-250);
    velocidadesX[i]=random(1,4);
    velocidadesY[i]=random(1,4);
    colorojos[i] = color(random(255),random(255),random(255));
  }
      
}
void draw(){
  background(49,79,167);
    
  //Inicio del bucle
  for(int i = 0; i<numSkull; i++){
    //Restablecer las posiciones
    posicionesX[i] += random(-5,5);
    posicionesY[i] += random (-5,5);
  
 //Establecemos los límites de la ventana
    //posX:
    if(posicionesX[i]<2*10)
    {
      posicionesX[i] = 10*2;
    }
    if(posicionesX[i]>width-9*10/2)
    {
      posicionesX[i] = width-9*10/2;
    }
    //posY
    if(posicionesY[i]<2*10)
    {
      posicionesY[i] = 10*2;
    }
    if(posicionesY[i]>height-2*10)
    {
      posicionesY[i] = height-2*10;
    }
     
  
    
   //Establecemos el dibujo
   fill(colorojos[i]);
  dibujoSkull (posicionesX[i],posicionesY[i]);
  }
}
  
void dibujoSkull (float _x, float _y){
    
  int mySz=10;
  //Calavera
  //cabeza 1
   fill(255); 
  noStroke();
  fill(34,42,67);
  ellipse(_x/2,_y/4,100,100);
  //cuerpo1
  fill(34,42,67);
  rect((_x/2)-50,(_y/4),100,150);
  //cabeza 2
  noStroke();
  fill(255,255,255);
  ellipse((_x/2)-11,_y/4,75,75);
  rect((_x/2)-23.5,(_y/4)+22,25,25,2);
  //cara
  fill(colornuevo);
  ellipse((_x/2)-30,_y/4,20,25);
  ellipse((_x/2),_y/4,20,25);
  //palo
  stroke(116,69,52);
  strokeWeight(8);
  line(_x/2,_y/2,(_x/2)+80,_y/4);
  //guadaña
  noStroke();
  fill(187);
  ellipse((_x/2)+80,_y/4,50,60);
  fill(125,79,144);
  ellipse((_x/2)+80,_y/4-40,50,60);
}
void mousePressed(){
    
 colornuevo = color (mouseX, mouseY, 0);
}



