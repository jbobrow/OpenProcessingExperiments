
//Programa que utiliza random walker para mover unos pollitos.
//Práctica 4. Victor Sarroca. Grupo 03

int numPollos=15;
int sz=40;
int colorNuevo;
//Matrices de posición
float[] posx= new float[numPollos];
float[] posy= new float[numPollos];
//Matrices de velicidad
float[] velx= new float[numPollos];
float[] vely= new float[numPollos];
//Matriz de color
color[] colorMofletes = new color[numPollos];

void setup(){
  size(600,600);
//Determinamos el origen de las posiciones, velicidades y color
  for(int i=0; i<numPollos; i++){
    posx[i]=random (width/2-10,width/2+10);
    posy[i]=random (height/2-10,height/2+10);
    velx[i]=random(1,3);
    vely[i]=random(1,3);
    colorMofletes[i]= color(random(255),random(0),random(0));
  }
}

void draw(){
  background(255);
  //Iniciacion del bucle con las mismas acciones para los valores de la matriz
  for(int i=0; i<numPollos; i++){
    //Determinamos posiciones iniciales de nuevo
    posx[i] += random(-5,5);
    posy[i] += random(-5,5);
    //Límites
    if(posx[i]<20)
    {
      posx[i]=20;
    }
    if(posx[i]>width-50/2)
    {
      posx[i]=width-50/2;
    }
    
    if(posy[i]<20)
    {
      posy[i]=20;
    }
    if(posy[i]>height-50/2)
    {
      posy[i]=height-50/2;
    }
    //Dibujo Pollos
    dibujoPollos (posx[i],posy[i]);
  }
}
 
void dibujoPollos (float _x, float _y){
   
//cara 
fill(245,250,13);
strokeWeight(2);
   ellipse(_x,_y,100,100);
   //pico
   fill(245,148,30);
   triangle(_x-15,_y,_x+15,_y,_x,_y+20);
   //ojos
   fill(0);
   ellipse(_x-25,_y-20,10,20);
   ellipse(_x+25,_y-20,10,20);
   //Mofletes
   fill(colorNuevo);
   ellipse(_x-32,_y+10,15,15);
   ellipse(_x+32,_y+10,15,15);
   
  }
  //Realizando clics en diferentes puntos de la pantalla el color de los mofletes cambia
  void mousePressed(){
    colorNuevo= color(mouseX,mouseY,255);
  }
  
  


