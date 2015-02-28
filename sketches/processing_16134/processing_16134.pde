
boolean tiraFoto;

void setup() {
  size(screen.width,screen.height);
  smooth();
   tiraFoto = false;
}

void draw() {

  background(0);
  
  // 'for' = 'para' em português
  // "para cada 'i', começando em 0 e terminando em 11, faça o seguinte:"
  
  //neste caso usamos 2 for, o 1° diz que j = 0 e que ele se repete 20 vezes e aumenta de 1 em 1
  //controla a posição 
  for (int j= 0; j < 20 ; j++) {
  //no 2°  diz que i = 0 e que ele se repete 30 vezes e aumenta de 1 em 1
 
    for(int i = 0; i < 30; i= i+1){
    figura(100*i,100*j,i,0.5);
      }
     
  }
  
  if (tiraFoto) save(frameCount + ".jpg");
}



// função 'figura': desenha minha figura na posição (x, y),
//                  rotação 'ang'
//                  e tamanho 'tam' [ tam = 1: tamanho normal
//                                    tam < 1: tamanho reduzido
//                                    tam > 1: tamanho ampliado ]
void figura(float x, float y, float ang, float tam) {
  pushMatrix();    // abre o "bloco" de transformações de coordenadas e tamanho
    
    translate(x,y);  // muda posição da figura
    scale(tam);      // muda o tamanho da figura
    rotate(ang + millis()/400.0);     // rotaciona a figura com angulo ang
    fill(200,100,0);
    rect(-50,-50, 100,100);
    fill(0);
    ellipse(25, 25, 50,50);


  popMatrix();    // fecha o "bloco" de transforações (esquece as transformações)
}

void keyPressed() {
  tiraFoto = !tiraFoto;
}




