
int figuraX;
int figuraY;
int mano=0;

void setup(){
size(800,800);
frameRate(200);
figuraX=100;
figuraY=200;
mano=0;
;
}

void draw(){
  background(255);
 
 
 //lazo
rect(figuraX-10,figuraY-200,15,150);

//patitas1
rect(figuraX-50,figuraY+50,33,30);
rect(figuraX-60,figuraY+50,33,30);

//patitas2

rect(figuraX-1,figuraY+50,33,30);
rect(figuraX-5,figuraY+50,33,30);

//cuerpo
ellipse (figuraX,figuraY,237,129);

//cabeza
ellipse(figuraX+150,figuraY,113,108);

//ojo
ellipse(figuraX+175,figuraY-15,25,43);
ellipse(figuraX+180,figuraY-10,8,17);

//nariz
rect(figuraX+200,figuraY-10,23,27);
ellipse(figuraX+220,figuraY+5,4,14);

//oreja
line(figuraX+130,figuraY-40,figuraX+160,figuraY-75);
line(figuraX+160,figuraY-80,figuraX+160,figuraY-30);

//colita
noFill();
arc(figuraX-130,figuraY, 25, 25, -PI, 0);
arc(figuraX-155,figuraY, 25, 25, 0, PI);
arc(figuraX-180,figuraY, 25, 25, -PI, 0);


if (mano==0){
  figuraX=figuraX+1;
}

  fill(255,182,217);

//avanza a la derecha
if(figuraX > 690){
  
  mano=1;
  
}

//baja y cambia de color
if(figuraX > 690){
  fill(229,140,182);
  figuraY=figuraY+1;
 
}
 //avanza a la izquierda
if(figuraY >690){
  fill(244,86,162);
  figuraX=figuraX-1;
 
}

//sube
if(figuraX < 100){
  fill(255,0,122);
  figuraY=figuraY-1;
  
}

if(figuraY< 200){
  figuraX=figuraX+1;

}
}

