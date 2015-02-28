
void setup(){ //abre a função VoidSetup
  size(600,600); //define a area da janela  
  background(255); //cor de fundo da janela 
  smooth(); // suaviza o desenho
  noStroke(); //desactiva a linha exterior
}

void draw (){ //Abertura da função void draw que vai desenhar os objectos

String texto = "RELATIONAL"; //texto a desenhar
PFont tipoletra; //desenha a fonte
tipoletra = loadFont("Aharoni-Bold-48.vlw");//vai buscar as caracteristicas da fonte
background (0); //define a cor do background

for (int y=25; y<height; y=y+45){ //ciclo que começa em 25 e incrementa de 45 em 45 em y até à altura da janela
  
  float c = map (y,50,height*2,0,255); //atribui um valor à variavel c, vai servir para mapear o circulo
  fill (c*2);//define a cor do preenchimento
  ellipse (mouseX,y,40, 40); //gera uma circunferencia movimentada horizontalmente ao movimento do rato
}

for (int x=25; x<width; x=x+45){ //ciclo que começa em 25 e incrementa de 45 em 45 em x até à largura da janela
  
  float d = map (x,50,width*2,0,255); //atribui um valor à variavel d, vai servir para mapear o circulo
  fill (d*2); //cor do preenchimento
  ellipse (x,mouseY,40, 40); //gera uma circunferencia movimentada verticalmente ao movimento do rato
}
fill (255); //cor do preenchimento
textSize(40); //tamanho do texto
text(texto, 300, 60); //desenha o texto e as coordenadas do mesmo
}

//Cátia Pires_25554
//Lab Multimedia 2
//Universidade da Beira Interior - Design Multimedia


