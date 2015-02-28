
float posX, posY;//posição
float velX;//velocidade
float velY;//velocidade
float diametro;// diametro do circulo

 void setup(){
   
   size(500,300);
   smooth();
   
   posX = 0;
   posY = height/2;
   velX= 5; //alterando o parametro o objecto desloca-se mais rapido
         // ou mais lento
   velY = 2;
   diametro=10;
   
 }
 void draw(){
   background (137,124,124);
   
     // ACTUALIZAR A POSIÇÃO
  posX=posX+ velX;
  posY=posY+velY;
   
   //TESTE DE COLISÃO
   if(posX + diametro*0.5 > width){ // se a posição é maior que 500(largura)
    velX= velX* -1; //inverter o sinal da velocidade e passa a negativo
                 //ou seja,vamos retirar a posição
   //posX=posX-diametro*0.5;
     diametro = diametro + (velX*0.5);
     //println(posX+diametro/2);
 }
  if(posX < 0){ // se a posição é mmenor que 0(topo)
    velX= velX*-1; // inverter o sinal da velocidade e passa a positivo
                 //ou seja,vamos retirar a posição
  }
     
   if(posY > height){ // se a posição é maior que 300(largura)
    velY= velY*-1; //inverter o sinal da velocidade e passa a negativo
                 //ou seja,vamos retirar a posição
 }
  if(posY < 0){ // se a posição é menor que o
    velY= velY*-1; // inverter o sinal da velocidade e passa a positivo
                 //ou seja,vamos retirar a posição
  }
  // ACTUALIZAR A POSIÇÃO
  posX=posX+ velX;
  posY=posY+velY;

  //DESENHAR A CIRCUNFERENCIA
  posX = posX + velX;
 println (posX);

  fill(199,240,22);
  noStroke();
  ellipse(posX, posY,diametro,diametro);
  
  fill(0);
  ellipse(posX, posY,5,5);

 }

