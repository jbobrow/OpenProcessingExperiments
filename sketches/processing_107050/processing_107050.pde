
PImage p, e;
int pos = -280;
int pos2 = -680;
int i = 0;
void setup() {
  frameRate(60);
  size (1000,350);
  p = loadImage("pernalonga4.jpg");
  e =  loadImage("eufrazino5.jpg");
}

void draw() {
  if (keyPressed == true){
 background(255);
 
 //animação do pernalonga
  pos++;
  image (p, pos,0);
  if (pos > width) {
    pos = -350;
  }
  
  //animação do eufrazino
 pos2++;
  image (e, pos2,0);
  if (pos2 > width)
  pos2 = -320;
  
    
    //animação da fala do pernalonga  
    i++;
    textSize(20);
    fill(0);
    text("Catch me if you can!", i, 150);
    if (i > width)
    i = -350;    
  }
if (keyPressed == false){
  
    //texto caso nenhuma tecla for pressionada
    background (255);
    textSize(30);
    fill (255,0,0);
    text ("PRESSIONE QUALQUER TECLA PARA ACIONAR OS MOVIMENTOS", 40, 175);  
}



}  


