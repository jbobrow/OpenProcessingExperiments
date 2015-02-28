
void setup() // void setup serve para inserirmos os parametros da pagina que sao os parametros constantes 
{
  size(500, 500); // tamanho da janela
  smooth(); // aliza a imagem
  frameRate(1);//define as frames por segundo
}
 
void draw() {  // void draw serve para que exista um loop e para inserir os parametros que queremos desenhar e que queremos que se repitao
  background(0);
  int s = second();  // esta linha diz que 's' vai de 0 a 59 e danos os segundos
  int m = minute();  // esta linha diz que 'm' vai de 0 a 59 e danos os minutos
  int h = hour();    // esta linha diz que 'h' vai de 0 a 23 e danos as horas
  
  
  noStroke();//retira o outline
  fill(0,55,255);//cor de preenchimento do arco
  //a linha de codigo a baixo foi retirada de outro local 
  arc(width/2, height/2, 350+m*2,350+m*2, PI+PI/2 ,PI+PI/2 + radians(m)/60*360);//arco 
  //( posX,posY,tamanho, tamanho, posiçao onde começa, posiçao onde acaba que neste caso é o valor de m em radians que é a traduçao de um angulo em graus para PI )
  
   fill(0);//cor de preenchimento da elipse
  ellipse(width/2, height/2, 100,100);// elipse (posX,posY,tamanho, tamanho) a posX e Y esta determinada para ser ao centro da janela
  
  
  fill(0);//cor de preenchimento da elipse
  ellipse(width/2, height/2, 200,200); // elipse (posX,posY,tamanho, tamanho) a posX e Y esta determinada para ser ao centro da janela
  fill(random(255),random(200),random(2));//cor de preenchimento da arco random entre os valores predispostos
  //a linha de codigo a baixo foi retirada de outro local
  arc(width/2, height/2, 200,200, PI+PI/2 ,PI+PI/2 + radians(s)/60*360); //arco 
  //( posX,posY,tamanho, tamanho, posiçao onde começa, posiçao onde acaba que neste caso é o valor de s em radians que é a traduçao de um angulo em graus para PI )
  
  
  strokeWeight(15+h/2);// define o outline que mostra as horas que aumenta consuante as horas
  stroke (200,7,90);//cor do outline
  noFill();//cor de preenchimento do arco
  //a linha de codigo a baixo foi retirada de outro local
  arc(width/2, height/2, 100,100, PI+PI/2 ,PI+PI/2 + radians(h)/24*360);//arco 
  //( posX,posY,tamanho, tamanho, posiçao onde começa, posiçao onde acaba que neste caso é o valor de h em radians que é a traduçao de um angulo em graus para PI )
 //'PI+PI/2 ,PI+PI/2' esta parte de codigo define a posiçao de começo como sendo em um relogio a 0ºgraus
}


