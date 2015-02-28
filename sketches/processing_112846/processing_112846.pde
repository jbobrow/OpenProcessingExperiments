
int posicao_coluna;
int x = 0;
int y = 0;
int posicao_linha;
int vazio = 0;
int click = 0;
int ganhador = 0;
int centro_x, centro_y;
int tabuleiro[][] = { {vazio,vazio,vazio},
                      {vazio,vazio,vazio},
                      {vazio,vazio,vazio}
                    };

void setup(){
  //por ser um tabuleiro estático toda a sua configuração foi feita aqui no setup
  background(255);
  size(300,300);
  strokeWeight(5);
  //linhas que dão o formato do tabuleiro
  line(100,0,100,400);
  line(200,0,200,400);
  line(0,100,300,100);
  line(0,200,300,200);
  //define o tamanho das letras
  fill(0);
  
}

void mousePressed(){
  posicao_coluna = pega_posicao_x_mouse();
  posicao_linha = pega_posicao_y_mouse();
    if(click % 2 == 0){
      centro_x = verifica_x_centro(posicao_coluna);
      centro_y = verifica_y_centro(posicao_linha);
      //verifica se a posicao está vazia
      if(tabuleiro[posicao_coluna][posicao_linha] == 0){
        fill(0);
        textSize(30);
        text("O", centro_x, centro_y);
        tabuleiro [posicao_coluna][posicao_linha] = 1;
        click += 1;
      }
      
    }
    else if(click % 2 != 0){
      centro_x = verifica_x_centro(posicao_coluna);
      centro_y = verifica_y_centro(posicao_linha);
      if(tabuleiro[posicao_coluna][posicao_linha] == 0){
        fill(255,0,0);
        textSize(30);
        text("X", centro_x, centro_y);
        tabuleiro [posicao_coluna][posicao_linha] = 2;
        click += 1;
      }
    }
  
    
}

void draw(){
  verifica_ganhador();
  textSize(10);
  fill(0);
  text("A1",30,30);
  text("A2",30,130);
  text("A3",30,230);
  text("B1",130,30);
  text("B2",130,130);
  text("B3",130,230);
  text("C1",230,30);
  text("C2",230,130);
  text("C3",230,230);
       if(ganhador == 1){
         background(0);
         noStroke();
         fill(255);
         textSize(10);
         text("O JOGADOR DA BOLINHA GANHOU!", mouseX,mouseY);
         text("APERTE \"R\" PARA RECOMEÇAR", 20,250);
       }
       else if(ganhador == 2){
         background(0);
         noStroke();
         fill(255);
         textSize(10);
         text("O JOGADOR DO X GANHOU!",mouseX,mouseY);
         text("APERTE \"R\" PARA RECOMEÇAR", 20,250);
       }
       if(click >= 9 && ganhador == 0){
          background(0);
          noStroke();
          fill(255);
          textSize(10);
          text("DEU VELHA!!",mouseX,mouseY);
          text("APERTE \"R\" PARA RECOMEÇAR", 20,250); 
       }
}


int pega_posicao_x_mouse(){
  if(mouseX >= 0 && mouseX < 100)
    posicao_coluna = 0;
  else if(mouseX >= 100 && mouseX < 200)
    posicao_coluna = 1;
  else if(mouseX >= 200 && mouseX <= 300)
    posicao_coluna = 2;

  return posicao_coluna;

}//fim da função pega posicao_x_mouse

int pega_posicao_y_mouse(){
  if(mouseY >= 0 && mouseY < 100)
    posicao_linha = 0;
  else if(mouseY >= 100 && mouseY < 200)
    posicao_linha = 1;
  else if(mouseY >= 200 && mouseY <= 300)
    posicao_linha = 2;

  return posicao_linha;

}//fim da função pega posicao_x_mouse

int verifica_ganhador(){
  //cima horizontal
    if(tabuleiro[0][0] == tabuleiro[1][0] && tabuleiro[0][0] == tabuleiro[2][0] )
      ganhador = tabuleiro[0][0] ;
  //esquerda vertical
    else if(tabuleiro[0][0] == tabuleiro[0][1] && tabuleiro[0][0] == tabuleiro[0][2])
      ganhador = tabuleiro[0][0];
  //diagonal esquerda cima direita baixo
    else if(tabuleiro[0][0] == tabuleiro[1][1] && tabuleiro[0][0] == tabuleiro[2][2])
      ganhador = tabuleiro[0][0];
  //meio vertical
    else if(tabuleiro[1][0] == tabuleiro[1][1] && tabuleiro[1][0] == tabuleiro[1][2])  
      ganhador = tabuleiro[1][0];
  //direita vertical
    else if(tabuleiro[2][0] == tabuleiro[2][1] && tabuleiro[2][0] == tabuleiro[2][2])
      ganhador = tabuleiro[2][0];
  //meio horizontal
    else if(tabuleiro[0][1] == tabuleiro[1][1] && tabuleiro[0][1] == tabuleiro[2][1])
      ganhador = tabuleiro[0][1];
  //baixo horizontal
    else if(tabuleiro[0][2] == tabuleiro[1][2] && tabuleiro[1][2] == tabuleiro[2][2])
      ganhador = tabuleiro[0][2];
  //diagonal baixo esquerda cima direita
    else if(tabuleiro[0][2] == tabuleiro[1][1] && tabuleiro[1][1] == tabuleiro[2][0])
      ganhador = tabuleiro[0][2];
      
  return ganhador;
}

int verifica_x_centro(int posicao_x){
  switch(posicao_x){
    case 0:
     centro_x = 40;
     break;
    case 1:
     centro_x = 140;
     break;
    case 2:
     centro_x = 240;
     break;
  }
  
  return centro_x;
}//fim da função de verificação de centro

int verifica_y_centro(int posicao_y){
  switch(posicao_y){
    case 0:
     centro_y = 60;
     break;
    case 1:
     centro_y = 160;
     break;
    case 2:
     centro_y = 260;
     break;
  }
  
  return centro_y;
}//fim da função de verificação de centro

void keyPressed(){
 if(keyPressed){
    if(key == 'r'){
     for(int i=0; i<3; i++){
       for(int j=0; j<3; j++){
         tabuleiro[i][j] = 0;
         background(255);
        size(300,300);
        stroke(1);
        strokeWeight(5);
        //linhas que dão o formato do tabuleiro
        line(100,0,100,400);
        line(200,0,200,400);
        line(0,100,300,100);
        line(0,200,300,200);
        //define o tamanho das letras
        textSize(30);
        fill(0);
         ganhador = 0;
         click = 0;
       }
     }
    }//fim do if tecla pressionada = r
      
     
  } 
}
