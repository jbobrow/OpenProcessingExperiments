
/* @pjs preload="corcho.png, flores.png, fotos.png, manuscrito.png, vacaciones.png, volver.png"; 
 */

PImage[] fondos = new PImage[5]; //Creamos un array para albergar 5 fondos
PImage volver; //Creamos una imagen para el boton volver
Boto[] botones = new Boto[5]; //Creamos un array para albergar 5 botones
int pantalla = 1; //Variable de control de pantalla

void setup(){
  size(998,680);  //Creamos una ventana de 998x680px
  botones[0] = new Boto();  //Llamamos al botón por defecto.
  volver = loadImage("volver.png"); //Cargamos el botón de volver
}

void draw(){
  
  //A partir de la variable mostramos las distintas pantallas
   switch(pantalla){
    case 1: principal("corcho.png"); break; 
    case 2: flores("flores.png"); break; 
    case 3: fotos("fotos.png"); break; 
    case 4: vacaciones("vacaciones.png"); break; 
    case 5: manuscrito("manuscrito.png"); break; 
   }
   
   //Activamos el click del botón principal
    botones[0].pressButton();

}
class Boto{
  
  int posX, posY, sizeX, sizeY, goTo;
  ///posX = Posición X; posY = Posición Y; sizeX = Tamaño X; sizeY = Tamaño Y; goTo = Ventana nueva;
  
 //Constructor por defecto, botón volver
 Boto(){
  
       posX = 8;
       posY = 8;
       sizeX = 48;
       sizeY = 48;
       goTo = 1;
       
 }
 
 //Constructor para las pantallas
 Boto(int pX, int pY, int sX,int  sY,int  gT){

       posX = pX;
       posY = pY;
       sizeX = sX;
       sizeY = sY;
       goTo = gT;
   
 }
 
 //Funcion para detectar si pulsamos el ratón en la posición del botón
 void pressButton(){
   
   if(mousePressed == true){ 
     if(mouseX > posX && mouseX < (posX+sizeX) && mouseY > posY && mouseY < (posY+sizeY)){
     pantalla = goTo;
     }
   }
   
 }
  
  
  
  
}
void flores(String bg){
 fondos[1] = loadImage(bg); //Cargamos el fondo
 image(fondos[1],0,0); //Mostramos el fondo
 image(volver,8,8); //Mostramos el botón volver
}
void fotos(String bg){
 fondos[2] = loadImage(bg); //Cargamos el fondo
 image(fondos[2],0,0);  //Mostramos el fondo
 image(volver,8,8); //Mostramos el botón volver
}
void manuscrito(String bg){
 fondos[4] = loadImage(bg); //Cargamos el fondo
 image(fondos[4],0,0); //Mostramos el fondo
 image(volver,8,8); //Mostramos el botón volver
}
void principal(String bg){ 
 fondos[0] = loadImage(bg); //Cargamos el fondo de la pantalla principal
 
 //Creamos el botón 1 y llamamos la funcion para pulsar
 botones[1] = new Boto(125,216,183,254,2);
 botones[1].pressButton();
 
 //Creamos el botón 2 y llamamos la funcion para pulsar
 botones[2] = new Boto(332,168,169,132,3);
 botones[2].pressButton();

 //Creamos el botón 3 y llamamos la funcion para pulsar
 botones[3] = new Boto(646,109,241,177,4);
 botones[3].pressButton();
 
//Creamos el botón 4 y llamamos la funcion para pulsar
 botones[4] = new Boto(564,389,161,197,5);
 botones[4].pressButton();
 
 image(fondos[0],0,0); // Mostramos el fondo de la pantalla principal
  
}
void vacaciones(String bg){
 fondos[3] = loadImage(bg); //Cargamos el fondo
 image(fondos[3],0,0);  //Mostramos el fondo
 image(volver,8,8); //Mostramos el botón volver
}


