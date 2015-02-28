
int totalObj; // numero total de objectos, neste caso circulos
float posX, posY;//variaveis para a posição horizontal e vertical do circulo
float diametro;//variavel para o diametro (tamanho) do circulo
float r,g,b;//variaveis para a cor do circlo


void setup() {//função que define o set up
  
  size (800,600);//tamanho do ecran
  background (255);//fundo do ecran, branco
  smooth();//suaviza o desenho
  noLoop();//nao repete
  
  totalObj = 35;// numero total de circulos
  
}

void draw(){//função que define o desenho

  
  for ( int i = 0; i <totalObj; i++)//ciclo da ellipse que gera um número até 10 objectos 
  {
    
     posX = map (i, 0,totalObj, 0, width);//gera um numero para posição horizonral 
     posY = random (height);//gera um numero para posição vertical
 
     float diametro = random (4,80);//variavel para gerar um diametro aleatorio entre 4 e 80
      
      if ( diametro > 10) {//se o diamentro for maior que 10
        
         fill(255);//cor branco
         ellipse (posX, posY, diametro*3, diametro*2);//desenha a elipse com os valores gerados, sendo que o diametro multiplica-se por 3, e por 2 para dar aquela forma do ovo
         fill(255,221,0);//cor amarela 
      }

     ellipse ( posX, posY, diametro, diametro);//desenha a elipse com os valores gerados
  } 
        
}

