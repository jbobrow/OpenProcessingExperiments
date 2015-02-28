
PFont nature;//instanciar a fonte e dar-lhe um nome
PImage img;//instanciar a imagem e dar-lhe um nome


void setup() {//definições do ambiente/Setup

  size(600,450);//tamanho da janela
  background (255);//cor de fundo
  smooth();//para anular o pixelizado das imagens dando-lhe um ar mais "macio"
  noLoop();//faz com que o processing execute o código uma só vez

  nature = loadFont("Corbel-48.vlw");//carrega-se a fonte
  textFont(nature, 40); //nome e tamanho da fonte
  
  img = loadImage("paisagem.jpg"); //carregar o ficheiro de imagem
  }

void draw(){//executa o código
  background(255);//cor de fundo
  image(img, 0, 0);//posicionar na janela a imagem
  
  fill(49,42,17);//preenchimento do rectângulo
  noStroke();//sem delineado
  rect(470,180,50,150);//rectângulo
 
  fill(60,93,34);//preenchimento do círculo
  noStroke();//sem delineado
  ellipse(550,180, 120,120);//círculo
 
 fill(60,93,34);//preenchimento do círculo
  noStroke();//sem delineado
  ellipse(500,180, 120,120);//círculo
   
   fill(60,93,34);//preenchimento do círculo
  noStroke();//sem delineado
  ellipse(450,180, 120,120);//círculo
 
 fill(60,93,34);//preenchimento do círculo
  noStroke();//sem delineado
  ellipse(500,100, 120,120);//círculo

  
  fill(49,59,29);//cor da fonte
  text("nature", 50, 140);//desenhar o texto que está dentro de aspas e posicioná-lo na janela

}

