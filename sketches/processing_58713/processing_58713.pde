
void setup(){ //abre a função VoidSetup
  size(600,600); //define a area da janela  
  background(255); //cor de fundo da janela 
  smooth(); // suaviza o desenho
  noLoop(); //Pára a repetiçao continua do programa
  noStroke(); //desactiva a linha exterior
}

void draw (){ ////Abertura da função void draw que vai desenhar os objectos

String texto = "PROBABILITIES"; //conjunto de caracteres
PFont tipoletra; //vai buscar a fonte à pasta do programa
tipoletra = loadFont("Aharoni-Bold-48.vlw");//faz o desenho da fonte

fill (9,175,93); //cor do preenchimento
textSize(40); //tamanho do texto
text(texto, 30, 60); //desenha o texto e as coordenadas do mesmo

for (int i=0; i<100; i++){ //ciclo que vai de 0 a 100 e incrementa de 1 em 1 valor
  
float n = random(100); //atribui um valor randomico à variavel n, vai servir para verificar probabilidades
if ((n >= 10)&&(n<20)){ //condição if que desenha algo caso n seja maior ou igual a 10 e menor que 20
  fill (9,175,93,50); //preenchimento de cor e transparencia
  ellipse (random (600), random (600), 80, 80); //gera uma circunferencia dentro dos valores randomicos indicados
}
else if((n >= 20)&&(n<50)){ //condição else if (senão se) que desenha algo caso n seja maior ou igual a 20 e menor que 50
fill (9,175,93,140); //preenchimento de cor e transparencia
ellipse (random (600), random (600), 50, 50); //gera uma circunferencia dentro dos valores randomicos indicados
}

else { //se as duas condiçoes em cima nao se verificarem, desenha um outro objecto
  fill (9,175,93,255); //preenchimento de cor e transparencia
  ellipse (random (600), random (600), 20, 20); //gera uma circunferencia dentro dos valores randomicos indicados
}
}
}

//Cátia Pires_25554
//Lab Multimedia 2
//Universidade da Beira Interior - Design Multimedia

