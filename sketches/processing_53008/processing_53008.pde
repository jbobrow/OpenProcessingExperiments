
float inicio1=0;
float fin1=TWO_PI;
float inicio2=0.63;
float fin2=5.61;
float temp=0.0;

int posicionX;
int posicionX2;
int posicionX3;


void setup(){
  posicionX=100;
  posicionX2=150;
  posicionX3=90;

size(400,200);
smooth();
strokeWeight(2);
noStroke();
fill(255,255,0);
frameRate(7);
ellipseMode(CORNER);
}



void draw(){
background(0);


//pacman zombie
fill(70,171,3);
arc(mouseX,mouseY,100,100,inicio1,fin1);


//OJO
fill(0,0,0);
arc(mouseX,mouseY,30,30,0,TWO_PI);
fill(255,3,3);
arc(mouseX,mouseY,20,20,0,TWO_PI);





//persona
fill(255,249,13);
ellipse(posicionX,100,90,90);
fill(255,255,255);
ellipse(posicionX3,100,50,50);
ellipse(posicionX2,100,50,50);
fill(0,0,0);
ellipse(posicionX3,100,35,35);
ellipse(posicionX2,100,35,35);
fill(255,3,3);
rect(posicionX3,150,70,20);

temp=inicio1;
inicio1=inicio2;
inicio2=temp;
temp=fin1;
fin1=fin2;
fin2=temp;
   posicionX=posicionX+5;
  posicionX2=posicionX2+5;
   posicionX3=posicionX3+5;
}











