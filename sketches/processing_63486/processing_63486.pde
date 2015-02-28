
import ddf.minim.*;//variavel que importa o som do microfone
 Minim minim;//cria variavel para a bibliotrca de com
 AudioInput in;//o som retirado do microfone do computado
  float volume;//criaçao da variavel do volume


void setup(){//função que determina que os elementos dentro desta area  vão ser constantes 
  size(900,900);//definição de dimensões da area de trabalho
   minim=new Minim(this);//intriduz a variavel minim para depois va buscar o som ao micro
  minim.debugOn();//ligaçao directa ao micro 
  in=minim.getLineIn(Minim.MONO, 2);//identifica e liga ao micro
  volume=0;//valor de volume
  
} 

void draw() {//função que contrariamente ao void setup vai criar variações nos elementos conforme a informação que  forneçemos 

colorMode(HSB,360,360,100);//definiçao do sistemas de cor a utilizar 
background(168,0,99);//definiçao da cor de fundo
    volume = in.left.get(0)*100;// o volume vai ser retirar  apenas do lado esquerdo .
  
  tint(168,volume*5,volume*20);//filtro que vai variar a cor conforme o som
 

  //segundos
 float s = second();  //criação de uma varial que vai representar os segundo ,vai de 0 a 59 ,o valor actual o programa vai buscar ao relogio do computador 

 
  translate (width/2-20, height/2-30);//função que nos indica que as translações seram efectudas apartir do ponto 325 , 320
  
  float m = minute();//criação de varial que vai representar os minutos  ,vai de 0 a 59 ,o valor actual o programa vai buscar ao relogio do computador 
  float h = hour();//criação de varial que vai representar as horas ,vai de 0 a 23 ,o valor actual o programa vai buscar ao relogio do computador    
  
  s =   map (s, 0,59, 0, 360);//com este estamos a defenir o mapeamento da area , apartir do ponto de translaçao anteriormente  referido ; o m ,vai de 0 ,59 precorrendo de 0 a 360 ,em que cada valor vai ser o anterior + x valor de angulo
  m =   map (m, 0,59, 0, 360);//com este estamos a defenir o mapeamento da area , apartir do ponto de translaçao anteriormente  referido ; o m ,vai de 0 ,59 precorrendo de 0 a 360 ,em que cada valor vai ser o anterior + x valor de angulo
  h =   map (h, 0,12, 0, 360);//com este estamos a defenir o mapeamento da area ,que vai ter como base ponto de translação anterior referido  o h ,vai de 0 ,12 precorrendo de 0 a 360  ou seja dando duas volta por um dia ,em que cada valor vai ser o anterior + x valor de angulo
  
  
  
 

 // Segundos
 float angleSeconds = radians(s)+135;//funçao que vai converter angulos de 0 a 360 em radianos adicionei mais 135 pois os valores nao começavam nas posiçoes certas 
 
  pushMatrix(); //Matriz que guarda as coordenadas iniciais dos pontos 
  rotate(angleSeconds);//vai efectuar a rotação dos ponteiros dos segundos atravez do ponto de transação que sera sempre o mesmo girando 360 graus que estaram divididos por 59 como anterior referido .
 PImage corpo;//objecto nomeado de segundos que vai conter tuda a informação sobre a imagem
    corpo=loadImage("corpo2.png");// loaded da imagem ,que vai estar contida na pasta deste mesmo trabalho
    corpo.resize(300,450);//redefinição da dimensões da imagem ,ajustanto as dimensões inseridas
    image(corpo,-65, -45);//posicionamente da imagem na area de trabalho
    
PImage cabeca;//objecto nomeado de segundos que vai conter tuda a informação sobre a imagem 
    cabeca=loadImage("cabeca.png");// loaded da imagem ,que vai estar contida na pasta deste mesmo trabalho
    cabeca.resize(150,197);//redefinição da dimensões da imagem ,ajustanto as dimensões inseridas 
    image(cabeca,-50,-235);//posicionamente da imagem na area de trabalho
popMatrix();//Matriz que restaura as coordenadas posteriores  ,a combinadas popmatrix e pushmatrix vao criar um ciclo repetitivo de coordenadas


    
  // horas 
 float angleHours = radians(h)+135;//funçao que vai converter angulos de 0 a 360 em radianos adicionei mais 135 pois os valores nao começavam nas posiçoes certas 
 
  pushMatrix(); //Matriz que guarda as coordenadas iniciais dos pontos 
  rotate(angleHours);//vai efectuar a rotação dos ponteiros das horas  atravez do ponto de transação que sera sempre o mesmo girando 360 graus que estaram divididos por 12 como anterior referido .
   PImage ho;//objecto nomeado de horas que vai conter tuda a informação sobre a imagem 
    ho=loadImage("minutos.png");// loaded da imagem ,que vai estar contida na pasta deste mesmo trabalho
    ho.resize(56,197);//redefinição da dimensões da imagem ,ajustanto as dimensões inseridas 
    image(ho, -25,-20);//posicionamente da imagem na area de trabalho
popMatrix();//Matriz que restaura as coordenadas posteriores  ,a combinadas popmatrix e pushmatrix vao criar um ciclo repetitivo de coordenadas

    
//minutos

float angleMinutes = radians(m)+135;//converte de angulos 0-360 para radianos adicionando mas 135 grau para ficar na posição certa 
pushMatrix();//Matriz que guarda as coordenadas iniciais 
  rotate(angleMinutes);//vai efectuar a rotação dos ponteiros dos minutos atravez do ponto de transação que sera sempre o mesmo girando 360 graus que estaram divididos por 59 como anterior referido dando duas volta por dia 
  PImage mi;//objecto nomeado de horas que vai conter tuda a informaçao sobre a imagem
    mi=loadImage("horas.png");// loaded da imagem ,que vai estar contida na pasta deste mesmo trabalho
    mi.resize(46,247);//redefinição da dimensões da imagem ,ajustanto as dimensoes inseridas
    image(mi, -25, -20);//posicionamente da imagem na area de trabalho
popMatrix();//Matriz que restauras as coordenadas posteriores  ,a combinadas popmatrix e pushmatrix vao criar um ciclo repetitivo de coordenadas

  
}

