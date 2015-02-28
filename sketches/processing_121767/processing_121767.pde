
//Nicolás Montes



void setup(){
  size(400,400);
  frameRate(2);
}

void draw(){
  background(25,25,112);
  int cigarrillo= color(240,150,90);
  int i=0;
  float posX = 300;
  float posY = 300;
  float tamano = 25;
  float humo=random(100,150);
  while(i<100){
    fill(cigarrillo);
    rect(10,300,75,25);
    fill(#ffffff);
    rect(85,300,200,25);
    fill(50,50,50);
    rect(285,300,25,25);
    noStroke();
    fill(humo,humo,humo,10);
    posX=posX+random((-15),15);
    ellipse(posX,posY,tamano,tamano);
    posY=posY-10;
    tamano=tamano+random(1,5);
    i=i+1;
  }
}


