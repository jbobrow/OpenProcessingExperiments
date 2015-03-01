


float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
float mida= 60;
float red=255;
float green=255;
float blue=255;



void setup () {
  size (600, 450);
  posicioX=300;
  posicioY=100;
  velocitatX=random(15);
  velocitatY= random(15);
  mida= 40; 
  fill(255, 100, 100);
  rectMode(CENTER);
}

void draw() {


  
  
  posicioX= posicioX + velocitatX;
  posicioY= posicioY + velocitatY;
  
  //ACTUALITZACIÓ POSICIÓ
  fill(255);

  if (posicioX+(mida/2)>=width||posicioX-(mida/2)<=0) {
    velocitatX= -velocitatX;
  }
  if (posicioY+(mida/2)>=height||posicioY-(mida/2)<=0) {
    velocitatY=-velocitatY;
  }
  
   

  
  //COLOR
  fill(red, green, blue);  
  ellipse (posicioX, posicioY, mida, mida);
  fill (green, blue, red);
  ellipse (posicioX, posicioY, mida/1.5, mida/1.5);
  fill(blue, red, green);
  ellipse (posicioX, posicioY/2, mida, mida);
  fill (green, blue, red);
  ellipse (posicioX, posicioY/2, mida/1.5, mida/1.5);

 
}

//APRETAR MOUSE
void mouseReleased() {
  background(random(0,255), random(0, 255), random(0, 255));
  velocitatX= random (-15, 15);
  velocitatY= random (-15, 15);
  posicioX = pmouseX;
  posicioY = pmouseY;
  red = random(10, 255);
  green = random(10, 255);
  blue= random(10, 255);
}





