
float inicio1=0.0;
float fin1=PI*2;
float inicio2=0.5;
float fin2=5.61;
float temp=0.0;

void setup(){
//van las funciones de entorno


size(500,400);

strokeWeight(3);

smooth();

noStroke();

fill(255,255,0);

frameRate(8);

ellipseMode(CORNER);






}

void draw(){
  //van las instrucciones de dibujo
  
  temp=inicio1;
  inicio1=inicio2;
  inicio2=temp;
  temp=fin1;
  fin1=fin2;
  fin2=temp;
background(1);



arc(mouseX,mouseY,100,100,inicio1,fin1);



}


