
//Inicio
int a = 13;
int b = 23;
int i;
int Arare = 17;

//Matriz de posición de las bocas
float[] posX = new float[Arare];
float[] posY = new float[Arare];

// Colores de la lengua
color[] colorArare = new color[Arare];
void setup(){
size(600,400);

//Origen posiciones
for(int i=0; i<Arare; i++){
posX[i] = (posX[i]+width/2)+(int)random(-25,25);
posY[i] = (posY[i]+height/2)+(int)random(-25,25);
colorArare[i] = color(random(255),random(100),random(100));
}
}

void draw(){
  
background(250,167,200);

//BUcle
for(int i=0; i<Arare; i++){
  
//Posiones inciales=random
posY[i] += random(-25,25);
posX[i] += random(-25,25);


//Límite de los rebotes, vertical
if(posY[i]<6*a){
posY[i] = a*6;
} 
if(posY[i]>height-6*a){
posY[i] = height-6*a;
} 

//Límite de los rebotes, horizontal
if(posX[i]<2*a){
posX[i] = a*2.3;
} 
if(posX[i]>width-8*a/2.2){
posX[i] = width-8*a/2.1;
} 

//Dibujamos las bocas
fill(0);
ellipse(posX[i],posY[i],5*a,12.5*a);
fill(colorArare[i]);
    //ala:
stroke(colorArare[i]);    
arc(posX[i],posY[i]+a,3*a,10*a,0,PI);

ellipse(posX[i],posY[i]+a,3*a,a);

fill(255,255,255);
stroke(0);    
ellipse(posX[i],posY[i]-2*a,2.5*a,a);
arc(posX[i],posY[i]-2*a,2.5*a,8*a,PI,2*PI);
  }
}

//Interacción Ratulí
void mousePressed(){
//Cambiar a blanco
colorArare = color(255,255,255);
//Agrandar con click
if(a<b){
a = a+1;
}
//Volver a estado inicial
if(a>=b){ 
a = 10;
}
}




