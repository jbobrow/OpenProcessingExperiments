
Luz[] luces= new Luz[10000];
int totalluces=0;
void setup(){
  size(900,800);
  smooth();
   background(0);
}
void draw(){
 fill(0,10);
 rect(0,0,width,height);
  luces[totalluces]=new Luz();
  totalluces++;
   if (totalluces>=luces.length){
    totalluces=0;//empezar de nuevo
  }
  for(int i=0; i<totalluces;i++){
  luces[i].llover();
 luces[i].mostrar();
 luces[i].rebotar();
   }
}

