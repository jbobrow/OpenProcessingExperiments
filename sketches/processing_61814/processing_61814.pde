
void setup(){
size (500,500);
background (255);
smooth();
/*definições do programa*/
}

void draw(){
for (int x=1; x<10; x=x+1){
  for (int y=1; y<10; y=y+1){
    /*processo de repetição*/
    fill (random (255), random (255), random (255));
    /*random de cores*/
    quad (random (500), random (500), 
          random (500), random(500),
          random (500), random(500),
          random (500), random(500));
          /*desenho dos quadrados, com o random em todas as posições*/
  }
}
}

