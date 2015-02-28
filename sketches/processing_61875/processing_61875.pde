
void setup(){//elementos estaticos cosntantes
  size(500,500);//definiçao de dimensoes de area de trabalho
  background(255);//definiçao do cor de fundo preto
  smooth();//suavizar os elementos
 noLoop(); //negaçao de movimento
}
  void draw(){// elementos metaforse 
    background(255);//definiçao do cor de fundo preto
    
    
    for ( int y = 0; y <30; y++){//funçao que diz que o y vai variar entre 0 e 30 ,ou seja vai variar na vertical
      for (int x =0; x <30; x = x+1) {//funçao que diz que o x vai variar entre 0 e 30 ,ou seja vai variar na horizontal


      fill (random (0,255),random (0,255),random (0,255));// o preechimento vai variar de formar aleatoria entre tuda a gama do rgb atravez das varieis criadas para cada elemento
      noStroke();//anulaçao do contorno
    float x1 = x*30-30;// sendo que os triangulos  tendo uma margem de diferença de 30,so que os triangulo começao a menos 30
    float x2= (x1+30);//e o x1 mais 30 que vai dar o topo do triangulo
    float x3 = (x1+60);// vai ser o x do ponto mais longe do x1 do triangulo
    float y1=y*20-20;//o y1 é o  do pico ,que vai começar de 20 em 20 oy seja os triangulos vao ter uma margem de diferença de 20,so que os triangulo começam a menos 20
    float y2=(y1+40);//vais ser a posicao na vertical dos dois pontos de baixo
    triangle(x1,y2,x2,y1,x3,y2);
      }
      }
    
    
    
      for ( int y = 0; y <15; y++){//funçao que diz que o y vai variar entre 0 e 15 ,ou seja vai variar na vertical
        for (int x = 0; x < 15; x = x+1) {//funçao que diz que o x vai variar entre 0 e 15 ,ou seja vai variar na horizontal
        fill(0);//prenchimento a preto 
    stroke(0);// contorno a preto 
    float x1 = x*60-30;// sendo que o proximo triangulo vai começar quando o outro acaba ,so que os triangulo começao a menos 30
    float x2= (x1+30);//e o x1 mais 30 que vai dar o topo do triangulo invertido
    float x3 = (x1+60);// vai ser o x do ponto mais longe do x1 do triangulo
    float y1= y*(60);//o y1 é o  do pico ,entre o fim e o inicio do outro vai haver um espaçamento de 60
    float y2=(y1+40);//vai ser a posiçao na vertical dos dois ponto superiores do triangulo
    triangle(x1,y1,x2,y2,x3,y1);//o y1 é o  do pico ,que vai começar de 20 em 20 oy seja os triangulos vao ter uma margem de diferença de 20,so que os triangulo começam a menos 20
        }
    }
  
  }
  

