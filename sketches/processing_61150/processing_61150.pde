
PImage birds;//referir uma imagem e dar nome
PFont texto;//criar uma fonte e dar nome

void setup (){/*função que serve para fazer as definições*/
  size (800,800);//tamanho da tela
  background(205,242,239);//cor do fundo
  smooth();//suavizar as formas
  noLoop();//definir para que não haja loop na composição
  texto = loadFont("Arial-Black-48.vlw");//carregar fonte criada
  textFont(texto, 35);//definir tamanho da fonte
 
}
void draw(){/*função para desenhar*/
    background(83,191,216);//cor do fundo
    
  //........................................
    
    birds = loadImage("birds copy.png");//carregar imagem
    float desX = width/2;//variavel de x imagem
    float desY = height/2-300;//variavel de y imagem
    image(birds,desX,desY);//função para desenhar imagem(imagem,PosX,PosY)
    
  //........................................
  
    float Xr = 0-10;//variavel de x do rectângulo(mar)
    float Yr = 300;//variavel de y do rectângulo(mar)
    fill(20,162,128);//cor do rectângulo
     noStroke();//sem contorno
     rect(Xr,Yr,width+20,height);//construção do rectângulo(mar)
 
  //........................................
  
    for (int p = 0; p < 2000; p = p+1){//ciclo da textura do mar até desenhar 2000 objectos
    float Ax = random(width);//variavel do x das ellipses(textura do mar)
    float Ay = random(height/2-80,height);//variavel do y das ellipses(textura do mar)
    float tamanho = 40;//variavel para o tamanho das ellipses
    fill(34,242,192,30);//cor das ellipses
    noStroke();//sem contorno
   ellipse(Ax,Ay,tamanho,tamanho);//construçâo das ellipses(textura do mar)
  }
  
  //.........................................
  
    for (int a = 0; a < 100; a = a+1){//ciclo da lava até desenhar 100 objectos
    fill(175,27,11,50);//cor da lava
    float XLav = random(width/2-15,width/2+15);//variavel de x da lava
    float YLav = random(height/2-160,height/2-135);//variavel de y da lava
    ellipse (XLav,YLav,random(25),random(25));//construçao da lava
    noStroke();//contorno da lava(sem contorno)
  }
  
  //.......................................
  
    for (int k = 0; k <500; k = k+2){//ciclo do relvado tras até desenhar 500 objectos
    fill(16,random(255),7,80);//cor do relvado tras
    strokeWeight(3);//contorno do relvado tras
    float triX = random(0-100,width+200);//variavel de x1
    float triY = random(height/2+30,height+100);//variavel de y1
    float triX2 = random(0-100,width+200);//variavel de x2
    float triY2 = random(height/2+30,height+100);//variavel de y2
    float triX3 = random(0-100,width+200);//variavel de x3
    float triY3 = random(height/2+30,height+100);//variavel de y3
    //triangle(x1,y1,x2,y2,x3,y3);
   triangle(triX,triY,triX2,triY2,triX3,triY3);/*desenha triângulos 
                                              aleatorios(relvado tras)*/
  }
  
  //.......................................
  
    strokeWeight(2);//tamanho da linha de contorno
    fill(62,27,16);//cor do quadrilatero(r,g,b)
    float Vulx = width/2-30;//variavel de x1 (vulcão)
    float Vuly = height/2-150;//variavel de y1 (vulcão)
    float Vulx2 = width/2+30;//variavel de x2 (vulcão)
    float Vuly2 = height/2-150;//variavel de y2 (vulcão)
    float Vulx3 = width/2+200;//variavel de x3 (vulcão)
    float Vuly3 = height/2+150;//variavel de y3 (vulcão)
    float Vulx4 = width/2-200;//variavel de x4 (vulcão)
    float Vuly4 = height/2+150;//variavel de y4 (vulcão)
    //quad(x1,y1,x2,y2,x3,y3,x4,y4);
   quad (Vulx,Vuly,Vulx2,Vuly2,Vulx3,Vuly3,Vulx4,Vuly4);//criação do quadrilatero(vulcão)
  
  //.......................................
  
    for (int i = 0; i < 1000; i = i+1){//ciclo da textura do vulcão até desenhar 1000 objectos
    float g = random (49,69);//variavel da cor "g",verde
    float b = random (8,50);//variavel da cor "b", azul
    float Xtvul = random(width/2-20,width/2+20);//variavel de x da textura do vulcão
    float Ytvul = random(height/2-140,height/2+140);//variavel de y da textura do vulcão
    fill(131,g,b,30);//cor ellipse
  ellipse (Xtvul,Ytvul,random(50),random(50));//construção da ellipse(textura do vulcão)
    noStroke();//sem contorno
  
  //...............................
  
    fill(39,19,7,70);//cor ellipse2(textura do vulcão 2)
    float Xtvul2 = random(width/2-180,width/2+180);//variavel de x da textura do vulcão 2
    float Ytvul2 = 540;//variavel de y da textura do vulcão 2
  ellipse (Xtvul2,Ytvul2,random(50),random(45));//construção da ellipse2(textura do vulcão 2)
    noStroke();//sem contorno
}

//.........................................

    for (int j = 0; j <500; j = j+2){//ciclo do relvado frente até desenhar 500 objectos
    fill(16,random(255),7,30);//cor do relvado frente
    strokeWeight(3);//contorndo do relvado frente
    float triXb = random(0-100,width+200);//variavel de x1
    float triYb = random(height/2+100,height+100);//variavel de y1
    float triX2b = random(0-100,width+200);//variavel de x2
    float triY2b = random(height/2+100,height+100);//variavel de y2
    float triX3b = random(0-100,width+200);//variavel de x3
    float triY3b = random(height/2+100,height+100);//variavel de y3
    //triangle(x1,y1,x2,y2,x3,y3);
  triangle(triXb,triYb,triX2b,triY2b,triX3b,triY3b);/*desenha triângulos 
                                                    aleatorios(relvado frente)*/
}

//................................................................................

    for (int f = 0;f <10000;f = f+1){//ciclo das nunvens até desenhar 10000 objectos
    fill(random(185,255),70);//cor das ellipses (nunvens)
    float nuvX = random(width);//variavel do x da ellipse
    float nuvY = random(height/4-100);//variavel do y da ellipse
  ellipse (nuvX,nuvY,random(70),random(70));//desenha ellipses aleatorias (nunvens)

}

//.................................................................................
    fill(0);//cor do texto
    float texX = width/2-240;//variavel de x do texto
    float texY = height/2+200;//variavel de y do texto
    text("From Nowhere with Love",texX,texY);//desenhar texto(frase,PosX,PosY)
}


