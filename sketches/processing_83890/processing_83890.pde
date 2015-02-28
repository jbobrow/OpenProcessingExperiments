
/* 
*  Código creado por Oscar Martinez Ramos
*  Escala masiva
*  Si se quieres cambiar la velocidad de ejecuacion, cambiar el 
*  valor de "frameRate".
*/
 
int i=0,j=0;
void setup(){
  size(300,300);
  background(0);
  frameRate(8);
  noStroke();
}

void draw(){
 do{
    fill(random(255),0,0);
    rect(j,i,10,10);
    i+=20;
    if(i>height){
     j=j+20;
     i=0;
    }
    if(j>=width){
      i=0;
      j=0;
    }
   }while(0!=0);   /*bucle infinito*/
}  



