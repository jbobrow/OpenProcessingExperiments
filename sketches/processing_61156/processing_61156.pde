
void setup(){/*Função que serve para fazer as definições*/
 size(500,500);//tamanho da tela
 smooth();//suavizar as formas
 noLoop();//definir para que não haja loop na composição
 
}

void draw(){/*função para desenhar*/
 background(19);//cor de fundo
   for (int f = 0; f < 200; f = f+1){//ciclo dos triângulos até desenhar 200 objectos
   float PosX = random(500);//variavel do ponto x1
   float PosY = random(500);//variavel do ponto y1
   float PosX2 = random(500);//variavel do ponto x2
   float PosY2 = random(500);//variavel do ponto y2
   float PosX3 = random(500);//variavel do ponto x3
   float PosY3 = random(500);//variavel do ponto y3
   colorMode(HSB);//alteração do modo de cor HSB
   fill(random(360),random(100),random(100),70);//cor dos triângulos e transparencia
   strokeWeight(2);//grossura do contorno dos triângulo
 /*triangle(x1,y1,x2,y2,x3,y3);*/
 triangle(PosX,PosY,PosX2,PosY2,PosX3,PosY3);//construção dos triângulos
 
   }
}


