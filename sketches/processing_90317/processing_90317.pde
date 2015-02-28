
//Se declaran las variables
int posX;
int posY;
int b;
float distX;
float distY;

//declara las variables para el modo dinámico
//------------------
void setup(){
  size(640, 480);
  background(230,167, 23);
  
  posX = 5;
  posY = height/2;
  b = 0;
  distX = 0;
  distY = 0;
}

//------------------
void draw(){
  //background(b%230,167, 23);  
  fill(b%230,167, 23, 5);
  noStroke();
  rect(0,0,width, height);
  
  distX = abs(mouseX - pmouseX);
  distY = abs(mouseY - pmouseY);
  
  fill(26, 30, 108);
  noStroke();
  ellipse(posX, 240, 100,100);
  
  fill(62, 108, 25);
  noStroke();
  ellipse(mouseX, mouseY, distX, distY);
  
  //pmouseX = posición en X previa del ratón
  
  //posX = posX+1;
  posX++;
  b++;
  
  fill(108, 25,104);
  noStroke();
  ellipse(320, posY, 80, 80);
  posY = posY+1;
  
  
}


