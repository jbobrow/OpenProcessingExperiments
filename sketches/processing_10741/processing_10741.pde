
int colorR=200,colorA=200,colorV=200;
int anchoCuadro=15;
int altoCuadro=250;
int separacion=2;
 int cantidadCuadros=35;
int contador=0;
boolean presionar = true; 

int numChars = 26;
color[] colors = new color[numChars];
int keyIndex;
float keyScale;
int rectWidth;
boolean colores = false;
color colorUno=#4E951D;
color colorDos=#FFD683;

int cadaUno=0;
int [] posX= new int[cadaUno];
boolean []activados= new boolean[26];
void setup(){
  
 
size(500,500);
keyScale = 500/numChars-1.0;
  rectWidth = width/4;
  for(int j=0; j<activados.length; j++){
    activados[j]=false;
}
  
}



void draw(){

for(int fila=0;fila<2;fila++){
  for(int columna=0;columna<cantidadCuadros;columna++){
    
   
    if(fila==0){
      
    if(columna%2==0){
      fill(colorDos);
      }else{
      fill(colorUno);
      }
      }else{
        
      if(columna%2==0){
      fill(colorUno);
      }else{
      fill(colorDos);
      }
      }
         for(int i=0;i<cadaUno;i++){
        if(activados[i]==true){
          rect(posX[1],0,rectWidth, height);
      }
      
  }   
      rect(columna*anchoCuadro,fila*altoCuadro,50,250);
      
     }

 }
 colorR +=(int)random(-10,10);
   colorV +=(int)random(-10,10);
   colorA +=(int)random(-10,10);   
   
 
 for(int fila=0;fila<1;fila++){
   for(int columna=0;columna<cantidadCuadros;columna++){
     
  fill(#DCFF00);
 
rect(columna*anchoCuadro*separacion,fila*altoCuadro,15,250);
  
 }
 
}
  
 for(int j=0; j<activados.length; j++){
   if(activados[j]==true){
     fill(colorR,colorV,colorA);
   rect(20*j, 0.0, rectWidth/6, height);
   }
    
    
    
    }
 
 }
 
 
 
 
 void keyPressed(){
  if(key >= 'A' && key <= 'y') { 
   if(key=='a'){
   activados[0] =!  activados[0];
   }
      if(key=='b'){
   activados[1] =!  activados[1];
   }
   
   if(key=='c'){
   activados[2] =!  activados[2];
   }
   
   if(key=='d'){
   activados[3] =!  activados[3];
   }
   if(key=='e'){
   activados[4] =!  activados[4];
   }
   if(key=='f'){
   activados[5] =!  activados[5];
   }
   if(key=='g'){
   activados[6] =!  activados[6];
   }
   if(key=='h'){
   activados[7] =!  activados[7];
   }
   if(key=='i'){
   activados[8] =!  activados[8];
   } 
   if(key=='j'){
   activados[9] =!  activados[9];
   } 
  if(key=='k'){
   activados[10] =!  activados[10];
   } 
  if(key=='l'){
   activados[11] =!  activados[11];
   } 
  if(key=='m'){
   activados[12] =!  activados[12];
   }  
   if(key=='n'){
   activados[13] =!  activados[13];
   } 
   if(key=='n'){
   activados[14] =!  activados[14];
   } 
   if(key=='o'){
   activados[15] =!  activados[15];
   } 
   if(key=='p'){
   activados[16] =!  activados[16];
   }
  if(key=='q'){
   activados[17] =!  activados[17];
   }  
   if(key=='r'){
   activados[18] =!  activados[18];
   } 
   if(key=='s'){
   activados[19] =!  activados[19];
   } 
   if(key=='t'){
   activados[20] =!  activados[20];
   } 
   if(key=='u'){
   activados[21] =!  activados[21];
   } 
   if(key=='v'){
   activados[22] =!  activados[22];
   } 
   if(key=='w'){
   activados[23] =!  activados[23];
   } 
   if(key=='x'){
   activados[24] =!  activados[24];
   } 
   if(key=='y'){
   activados[25] =!  activados[25];
   } 
  
   }
 

 }
  void mouseMoved() {
   
  for(int fila=0;fila<2;fila++){
  for(int columna=0;columna<cantidadCuadros;columna++){
    
   
    if(fila==0){
    if(columna%2==0){
      fill(#DCFF00);
      }else{
      fill(#4E951D);
      }
      }else{
        if(columna%2==0){
      fill(#4E951D);
      }else{
      fill(#DCFF00);
      }
      
      }
    rect(columna*anchoCuadro,fila*altoCuadro,50,250);
  }
 }
 
 for(int fila=0;fila<1;fila++){
   for(int columna=0;columna<cantidadCuadros;columna++){
  fill(#FFD683);
  rect(columna*anchoCuadro*separacion,fila*altoCuadro,15,250);
  }
   
  }
  
}

void mousePressed(){
if(mouseButton==RIGHT){
 colorUno=#740C68;
 colorDos=#D82AC4;
}
if(mouseButton==LEFT){
 colorUno=#4E951D;
 colorDos=#FFD683;
}
}

  

