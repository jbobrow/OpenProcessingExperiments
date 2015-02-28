
int objectos;// variavel denominada de objectos

float r;// variável denominda R
float g;// variável denominda G
float b;// variável denominda B

void setup(){// definição dos elementos estáticos
  
  size (600, 600);//define a área de composição
  
  background (0);// define a cor de fundo
  
  smooth();// suaviza a imagem
  
  objectos = 23;// numero total de objectos
}

void draw(){// definição dos elementos em animação
  
  fill(255);// preenchimento
  smooth();// suaviza a imagem
  noStroke();// sem stroke
  
  
  
  for (int x = 1; x < objectos; x = x+1){// função em que a composição começa em 1 até ao numero toltal de objectos
    
  r = map (x, 0, objectos, 0, 255);// de x a 0 o numero total de objectos vai variar de forma ordenada de 0 a 255
  
    fill (r,g, 0);// preenchimento em tons de vermelho
    ellipse ( x * 25, height/2, 15, 15); // elipse com as coordenadas anteriormente definidas
 
  }
  
  
}

