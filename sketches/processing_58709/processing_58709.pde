
void setup(){//abre a função VoidSetup
  size(600,600); //define a area da janela  
  background(0); //cor de fundo da janela 
  smooth(); //suaviza o desenho
}

void draw (){ //Abertura da função void draw que vai desenhar os objectos

String texto = "GRID"; //conjunto de caracteres
PFont tipoletra; //desenha a fonte
tipoletra = loadFont("Arial-BoldMT-48.vlw");//vai buscar a fonte á pasta do programa   

for (int y=10; y<width; y=y+12){//ciclo que começa em 10 e incrementa de 12 em 12 em y até à altura da janela
  for (int x=4; x<height; x=x+35){//ciclo que começa em 4  incrementa de 35 em 35 em x até à largura da janela
  fill (random (255));//cor de preenchimento
  textSize(15); //tamanho do texto
  text(texto, x, y); //desenha o texto presente na string e define a posição do mesmo
}
}
}
//Cátia Pires_25554
//Lab Multimedia 2
//Universidade da Beira Interior - Design Multimedia

