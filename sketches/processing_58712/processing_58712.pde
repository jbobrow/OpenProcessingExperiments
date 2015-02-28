
void setup(){ //abre a função VoidSetup
  size(600,600); // define a area da janela  
  background(255); // cor de fundo da janela 
  smooth(); // suaviza o desenho
  noLoop (); //Pára a repetiçao continua do programa
  noStroke (); //desactiva a linha exterior
}

void draw (){ //Abertura da função void draw que vai desenhar os objectos

String texto = "LAYERS"; //conjunto de caracteres
String texto2 = "Lab2"; //conjunto de caracteres
PFont tipoletra; //vai buscar a fonte à pasta do programa
tipoletra = loadFont("Aharoni-Bold-48.vlw"); //faz o desenho da fonte

//LAYER1
for (int i=0; i<1000; i++){ //ciclo que vai de 0 a 1000 e incrementa de 1 em 1 valor
fill (random(255), 0, 0, 80); //preenchimento de cor
ellipse (random (600), random (600), random (100), random (100));//gera uma circulo segundo as coordenadas atribuidas
}

//LAYER2
for (int i=0; i<100; i++){ //ciclo que vai de 0 a 100 e incrementa de 1 em 1 valor
fill (255); //cor do preenchimento
textSize(random (40)); //tamanho do texto
text(texto, random(600), random (600)); //colocação do texto e posição do mesmo
}

//LAYER3
fill (0);// cor do preenchimento
textSize(200);//tamanho do texto
text(texto2, 75, 350);//colocação do texto e posição do mesmo
}

//Cátia Pires_25554
//Lab Multimedia 2
//Universidade da Beira Interior - Design Multimedia
  

