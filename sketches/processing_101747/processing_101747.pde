
/*
Gustavo Yudi Bientinezi Matsuzake & Pedro Jamur;
24/06/2013
"Tenso!" é o trânsito de Curitiba!
*/
int x = 225;
int y = 225;
int x1, x2, y1, y2;
int motor = 3;
boolean up, down, right, left;

//declarando o tamanho da janela
void setup(){
size(630, 550);
}

//valor booleano TRUE se a tecla estiver apertada
void keyPressed() {
 if(keyCode == 38)
   up = true;
 if(keyCode == 40)
   down = true;
 if(keyCode == 39)
   right = true;
 if(keyCode == 37)
   left = true;
}

//valor booleano FALSE quando a tecla estiver sido solta
void keyReleased(){
 if(keyCode == 38)
   up = false;
 if(keyCode == 40)
   down = false;
 if(keyCode == 39)
   right = false;
 if(keyCode == 37)
   left = false;
}
void mousePressed() {
   if(x > x1 && x < x1+y1 && y > x2 && y < x2+y2 && up == false && down == false && left == false && right == false){
       if(mouseX < 200 && mouseY > 500)
           link("http://www.youtube.com/watch?v=xTsBL611hBA");
   }
}

void draw(){
 //declarando moviemento cmo as teclas
 if(up == true)
   y-=motor;
 if(down == true)
   y+=motor;
 if(left == true)
   x-=motor;
 if(right == true)
  x+=motor;
  
  
  //Verificando se a pessoa passou dos limites da tela
  fill(255);
  if(x <= 0){
    noLoop();
    textSize(25);
    text("Você bateu no lado esquerdo, cara!", 10, 230); 
  }else if(y <= 0){
    noLoop();
    textSize(25);
    text("Você bateu em cima, cara!", 30, 230);
  }else if(69+x >= 630){
    noLoop();
    textSize(25);
    text("Você bateu no lado direito, cara!", 10, 230); 
  }else if(89+y >= 550){
    noLoop();
    textSize(25);
    text("Você bateu em baixo, cara!", 10, 230); 
  }else{
      //se a pessoa não bateu em nenhum canto
      background(#AD1717);
      noStroke();
      //escrevendo TENSO
      
      
      //T
      rect(30, 30, 100, 30);
      rect(65, 60, 30, 60);
      
      //E
      rect(140, 30, 30, 90);
      rect(170, 30, 50, 25);
      rect(170, 95, 50, 25);
      rect(170, 65, 40, 15);
      
      //N
      rect(230, 30, 30, 90);
      rect(300, 30, 30, 90);
      quad(260, 30, 300, 80, 300, 120, 260, 70);
      
      //S
      arc(390, 85, 100, 75, 0, PI, OPEN);
      arc(390, 65, 100, 75, PI, PI+PI, OPEN);
      quad(340, 65, 380, 65, 440, 85, 400, 85);
      fill(#AD1717);
      arc(405, 65, 50, 30, PI, PI+PI);
      arc(375, 85, 50, 30, 0, PI);
      
      //O
      fill(#FFFFFF);
      ellipse(500, 75, 100, 95);
      fill(#AD1717);
      ellipse(500, 75, 50, 45);
      
      //!
      fill(#FFFFFF);
      rect(560, 30, 30, 60);
      ellipse(575, 110, 30, 30);
      
      //DESENHANDO O CARRO

      //Contorno do carro
      fill(#273990);
      rect(x,y,69,99,7);
      
      //Interior
      fill(0,0,0);
      rect(0+x,45+y,69,30);
      
      //Vidro
      fill(#C2C7CE);
      quad(0+x,45+y,69+x,45+y,60+x,60+y,10+x,60+y);
      
      //Capo
      stroke(72,2,2);
      line(15+x,0+y,10+x,40+y);
      
      //line(35,0,35,35);
      line(54+x,0+y,59+x,40+y);
      
      //Cano de escape
      fill(#2C2929);
      rect(50+x,99+y,10,5);
      rect(10+x,99+y,10,5);
      
      //Listras
      strokeWeight(5);
      line(30+x,0+y,30+x,43+y);
      line(30+x,78+y,30+x,97+y);
      line(40+x,0+y,40+x,43+y);
      line(40+x,78+y,40+x,97+y);
      
      //Estacionando
      fill(255);
      x1 = 540;
      x2 = 5;
      y1 = 20;
      y2 = 20;
      
      //Retangulo abaixo é o intervalo onde o canto superior esquerdo do carrinho deve ficar
      //rect(x1, x2, y1, y2);
      
      
      if(x > x1 && x < x1+y1 && y > x2 && y < x2+y2 && up == false && down == false && left == false && right == false){
        noLoop();
        textSize(18);
        text("Você estacionou em cima do \"!\", cara, parabéns!", 10, 170);
        text("Se você chegou aqui dando seta, sem xingar ninguém,", 10, 200);
        text("dando a vez para o próximo, não furou ninguém com um caneta*,", 10, 230);
        text("e não sabendo o que é vina, com certeza, você não é curitibano!", 10, 260);
        
        textSize(12);
        text("*Não entendeu? Clique aqui", 10, 540);
      } 
  }
}
