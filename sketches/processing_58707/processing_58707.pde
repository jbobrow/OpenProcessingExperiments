
void setup(){//abre a função Void Setup
  size(600,600); //define a area da janela  
  background(255); //cor de fundo da janela 
  smooth(); // suaviza o desenho
}

void draw (){ ////Abertura da função void draw que vai desenhar os objectos

String texto = "GRID 1D"; //conjunto de caracteres
PFont tipoletra; //desenhaa fonte
tipoletra = loadFont("Aharoni-Bold-48.vlw");//vai buscar a fonte á pasta do programa 
background (255);//cor do fundo

for (int y=0; y<height; y=y+15){//ciclo que começa em 0 e incrementa de 15 em 15 em y até à altura da janela
  
  strokeWeight (10); //espessura da linha
  stroke (random(255), random (255),random (255), random (255));//cor da linha
  line (0,y,random(400), y); //desenha o objecto - linha
}
fill (0);//cor do preenchimento
textSize(40); //tamanho do texto
text(texto, 400, 60); //desenha o texto e as coordenadas do mesmo
}

//Cátia Pires_25554
//Lab Multimedia 2
//Universidade da Beira Interior - Design Multimedia

