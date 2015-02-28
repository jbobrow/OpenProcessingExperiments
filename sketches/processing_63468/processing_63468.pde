
int objecto;// variavel para o numero de objectos


float r, g, b;// variavel para os parametros de cor r, g, b

void setup(){//definiçoes de setup
  
  size (600, 600);// tamanho da janela
  
  background (255);//cor de fundo   
  
  smooth();//suavizar as formas
  
  noLoop();// imagem estatica
  
  objecto = 100;// o numero de objectos definido na variavel "objecto"
}
void draw(){//definiçoes de desenho
  
    r = random (255);//valor da variavel r
    g = random (255);//valor da variavel g
    b = random (255);//valor da variavel b
  
  for ( int i = 0; i < objecto; i++){// variavel para gerar um numero de objectos = a objecto
    
    fill (r, g, 0);// preenchimento so em r, g
    ellipse (random (width), random (height), 50, 50);// desenho de  elipse em posiçao aliatoria
    
  }
  if (random (width) < random (width/2)){//probabilidade em relaçao ao posicionamento
  //se o posicionamento for menos que (width/2)
    
  }
  else//probabilidade do posicionamento
  //entao o preenchimento sera feito numa elipse segundo,
  {
        fill (0, 0, b);//cor apenas em b- azul
    ellipse (random (width/2), random (height/2), 50, 50);// desenho de elipse aleatorio entre (width/2 e height/2)
  }

  
}

