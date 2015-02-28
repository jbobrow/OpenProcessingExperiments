

void setup(){// elementos estaticos 
  size(1500,500);//dimensoes da area de trabalho
  background(0);//cor de fundo branco
   
   
   PFont Lolita;//nomeaçao para uma fonte 
   Lolita = loadFont ("Consolas-Bold-20.vlw");//lolita vai ser uma fonte escolhida por nos que esta gravada no data
   textFont (Lolita);//fonte utilizada no texto
   
   noStroke();//nao contorno 
   smooth();//suavizaçao de elementos
   noLoop();
}
  void draw(){ // elementos em constante metamofor-se
    background(255);//fundo branco
    float posX =random (0,width);//a variavel da posiçao do x entre 0 e largura
    for (int y= 1; y < 20; y = y+1) {//funçao que diz que y vai de 1 a 20 e o proximo y vai ser o anterior mais 1
     ;
      if(y < 10) {// se y menor a 10  
        fill(random(0,255),random(0,255),random(0,255));//o prenchimento do objecto varia em todas as gama cromatica do rgb
    textSize ((y*100)/5);//o tamanho do texto vai ser o valor de 0 a 10 vezes 100 a dividir por 5,sendo que vai aumentar a escala
      float rand = random(1,255);//criar  um numero aleatrorio de 0 a 255
      int numero = (int) rand; //converte o numero anterior em inteiro
      char c = char (numero); //converte o numero para um caractere
      
      text( c, y*60, height/2);// o texto vai ser um caractere aleatorio ,em que posicionamente vai ser o valor de y vezes 60 ,e vai terminar no altura a dividir por dois
  } else {//caso isto nao dero a y for maior que 10
   
    fill (0);//o preenchimento vai ser preto 
       float rand = random(50,255);//cria um numero aleatrorio de 0 a 255
      int numero = (int) rand; // converte esse numero para "inteiros"
      char c = char (numero); // converte o numero para um caractere
      textSize((100/y)*18);//o tamanho do texto vai variar conforme a equaçao de forma a que vai diminuir 
      text( c, y*65, height/2);//o texto vai ser uma letra aleatoria ,em que o tamanho vai ser o y vezes 60,e vai posicionar a meio da altura
      
  }
      
    }}  
     



