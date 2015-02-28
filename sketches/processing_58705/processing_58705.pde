
void setup(){//abre a função Void Setup
  size(600,600); //define a area da janela  
  background(255); //cor de fundo da janela 
  smooth(); //suaviza o desenho
  noLoop (); //Pára a repetiçao continua do programa
  noStroke (); //desliga a função de linha exterior
}

void draw (){ //Abertura da função void draw que vai desenhar os objectos

String texto = "BOUNDING BOXES"; //conjunto de caracteres
PFont tipoletra;//vai buscar a fonte à pasta do programa
tipoletra = loadFont("Aharoni-Bold-48.vlw"); //faz o desenho da fonte

for (int i=0; i<1000; i++){//ciclo que vai de 0 a 1000 e incrementa de 1 em 1 valor
fill (random(255), 0, 0, 80);//preenche o objecto de cor
rect (random (0, 360), random (0, 200), random (50), random (50));//desenha o objecto
fill (0, random(255), 0, 80);//preenche o objecto de cor
rect (random (400, 600), random (0, 360), random (50), random (50));//desenha o objecto
fill (0, 0, random(255), 80);//preenche o objecto de cor
rect (random (0, 200), random (240, 600), random (50), random (50));//desenha o objecto
fill (255, random(255), 0, 80);//preenche o objecto de cor
rect (random (240, 600), random (400, 600), random (50), random (50));//desenha o objecto
}
fill (0);//preenche o objecto de cor
textSize(30);//tamnho do texto
text(texto, 300, 520);//colocação do texto e posição do mesmo
}

//Cátia Pires_25554
//Lab Multimedia 2
//Universidade da Beira Interior - Design Multimedia

