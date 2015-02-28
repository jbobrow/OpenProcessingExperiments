
void setup(){// definiçao que vai definir elementos estaticos que se mantém ao longo da animaçao,as {}para determinar que a limitaçao dos elementos .
  size (700,700);//definiçao da area de trabalho
 
  smooth();//suavizar 
  frameRate(2);//esta premetinos deifinir a quandidade de frames por segundo neste caso optei por dois frames por segundo
}
void draw(){//definiçao contraria ao setup ,que nos vais geral elementos que se alterando conforme ,as nossas opcoes 
  background(255);//definir cor de fundo de area de trabalho
  float cinza = random(0,255);//criaçao de uma variavel nomeada cinza ,que equiva a uma variaçao em tons de cinza 
   
    for ( int i = 0; i < 200; i++)//funçao que nos premite criar mais um que um objectos ,esta formecenos a seguinte informaçao a variavel de i vai começar dos 0 vai ate 200
  {
    float posX = random(100,width/2);//variavel que define que o o valor de x vai variar entre 100 ,e a medade da largura
   float posY = random(100,height/2);//esta variavel tem a mesma funçao so que relativamente a altura
    strokeWeight(2);//definicao da grossura do contorno
    stroke(cinza);// a cor do contorno ,neste caso com a variavel anteriormente referida
    line(posX,posY,random(100,width/2),random(100,height/2));//construçao da linha em que ponto x1 e ponto Y1 utilizei as variaveis anteriores referidas ,e o ponto de conclusao ,vai se nos mesmo so que com pontos diferente .
     }// com esta construir uma area limitada entre 100 e meio da largura ,e altura ,prenchida com 200 traços de varios tamanhos.  
  for ( int i = 0; i < 200; i++)//funçao igual a anterior que nos vai criar 200 elementos apartir do zero
  {
    float posX = random(width/2,width-100);//variavel que determina que posX vai variar entre metade da largura e ate o valor total da mesma menos 100
   float posY = random(height/2,height-100);//variavel que determina que posY vai variar entre metade da altura ate  valor  total da mesma menos 100
    strokeWeight(2);//definiçao da grossura do contorno
    stroke(cinza);//ao utilizar a mesma varial que o  anterior vao ter este e os traços anteriores vai ter o mesmo tom 
    line(posX,posY,random(width/2,width-100),random(height/2,height-100));//definiçao da linha que começas nas variavel posX e posY ,que vao terminas entre x2=metade da largura ate a largura menos 100 o mesmo deccorrer relativamente a altura
   //como este vou consruir um quadrado no canto inferior direito com 100 de espaço entre o limite e mesmo quadro ,prenchido com 200 traços com varios tamanhos 
  }
   for ( int i = 0; i < 200; i++)//funçao que nos dias  que vao ser criados 100 objectos apartir do 0
  {
    float posX = random(width/4,width/2);//variavel que vai variar a posiçao de x entre  um quarto da largura e metade da largura .
   float posY = random(height/2,height-height/4);// o mesmo decorre com esta mas relativamente y e a altura neste caso varia de metade da altura ate menos tres quartos da  mesma
    strokeWeight(2);//definiçao do tamanho do contorno
    stroke(random(0,255),random(0,255),random(0,255));//definiçao da cor do contorno que defini por r ,g e b em que criei uma varialvel para cada um diferente  entre 0 ,255
    line(posX,posY,random(width/4,width/2),random(height/2,height-height/4));// definiçao lina e da sua inicio e conclusao entre a posX ,posY,e os outros dois vao variar entre largura a divitar por quatro e ,etade da largura o mesmo decorre com a altura
    noFill();//determinar que nao tem  prenchimento o objecto
    stroke(0);//definir o contorno como preto 
    ellipse(posX,posY,10,10);// defino que a posiçao do centro da ellipse ,e vai ser igual ao do começo da linha ,em que o diametro e 10 
    //criaçao de um quadrado menor que parte do meio que tem 200 traços em que o inicio dos mesmo tem uma ellipse em que os traços mudaam de cor e o ellipse sao pretas 
    
  }
     for ( int i = 0; i < 200; i++)//funçao que determina que a variavel ,que o numero de objectos varia entre 0 e 200
  {
    float posX = random(width/2,width/4*3);// variavel que determina que o X vai variar metada a largura ate tres quartos da mesma
   float posY = random(height/4,height/2);// variavel de Y que determina que esta vai variar entre um quarto da altura e metade da altura 
    strokeWeight(2);//definiçao da grossura do stroke
    stroke(0);//definiçao da cor do stroke igual a preto 
    line(posX,posY,random(width/2,width/4*3),random(height/4,height/2));//definiçao da lina que começa no posX e no posY e que vai variar entre metade da largura e tes quato da largura ,e a altura entre um quarto da altura e metade da altura 
    noFill();// nao tem preenchimentos
    stroke(random(0,255),random(0,255),random(0,255));// definiçao de cor do contorno ,em que esta e defenida por rgb em que  fiz uma variavel para todas elas entre 0,255
    rect(posX,posY,10,10);//construçao de um rectangulo em que a posicao de inicio da linha vai ser um dos quantos do mesmo e que tem os lados 10por 10
    //com este limitei um quadrado na metade superior direita constitui por 200 traço que sao preto e que tem como ponto inicial um quadrado colocrido 
    
  }
}

