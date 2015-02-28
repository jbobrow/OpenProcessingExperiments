
//variables globales
int cantidad=50;
color[][] tonos=new color[cantidad][cantidad];
int ancho;
int largo;
int tono=47;;
PImage destello;


//estableciendo bases 
void setup() {
 destello=loadImage("destello.png");
  noCursor();
  ellipseMode(CORNER);
  smooth();
  frameRate(1000);
  colores(cantidad);
  //size(500, 1000);
  background(0,0,100);
  size(600,600);
  ancho=int(width/cantidad);
  largo=int(height/cantidad);
}
void draw() {
  
 
colorMode(RGB, 100);
stroke(216,234,199);
strokeWeight(0.0001);
noStroke();
//tono=20;
rectangulos(cantidad);
//tono=int(map(mouseX,0,width,0,100));
}

//variables de colores
//int tono=47;//verde 

//int tono=80 //morado
int sat=81;//ocre
//int sat=66;//ocre
int brillo;
int alfa;

//funcion de colores
void colores(int cant) {
  colorMode(HSB, 100);
  alfa=100;
  for (int contA=0;contA<cant;contA++) {
    for (int contB=0;contB<cant;contB++) {
      if(contA==0 || contA==cant-1){
      tonos[contA][contB]=color(tono, sat, 60,10); 
    }
      else if(contB==0 || contB==cant-1){
      tonos[contA][contB]=color(tono, sat, 60,10);  
    }
    else{
      brillo=int(random(50, 70));  
      tonos[contA][contB]=color(tono, sat, brillo,10);  }
    }
  }
}

void rectangulos(int cant) {
  for (int contA=0;contA<cant;contA++) {
    for (int contB=0;contB<cant;contB++) {
      evento(contA,contB);
      fill(tonos[contA][contB],alfa);
      if (alfa<100){
      alfa+=ceil(0.01);
      }
      ellipse(contB*ancho, contA*largo, ancho, largo);     
    }
  }
  mouseCircle();
}

int cambia;
void evento(int posA,int posB){ 
  colorMode(HSB, 100);
cambia=int(random(0,300));
if(posA!=0 && posB !=0 && posA!=(cantidad-1) && posB!=(cantidad-1) && cambia>=35 && cambia<=35.5){
alfa=0;
brillo=int(random(50, 90));  
tonos[posA][posB]=color(tono, sat, brillo,40);}
}
//Global variables para el mouse
int mousePosX;
int mousePosY;
int contInt=-5;

//funcion que crea el destello del mouse
void mouseCircle(){
mousePosX=round(map(mouseX,0,width,0,cantidad));
mousePosY=round(map(mouseY,0,height,0,cantidad));
//fill(47,0,100,100);
imageMode(CENTER);
 image(destello,mousePosX*ancho,mousePosY*largo);
//ellipse(mousePosX*ancho,mousePosY*largo,ancho, largo);
int jcolor=0;
for(int aa=-5;aa<6;aa++){
  
//lineas de enmedio
if(aa==0){  
  for(int bb=-5;bb<6;bb++){
    jcolor=110-(abs(bb)*10);
    fill(47,81,jcolor,20);
ellipse(mousePosX*ancho+(bb*ancho),mousePosY*largo,ancho, largo);
jcolor=40;
  }
}

//lineas de arriba

if(aa==-5|| aa==5){
fill(47,81,70,20);
for(int bb=-1;bb<2;bb++){
ellipse(mousePosX*ancho+(bb*ancho),mousePosY*largo+(aa*largo),ancho, largo);
}
}

if(aa==-4|| aa==4){
for(int bb=-2;bb<3;bb++){
   jcolor=90-(abs(bb)*10);
    fill(47,81,jcolor,20);
ellipse(mousePosX*ancho+(bb*ancho),mousePosY*largo+(aa*largo),ancho, largo);
}
jcolor=0;
}

if(aa==-3|| aa==3){
for(int bb=-3;bb<4;bb++){
  jcolor=90-(abs(bb)*10);
    fill(47,81,jcolor,20);
ellipse(mousePosX*ancho+(bb*ancho),mousePosY*largo+(aa*largo),ancho, largo);
}
jcolor=0;
}

if(aa==-2|| aa==2){
for(int bb=-4;bb<5;bb++){ 
   jcolor=100-(abs(bb)*10);
    fill(47,81,jcolor,20);
ellipse(mousePosX*ancho+(bb*ancho),mousePosY*largo+(aa*largo),ancho, largo);
}
jcolor=0;
}
int ap;
if(aa==-1|| aa==1){
for(int bb=-5;bb<6;bb++){
   jcolor=110-(abs(bb)*10);
    fill(47,81,jcolor,20);
ellipse(mousePosX*ancho+(bb*ancho),mousePosY*largo+(aa*largo),ancho, largo);
jcolor=0;
}
}

}
contInt=0;
println(mousePosX);

}


