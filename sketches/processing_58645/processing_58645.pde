
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (800,600); //define o tamanho da janela para 800x600
  smooth();       // suaviza o desenho. anti-aliasing
  noLoop();       // Previne que o programa se reproduza em ciclos contínuos
  background(0);  //define a cor/brilho da janela para 0 - preto
}                 //fecho da função void setup

void draw(){      //abertura da função void draw

float nobjectos = random(200,500); // os nr de objectos gerados é entre 20 e 100
int percent = 20; // percentagem de objectos gerados a serem alterados
int prob = 100 - percent; // variável usada para o teste da probabilidade, para calcular os 80%


for (int i=0 ; i < nobjectos ; i++){   
    /*ciclo for incrementa valores em i e termina quando
    o valor de i for igual a um número aleatório entre 50 e 100*/                            
    float x1 = random(width); // declaração da variável x1 de valor aleatorio entre 0 e a largura da janela. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float y1 = random(width); // declaração da variável y1 de valor aleatorio entre 0 e a largura da janela. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float r = random(120); // declaração da variável r red de valor aleatorio entre 0 e 120. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float g = random(120); // declaração da variável g green de valor aleatorio entre 0 e 120. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float b = random(120); // declaração da variável b blue de valor aleatorio entre 0 e 120. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
    float tam = random(10,40); // variável que abarca valores aleatórios entre 10 e 40 para o tamanho dos objectos
    float posX = width/6 + random(500); // define a localização horizontal do objecto em 20% dos casos
    float posY = height/6 + random(500); // define a localização vertical do objecto em 20% dos casos
   
    if (random(100) > prob){  // verificação e consequencia (em baixo) do que acontece em (100% - 20%) dos casos, ou seja 80%
      
      fill(255);  // pinta o objecto de branco, luminosidade 255 máxima
      strokeWeight(5); // define a grossura do contorno para 5
      stroke(255,0,0);   // pinta o contorno do objecto de vermelho puro, da escala RGB red green blue
      ellipse(posX,posY,tam,tam); // desenha quadrados de "tam" pixeis de lado de cor dependente da probabilidade
    
    }                         // fecha a 1ª condiçao
    else {                    // senão se verificar a condição do if, decorre o processo em baixo, else
      
      fill(r,g,b); //define a cor de preenchimento dos  objectos seguintes para os valores assumidos pelas variaveis R G e B
      strokeWeight(1);  // define a grossura do contorno para 1
      stroke(random(120)); // define o contorno do objecto seguinte para uma luminosidade entre 0 e 120 
      rect(x1,y1,tam,tam); // desenha quadrados de "tam" pixeis de lado de cor dependente da probabilidade
    }                         // fecha e conclui o processo lógico if
    
    
      
} //fecho do ciclo For  
  
}//fecho da funçao void draw

