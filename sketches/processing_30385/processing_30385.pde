
float posX;float posY;               //variaveis 
 
void setup(){
size(800,500);                       // tamanho da janela
background(0);                       //cor de fundo
}
 
void draw(){                                            //funçoes do void setup - draw
if(mousePressed){
  stroke(random(150),random(100),random(250),120);
  smooth();
line(posX,posY,mouseX,mouseY);
}
}
 
void mousePressed(){                                    //funçoes do rato
posX = mouseX;
posY= mouseY;
}

