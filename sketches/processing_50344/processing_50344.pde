
float inicio1=0.0;  //float es un variable que te permite decimales
float fin1=TWO_PI;    //int es un variable que te permite numeros enteros
float inicio2=0.63;
float fin2=5.61;
float temp=0.0;

void setup(){
  size(400,400);
  fill(255,250,0);
  strokeWeight(2);
  smooth();
  noStroke();
  frameRate(7);
  ellipseMode(CORNER); //poner el pointer en la esquina
}

void draw (){
  background(0);
arc(mouseX,mouseY,100,100,inicio1,fin1);
fill(0);
arc(mouseX+25,mouseY+20,25,25,inicio1,fin1);
fill(123,84,3);
ellipse(mouseX,mouseY-10,100,25);
ellipse(mouseX+25,mouseY-30,50,40);

fill(123,84,3);
fill(255,250,0);

temp=inicio1;  //crear una memoria temp para poder sincronizar los valores
inicio1=inicio2;
inicio2=temp;

temp=fin1;
fin1=fin2;
fin2=temp;

}


