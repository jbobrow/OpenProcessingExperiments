
void setup(){
  size (500, 500);
  background (#FFCA08);
  fill (0);
  noStroke();
  smooth();
  //tamanho dos circulos 
  int rad = 15;
  //espaçamento dos circulos
  int x = 25;
  //qantidade
  for (int i = 0; i < 19; i++){
    for (int j = 0; j < 19; j++){
      //alteraçao de tamanhos
      kreis (rad +i/2, x*i+20, x*j+20);
    }
  }
}
void kreis (int rad, int x, int y){
 pushMatrix();
translate (x,y);
fill (0);
ellipseMode (CENTER);
//circulos 
ellipse (0,0,rad,rad);
//traço do meio cor
fill (#FF7708);
rectMode (CENTER);
//rotaçao
rotate (random (0,360));
//traço do meio
rect (0,0,5,20);
popMatrix();
}           
                
