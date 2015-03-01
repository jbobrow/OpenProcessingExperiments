
//exercício 9.8 (tendo como ponto de partida o projecto_2_rev)
// trabalhar com objectos e com arrays
// exercício interactivo


Botao[] botao1 = new Botao[5];
Botao[] botao2 = new Botao[5];
Botao[] botao3 = new Botao[5];
Botao[] botao4 = new Botao[5];
Botao[] botao5 = new Botao[5];

void setup() {
  size(600,600);
  smooth();
  
  for(int i = 0; i < botao1.length; i ++) {
      botao1[i] = new Botao(i*100+105,100,10);
      botao2[i] = new Botao(i*100+105,200,10);
      botao3[i] = new Botao(i*100+105,300,10);
      botao4[i] = new Botao(i*100+105,400,10);
      botao5[i] = new Botao(i*100+105,500,10);
  }
}

void draw() {
  background(123);
  for(int i = 0; i < botao1.length; i++) {
    botao1[i].mostrar();
    botao2[i].mostrar();
     botao3[i].mostrar();
      botao4[i].mostrar();
       botao5[i].mostrar();
  }
}

void mousePressed() {
    for(int i = 0; i < botao1.length; i++) {
      botao1[i].interruptor(mouseX,mouseY);
      botao2[i].interruptor(mouseX,mouseY);
      botao3[i].interruptor(mouseX,mouseY);
      botao4[i].interruptor(mouseX,mouseY);
      botao5[i].interruptor(mouseX,mouseY);
    }
}

//criar a classe para depois inseri-la num array.


class Botao {

//x = posição horizontal do ponto central do circulo.
//o ponto central do circulo inactivo e do circulo activo é o mesmo.
int x;
//y = posição vertical do ponto central do circulo.
int y;
//d = diâmetro do circulo
int d;

//botaoActivo = interruptor. Quando falso, mostra o círculo quando verdadeiro (activo) mostra os círculos grandes
boolean activo;
  
  Botao(int tempX, int tempY, int tempD) {
    x = tempX;
    y = tempY;
    d = tempD;
    // o botão começa sempre inactivo
    activo = false;
  }

  void mostrar() {
    
    if(activo) {
      strokeWeight(random(1,20));
      stroke(0);
      noFill();
      ellipse(x,y,d+100,d+100);
      strokeWeight(random(1,20));
      ellipse(x,y,d+50,d+50);
      strokeWeight(random(1,20));
      ellipse(x,y,d+25,d+25);
    } else {
      strokeWeight(1);
    stroke(0);
    noFill();
    ellipse(x,y,d,d);
    }
  }
  
  //activar o botão. Quando o rato estiver dentro de um círculo activa o botão
  //mx e my, argumentos que significam a posição horizontal e vertical do rato
  void interruptor(int mx, int my) {
    if (mx >= x-d/2 && mx <= x+d/2 && my >= y-d/2 && my <= y+d/2) {
      activo = !activo;
    }
  }
}


