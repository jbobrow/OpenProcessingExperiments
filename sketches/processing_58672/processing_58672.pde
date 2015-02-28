
void setup (){ //criação do Set Up da composição

size (500,500); //definição do tamanho da composição
background (255); //definição da cor de fundo
smooth (); //serve para suavisar os elementos da composição
//noStroke (); //função que faz com que os elementos nao tenham contorno
frameRate (10); //definição do número de frames por segundo

}

void draw (){ //inicio da criação dos elementos da composição
  
  for (int i = 0; i < 500; i++){ //determina que a repetição dá-se 500 vezes começando em 0
    
    float X = random (0,500); //variável que atribui a X uma localização que vai de 100 a 400
    float Y = i; //variável de Y igual i
    
    float Hq = map (i, 100 , 700, 0, 700); //variavel que atribui um valor a H influenciado pelas repetições de i 

    
    fill (Hq,0,0); //preenchimento varia na escala de vermelhos
    stroke (255); //cor da linha de preenchimento
    strokeWeight (1/2); //espessura do outline
    ellipse (X, Y, 30, 30); //coordenadas dos quadrados
    
  }
  
}
