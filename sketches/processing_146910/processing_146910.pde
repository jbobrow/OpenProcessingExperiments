
       /************************************************************/
      /*     Desenvolvido por Antônio Victor Ferreira de Lima     */
     /*             Finalidada: Exercio de conhecimento          */
    /*          voltado a logica de programação procedural.     */             /********        AUTERAÇÕES FEITAS: CORREÇÃO DE COLISÃO          ********/
   /* Funcionalidades: Recriação do jogo bomberman(45% pronto) */
  /*                Professor: Marco Antônio                  */
 /*           Data da ultima alteração: 02/05/2014           */
/************************************************************/
void setup(){
  //definições padrões de tamanho e cor de fundo.
  size(850, 650);
  background(#008A3F);

}
//variaveis usadas para as posições do boneco.
int pos_x = 75;
int pos_y = 77;
int pos_olho_y = 70;
int pos_olho_x_0 = 70;
int pos_olho_x_1 = 80;
int inicio = 0;

void draw(){
  strokeWeight(2);
  //desenha o mapa e redesenha a cada movimento.
  if(inicio==0){
    drawMAP();  
    inicio++;
  }
  
  
  int i=0;
      //verifica se alguma tecla foi apertada e logo após identifica se a foi uma das teclas funcionais efetua sua respectiva função.
  if(keyPressed){
   
    if(key=='s' || key=='S'){
        //andar para trás
      i=i+25;
           //colisão simples
      if((pos_x>52 && pos_x<102-25) || (pos_x>152 && pos_x<202-25) || (pos_x>252 && pos_x<302-25) || (pos_x>352 && pos_x<402-25) || (pos_x>452 && pos_x<502-25) || (pos_x>552 && pos_x<602-25) || (pos_x>652 && pos_x<702-25) || (pos_x>752 && pos_x<802-25)){
        if(pos_y<552+17){
        andarY(i);
        }
      }
    }else{
      if(key=='d' || key=='D'){
          //andar para direita
        i=i+25;
        //colisão simples
        if((pos_y>52 && pos_y<102) || (pos_y>152 && pos_y<202) || (pos_y>252 && pos_y<302) || (pos_y>352 && pos_y<402) || (pos_y>452 && pos_y<502) || (pos_y>552 && pos_y<602)){
         if(pos_x<752){
          andarX(i);
         }
       }   
     }else{
      if(key=='a' || key=='A'){
            //andar para esquerda
       i=i-25;
           //colisão simples
       if((pos_y>52 && pos_y<102) || (pos_y>152 && pos_y<202) || (pos_y>252 && pos_y<302) || (pos_y>352 && pos_y<402) || (pos_y>452 && pos_y<502) || (pos_y>552 && pos_y<602)){
         if(pos_x>52+27){
         andarX(i);
         }
       }        
     }else{
      if(key=='w' || key=='W'){
              //andar para frente
        i=i-25;
              //colisão simples
        if((pos_x>52 && pos_x<102-25) || (pos_x>152 && pos_x<202-25) || (pos_x>252 && pos_x<302-25) || (pos_x>352 && pos_x<402-25) || (pos_x>452 && pos_x<502-25) || (pos_x>552 && pos_x<602-25) || (pos_x>652 && pos_x<702-25) || (pos_x>752 && pos_x<802-25)){
          if(pos_y>52+35){
          andarY(i);
          }
        }
      }/*else{   *****NÃO TERMINADO*****
      if(key==' '){
        bomba(i);
       
       }
      }*/
    }
  }
}
}
}




/****** BLOCO COM FUNÇÕES FUTURAMENTE UTILIZADAS, NOTA: "DESENVOLVER A PAGINA SEPARADAS E DEPOIS EFETUAR A LINKAGEM ******/
void drawMAP(){
  fill(#a9a9a9);
//eixo x e y para baixo e para direita.
  for(int i=1;i<=12;i++){
    rect(0,50*i,50,50);
    for(int j=0;j<=16;j++){ 
      rect(50*j,0,50,50);
    }
  }
    //eixo x e y para cima e para esquerda.
  for(int i=1;i<=12;i++){
    rect(800,50*i,50,50);
    for(int j=0;j<=16;j++){ 
      rect(50*j,600,50,50);
    }
  }
    //linhas do meio do mapa
  for(int i=1;i<=7;i++){
    for(int j=0;j<=500;j=j+100){
      rect(100*i,j,50,50);
    }
  }
}

void andarY(int i){      
  pos_y=pos_y+i;
  pos_olho_y=pos_olho_y+i;
  background(#008A3F);  
  drawMAP(); 
  strokeWeight(1);
  fill(#FFFFFF);
  noStroke();
  rect(pos_x, pos_y-23, 5, 10);
  fill(#FF69B4);
  ellipse(pos_x, pos_y, 9, 9);
  fill(#FFFFFF);
  ellipse(pos_x, pos_y, 45, 35);
  fill(#FFE4E1);
  stroke(#FF69B4);
  ellipse(pos_x, pos_y, 40, 30);
  fill(0);
  stroke(0);
  ellipse(pos_olho_x_0, pos_olho_y, 2, 12);
  ellipse(pos_olho_x_1, pos_olho_y, 2, 12);
}
void andarX(int i){
  pos_x=pos_x+i;
  pos_olho_x_0=pos_olho_x_0+i;
  pos_olho_x_1=pos_olho_x_1+i;
  background(#008A3F);
  drawMAP(); 
  strokeWeight(1);
  fill(#FFFFFF);
  noStroke();
  rect(pos_x, pos_y-23, 5, 10);
  fill(#FF69B4);
  ellipse(pos_x, pos_y, 9, 9);
  fill(#FFFFFF);
  ellipse(pos_x, pos_y, 45, 35);
  fill(#FFE4E1);
  stroke(#FF69B4);
  ellipse(pos_x, pos_y, 40, 30);
  fill(0);
  stroke(0);
  ellipse(pos_olho_x_0, pos_olho_y, 2, 12);
  ellipse(pos_olho_x_1, pos_olho_y, 2, 12);
}
/*    *****NÃO TERMINADO*****
void bomba(int i){
fill(0);
ellipse(pos_x, pos_y, 35, 35);
andarX(i);

}*/
/*
função não terminada.
void comecar(){
  frameRate(4);
     
      for(int i = 0; i<=3;i++){
       fill(255);
       rect(225,125,400,400);
       scale(0.5*i);
     }
       resetMatrix();
     
     frameRate(60);
}*/
/***     FIM DO BLOCO     ***/

