
void setup(){    //Abertura de função void setup- não retribui nenhum valor final
  size (800,600); //define o tamanho da janela para 500x500
  smooth();       // suaviza o desenho. anti-aliasing
 
}                 //fecho da função void setup

void draw(){      //abertura da função void draw
  float r = 150; // declaração da variável r red de valor aleatorio entre 0 e 255. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  float g = 150; // declaração da variável g green de valor 0. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  float b = 255; // declaração da variável b blue de valor 0. Tipo Float porque a funçao random atribui valores com casas decimais, nao inteiros
  background(r,g,b);  //define a cor/brilho da janela para azul claro

  int px = width/2 - 50; // variavel onde é depositado o valor horizontal da localizaçao da imagem do pai
  int py = height/2 - 125; // variavel onde é depositado o valor vertical da localizaçao da imagem do pai
  int fx = width/2 + 25; // posiçao horizontal do filho
  int fy = height/2 - 40; // posiçao vertical do filho
  
  String sol = "Olha o Sol tão lindo!"; // define um conjunto de caracteres com o texto entre aspas
  String coco = "Que cocó Horrível!"; // define um conjunto de caracteres com o texto entre aspas
  String mar = "Que mar fantástico!"; // define um conjunto de caracteres com o texto entre aspas
  String oba = "YES We Can!"; // define um conjunto de caracteres com o texto entre aspas
  String nom = "Ilustração Generativa."; // define um conjunto de caracteres com o texto entre aspas
  
  PFont tipoletra; // Cria uma fonte ser usado no programa
  tipoletra = loadFont("Interstate-Regular-48.vlw"); // carrega o tipo de letra balker para a fonte
  
  imageMode (CENTER); // definir a imagem para o centro
  
  PImage pai;//constitui um tipo de dados para guardar imagens, neste caso pai
  pai = loadImage("obama.png");//carregar imagem do filho
  PImage filho; // constitui um tipo de dados para guardar imagens, neste caso filho
  filho = loadImage("filho.png");//carregar imagem do filho
 
  for (int a=0; a <2 ; a++){ // ciclo desenha 2 linhas que em loop representam os raios do sol
    stroke(255,255,100);// pinta o contorno e as linhas de amarelo claro
    strokeWeight(random(3,10)); // define para entre 3 e 10 a grossura dos contornos e das linhas
    line (width*0.80,height/6,random(width/6,width),random(0,height/2)); // desenha 10 linhas partindo do centro do sol, até um local limitado, aleatoriamente
  }// fecho do ciclo for
  
  strokeWeight(1); // define para 1 a grossura dos contornos e das linhas
  fill(255,255,100); // pinta o sol de amarelo claro
  ellipse(width*0.80,height/6,80,80); // desenha o sol
  
  noStroke(); // elimina o contorno do mar
  fill(100,100,255); // pinta o mar de azul
  rect (0,height/2, width, height); // desenha o mar 
  
  fill(255,255,100); // pinta a areia de amarelo claro
  rect (0,height*0.60, width, height); // desenha a areia da praia 
  
  stroke(0); // pinta os seguintes contornos de preto
  fill(255); // pinta a camisa do pai de branco
  quad(px-80,py+70,px+80,py+70,px+50,py+200,px-50,py+200); // desenha as camisa do pai
  
  fill(150,70,0); // pinta os sapatos de castanho
  ellipse (px-25,height*0.88, 60, 25); // desenha o sapato esq
  ellipse (px+25,height*0.88, 60, 25); // desenha o sapato direito 
  
  fill(50); // pinta as calças do pai de cinzento
  quad(px-50,py+200,px+50,py+200,px+40,py+350,px-40,py+350); //desenha as calças do pai
  
  fill(255,0,0); // pinta a gravata do pai de vermelho
  quad(px,py+50,px-15,py+150,px,py+175,px+15,py+150); // desenha a gravata do pai
  
  fill(200,150,200); // pinta o corpo do filho de cor de rosa
  ellipse(fx,fy+50,75,100); // desenha o corpo do filho
  
  tint(200,pmouseY,200); // é parecido com o fill, tint(r,b,g)
  image(pai, px, py, 200, 200);// desenha a imagem na coordenada px, py, pai
  
  tint(100,pmouseY,100); // é parecido com o fill, tint(r,b,g)
  image(filho,fx,fy, 100, 100);  // desenha a imagem na coordenada fx, fy, filho
  
  noStroke(); // elimina os contornos para os seguintes objectos
  fill(100,100,20);  // pinta de castanho os 2 objectos seguintes
  ellipse(50,500, 30,50);  // desenha uma bola
  ellipse(55,500, 50,20);  // desenha uma bola
  ellipse(45,500, 30,30);  // desenha uma bola
  
  fill(0); // pinta os seguintes objectos de preto
  textSize(20); // aumenta o tamanho do texto desenhado seguidamente para 50
   
  if ((mouseX>width*0.70)&&(mouseY<height/5)){  // condiçao IF desenha o que se encontra abaixo se o rato se encontrar no canto superior direito do ecra
    text(sol, 500,200);  // desenha o texto sol definido no inicio do programa pela string sol
      tint(255,255,100); // semelhante ao fill, pinta a imagem, com valores de RGB neste caso
      image(pai, px, py, 200, 200);// desenha a imagem na coordenada px, py, pai
      image(filho, fx, fy, 100, 100);  // desenha a imagem na coordenada fx, fy, filho
  } else if ((mouseX<width/3)&&(mouseY>height*0.80)){
    // senao se verificar a condiçao acima, desenha algo na area definida pelas coordenadas acima
    text(coco, 20,450); // desenha o texto coco definido no inicio do programa pela string coco
      tint(0,200,0); // semelhante ao fill, pinta a imagem, com valores de RGB neste caso
      image(pai, px, py, 200, 200);// desenha a imagem na coordenada px, py, pai
      image(filho, fx, fy, 100, 100);  // desenha a imagem na coordenada fx, fy, filho
    
  } else if ((mouseX>width/2)&&(mouseY>height*0.40)&&(mouseY<height*0.60)){
    // senao se verificar a condiçao acima, desenha algo na area definida pelas coordenadas acima
    text(mar, 500,300);  // desenha o texto mar definido no inicio do programa pela string mar
      tint(200,200,255); // semelhante ao fill, pinta a imagem, com valores de RGB neste caso
      image(pai, px, py, 200, 200);// desenha a imagem na coordenada px, py, pai
      image(filho, fx, fy, 100, 100);  // desenha a imagem na coordenada fx, fy, filho
    
  } else if ((mouseX>width/2-100)&&(mouseX<width/2+100)&&(mouseY>100)&&(mouseY<300)){
    // senao se verificar a condiçao acima, desenha algo na area definida pelas coordenadas acima
      text(oba, 50,200);         // desenha o texto oba definido no inicio do programa pela string oba
      text(nom, 30,250);         // desenha o texto oba definido no inicio do programa pela string oba
      pai.filter(THRESHOLD,0.5); // atribui um filtro de threshold de valor 0.5 à imagem pai
      filho.filter(THRESHOLD,0.5); // atribui um filtro de threshold de valor 0.5 à imagem filho
      tint(255,255,255); // semelhante ao fill, pinta a imagem, com valores de RGB neste caso
      image(pai, px, py, 200, 200);// desenha a imagem na coordenada px, py, pai
      image(filho, fx, fy, 100, 100);  // desenha a imagem na coordenada fx, fy, filho
    
  } // fecho da condiçao IF
} // fecho da funçao void draw
  

