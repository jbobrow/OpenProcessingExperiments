
int totalObjectos; // numero total de objectos

float posX, posY; // variaveis para a posição horizontal e vertical do circulo
float diametro; // variavel para o diametro do circulo
float r,g,b; // variaveis para a cor do circlo
float s; // variavel para controlar a espessura do outline

void setup() {//abre a funçao VoidSetup
size (700,550);//define a area da janela
  background (255); //define a cor de fundo da janela
  smooth();//suaviza o desenho
  noLoop();////Pára a repetiçao continua do programa
    
  totalObjectos = 300;// numero total de objectos
}

void draw(){//Abertura da função void draw que vai desenhar os objectos
  
String texto = "ITERATION"; //conjunto de caracteres
PFont tipoletra; //vai buscar a fonte à pasta do programa
tipoletra = loadFont("BodoniMTBlack-48.vlw");//faz o desenho da fonte
   
 colorMode(RGB, 255,255,255);//formato de cor - RGB

 background(255);//cor de fundo
  
 colorMode(HSB, 360,50,100); // muda o formato de cor para HSB
  
  for ( int i = 0; i <totalObjectos*2; i++)//ciclo que vai de 0 ao total de objectos (300) multimplicado por 2 e incrementa de 1 em 1 valor
  {
     posX = random (0,700); //gera posição X
     posY = random (i,0); //gera posição vertical
     
     float h = map ( i, 0, totalObjectos, 0,30); //atribui um valor ao hue consoante aumenta o valor de i, fazendo mapeamento entre 0 e o numero de objectos 
     float s = map ( i, 0, totalObjectos, 2,10); //atribui um valor ao stroke consoante aumenta o valor de i, fazendo mapeamento entre 0 e o numero de objectos
     
     diametro = map ( i, 0, 200, 0, 15); //atribui um valor ao diametro consoante aumenta o valor de i, fazendo mapeamento entre 0 e o numero de objectos
    
     strokeWeight(s); //espessura do Stroke
     stroke(h,50,100); //hsb do stroke
     ellipse ( posX, posY, diametro, diametro); // gera uma ellipse com a posição de X e Y
  }

textSize(100); //tamanho do texto
text(texto, 90, 490); //colocação do texto e posição do mesmo
}

//Cátia Pires_25554
//Lab Multimedia 2
//Universidade da Beira Interior - Design Multimedia



