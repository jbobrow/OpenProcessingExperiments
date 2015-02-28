
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (500,500); //define o tamanho da janela para 500x500
  smooth();       // suaviza o desenho. anti-aliasing
  background(0);  //define a cor/brilho da janela para 0 - preto
}                 //fecho da função void setup

void draw(){      //abertura da função void draw


for (int y = 25; y < height + 200 ; y = y+15 ){  // ciclo começa em 0 e incrementa de 15 em 15 até a altura da janela                                                                                                 5 até chegar à altura da janela
  
  noStroke();         // elimina o contorno para o(s) seguintes objectos
  float r = random(255); // declaração da variável r red de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  float g = 0; // declaração da variável g green de valor 0. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  float b = 0; // declaração da variável b blue de valor 0. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros

  for (int x = 25 ; x < width + 200 ; x = x+20 ){  // ciclo começa em 0 e incrementa de 20 em 20 até chegar à largura da janela
    
    fill(r,g,b);             //pinta o objecto seguinte com um valor de Red entre 0 e 255, e BLUE e GREEN de 0, ou seja, um vermelho com luz variável
    ellipse (x,y,50,50);     // desenha uma ellipse no local do ecrã correspondente em largura à variavel x, e em altura à variável y
    fill(random(255));           // pinta o objecto seguinte com uma cor(luminosidade) entre branco e preto, 0 e 255
    ellipse (x+5,y+5,40,40);     // desenha uma ellipse no local do ecrã correspondente em largura à variavel x, e em altura à variável y

    
    if (mousePressed){    // condição se o botao esquerdo do rato tiver premido
       stroke(r,g,b);     // pinta o contorno do seguinte objecto, neste caso pinta linhas de vermelhos de luminosidade diferente
       line(mouseX,mouseY,random(500),random(500));  // desenha linhas convergentes para a localização do rato
    } else {        // caso não se verifique a condição acima, faz o que está em baixo, "senão"
       noStroke();  //  elimina o contorno do próximo objecto
    }           //fecho do ciclo If
    fill(0);   // pinta o próximo objecto de preto, luminosidade 0
    ellipse(mouseX,mouseY,100,100); // desenha uma ellipse na localização do rato com o tamanho 100
    
    }                   //fecho ciclo For
}                       //fecho ciclo For



}//fecho da funçao void draw

