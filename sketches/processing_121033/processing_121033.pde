
/* @pjs preload="Nuvem-4.jpg,goku.jpg"; 
 */

PImage goku;
PImage nuvem;
int[] posXnuvem= new int[10];;
int[] posYnuvem = new int[10];
int n_nuvens = 100;
int movimentoX_goku=50;
int movimentoY_goku=20;
int vel_goku=5;
int i, nuvens=0;
int newFase = 0;

void setup(){
  size(320,240);
  background(100,250,250);
  goku = loadImage("goku.jpg");
  nuvem = loadImage("Nuvem-4.jpg");
  ativaNuvem();
}
void draw(){
  background(100,250,250);
  geraNovaNuvem();
  mostraNuvens();
  movNuvem();
  goku();
}
void keyPressed(){
  if( keyCode == UP && movimentoY_goku>-25)
    movimentoY_goku-=5;
  if( keyCode == DOWN && movimentoY_goku<180)
    movimentoY_goku+=5; 
  if( keyCode == LEFT && movimentoX_goku>0)
    movimentoX_goku-=5;
  if( keyCode == RIGHT && movimentoX_goku<240)
    movimentoX_goku+=5; 
}
void goku(){
  if(mouseX>0 && mouseX<240 && mouseY>-25 && mouseY<180){
    movimentoX_goku=50;
    movimentoY_goku=20;
  }
image(goku, mouseX,mouseY);
}
void geraNovaNuvem(){
  if(posXnuvem[0] < -50 || posXnuvem[1] < -50 || posXnuvem[2] < -50 ||
       posXnuvem[3] < -50 || posXnuvem[4] < -50 || posXnuvem[5] < -50 ||
       posXnuvem[6] < -50 || posXnuvem[7] < -50 || posXnuvem[8] < -50 ||
       posXnuvem[9] < -50)
      geraNuvem();
}
void geraNuvem(){
 for(nuvens=0;nuvens<10;nuvens++) {
   if(posXnuvem[nuvens]<-10){
      posXnuvem[nuvens] = 300+(nuvens*50);
      posYnuvem[nuvens] = int(random(250));
   }
 }
}
void mostraNuvens(){
  image(nuvem, posXnuvem[0], posYnuvem[0],50,50);
  image(nuvem, posXnuvem[1], posYnuvem[1],50,50);
  image(nuvem, posXnuvem[2], posYnuvem[2],50,50);
  image(nuvem, posXnuvem[3], posYnuvem[3],50,50);
  image(nuvem, posXnuvem[4], posYnuvem[5],50,50);
  image(nuvem, posXnuvem[6], posYnuvem[6],50,50);
  image(nuvem, posXnuvem[7], posYnuvem[7],50,50);
  image(nuvem, posXnuvem[8], posYnuvem[8],50,50);
  image(nuvem, posXnuvem[9], posYnuvem[9],50,50);
}
void movNuvem(){
  posXnuvem[0] -=1;
  posXnuvem[1] -=1;
  posXnuvem[2] -=1;
  posXnuvem[3] -=1;
  posXnuvem[4] -=1;
  posXnuvem[5] -=1;
  posXnuvem[6] -=1;
  posXnuvem[7] -=1;
  posXnuvem[8] -=1;
  posXnuvem[9] -=1; 
}
void ativaNuvem(){
  for(int i=0;i<10;i++) {
      posXnuvem[i] = -1;
      posYnuvem[i] = -1;
   }
}
/*void geraFase(){
  for(int i=0;i<n_nuvens;i++){
      posXnuvem[i]=(int(random(20)))*i;
      posYnuvem[i]=int(random(300));
  }
  for(i=0;i<n_nuvens;i++){
    nuvem[i] = loadImage("Nuvem-4.jpg");
   image(nuvem[i],posXnuvem[i],posYnuvem[i]);
  }
}
void processaFase(){
  for(int i=0; i<n_nuvens;i++){
     image(nuvem[i],posXnuvem[i],posYnuvem[i]);
     posXnuvem[i]-=vel_goku;
  }
  if(i==n_nuvens){
    i=0;
    newFase=1;
  }
}*/



