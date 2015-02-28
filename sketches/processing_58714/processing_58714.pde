
void setup(){ //abre a função VoidSetup
  size(600,600); //isto define a area da janela  
  background(0); //cor de fundo da janela 
  smooth(); // suaviza o desenho
}

void draw (){ ////Abertura da função void draw que vai desenhar os objectos

String texto = "RANDOM"; //texto a desenhar
PFont tipoletra; //desenha a fonte
tipoletra = loadFont("Arial-BoldMT-48.vlw");//vai buscar as caracteristicas da fonte
  
for (int i=0; i < 10; i++){ //sequencia da repetição do objecto  
  
  float x1= random (600); //define uma variavel do tipo decimal - coordenada x1
  float x2= random (600); //define uma variavel do tipo decimal - coordenada x2
  float x3= random (600); //define uma variavel do tipo decimal - coordenada x3
  float x4= random (600); //define uma variavel do tipo decimal - coordenada x4
  float y1= random (600); //define uma variavel do tipo decimal - coordenada y1
  float y2= random (600); //define uma variavel do tipo decimal - coordenada y2
  float y3= random (600); //define uma variavel do tipo decimal - coordenada y3
  float y4= random (600); //define uma variavel do tipo decimal - coordenada y4
  float r= 255; //define a quantidade de cor vermelha dada ao objecto
  float g=random (255); //define a quantidade de cor verde dada ao objecto
  float b=random (255); //define a quantidade de cor azul dada ao objecto
  fill (r, g, b); //preenche o objecto com as variaveis das cores definidas
  background(0); //define a cor do fundo
  quad (x1, y1, x2, y2, x3, y3, x4, y4); //desenha as coordenadas
  
  if( i < 1 ) { //define uma condição
      fill(r,g,b); //preenche o objecto com as vaiaveis das cores definidas
    }else { //outra opção
      textSize(40); //tamanho do texto
      text(texto, 400, 60); //desenha o texto e as coordenadas d mesmo
    }
}
}

//Cátia Pires_25554
//Lab Multimedia 2
//Universidade da Beira Interior - Design Multimedia



