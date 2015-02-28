
//Se declaran las variables
int posX;
int posY;
int b;
float distX;
float distY;

//-------------------------
void setup(){
  //definimos el tamaño del lienzo
  size(640, 480);
  //definimos el color inicial del lienzo
  //background(30, 67, 0);
  
  //asignamos valor inicial a las variables declaradas
  posX = 0;
  posY = height/2;
  b = 0;
  distX = 0;
  distY = 0;

}

//-------------------------
void draw(){
  //No usamos el background, en vez dibujamos un rectangulo
  //del tamaño del lienzo con un alpha pequeño
  //Experimenta cambiando el valor de alfa
  noStroke();
  fill(230, 167, b%255, 2);
  rect(0,0, width, height);
  
  //Medimos la distancia entre la posición del mouse actual
  // y la anterior en ambas direcciones 'X' y 'Y'
 
  //pmouseX: posición previa del ratón en X; 
  distX = abs(mouseX - pmouseX);
  distY = abs(mouseY - pmouseY);  
  
  //Dibujamos una elipse en la posición posX y posY 
  stroke(30,150, 230, 27);
  fill(85, 185, b%255, 27);
  ellipse(posX%width, posY%height, 50, 50);
  
  //Dibujamos una elipse en la posición mouseX y mouseY
  // con un tamaño dependiente de las distancias previamente calculadas
  stroke(230,150, 230, 64);
  fill(b%255, 0, 150, 32);
  ellipse(mouseX, mouseY, 5+distX*2, 5+distY*2);
  
  //Dibujamos una linea entre el centro de ambas elipses
  stroke(230, 0, 0, 64);
  line(posX%width, posY%height, mouseX, mouseY);
  
  //Incrementamos el valor de la posición en X para simular movimiento
  // en la dirección horizontal 
  posX++;
  
  //Incrementamos el valor de b para usarlo en el contró dinámico de colores
  b++;
  
//  posX = posX + 1; esto es igual a: posX++;

//  posX = posX + 2; 
//  posX += 2;
//  
//  posX = posX * 2;
//  posX *= 2;
//  
//  posX = posX - 1;
//  posX--;
}



