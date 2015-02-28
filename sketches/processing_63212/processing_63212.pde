

int totalObjectos; // numero total de objectos

float posX, posY; // variaveis para a posição horizontal e vertical 
float diametro; // variavel para o tamanho do quadrado
float r,g,b; // variavel RGB para a cor 
float s; // variavel para a espessura do outline


void setup() { // definição dos elementos estáticos

  size (600,600);//define a área de composição
  background (255); // define a cor de fundo
  smooth();// suaviza a imagem
  noLoop();// sem movimento
  

  
  totalObjectos = 100;// numero total de objectos, neste caso quadrados
  
 

}

void draw(){// definição dos elementos em animação
  
  colorMode(RGB, 255,255,255);// cor RGB
  background(255);// define a cor de fundo para que o fundo se mantenha sempre branco
  
  colorMode(HSB, 360,100,100); // mudar a cor para HSB 
  
  for ( int i = 0; i <totalObjectos; i++)// função em que a composição começa em 0 até ao numero toltal de objectos, 100
  {
    
   
     posX = 0 + random (-i,width); // define que a posição horizontal varia entre -i e a largura total
     posY = random (height); // define que a posição vertical varia entre a altura total
     
     float h = map ( i, 0, totalObjectos, 0,360); // os objectos de i a 0 vão fazer a gama cromática de HSB
     
     diametro = map ( i, 0, totalObjectos, 200,0); // os objectos de i a 0 vão ter diametros de 200 a 0
    
     s = random (1,10); // define que a espessura do stroke varia entre 1 a 10 
     
     strokeWeight(s);// define que a espessura do stroke varia entre 1 a 10
     fill(h,100,100);// define a cor do rectangulo conforme a gama cromática HSB 
     rect ( posX, posY, diametro, diametro); // define a posição dos quadrados quando os valores já estipulados
  } 
  

         
}




