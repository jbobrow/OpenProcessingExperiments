
boolean cargando= false;
int posX=200;
float x=10;
int contador=1;
void setup(){
  size(700,500);
  background(0,0,0);
}
void draw(){
  
      //Presentacio
      fill(0,255,0);
      textSize(30);
      text("Si vols jugar a Matrix",150,200);
      text("clica aquì",200,250);
      rect(220,300,100,50);
      textSize(20);
      fill(0,0,0);
      text("Jugar",240,335);
      if(mousePressed==true&&mouseX>=220&&mouseX<=320&&mouseY>=300&&mouseY<=350){
        cargando=true;
      }
      
      //Cargando
      if(cargando==true){
           //borrar tot
           fill(0,0,0);
           rect(0,0,700,500);
           //text cargant
           textSize(20);
           fill(0,255,0);
           text("Cargando...",300,400);
               //1,0
               int posicioX= 00;
                 while(posicioX<=680){
                        while(contador<=4){
                          frameRate(5);
                          textSize(10);
                          text("1",posicioX,x);
                          x= x+10;
                          text("0",posicioX,x);
                          x= x+10;
                          contador=contador+1;
                        }
                   posicioX=posicioX+10;
                   contador=0;
                   x=random(0,400);
                   }
               }
      }   



