

void setup(){//função que determina que os elementos dentro desta area  vão ser constantes 
  size(700,700);//definição de dimensões da area de trabalho
  smooth();//esta funçao server para suavizar os elementos
} 

void draw() {//função que contrariamente ao void setup vai criar variações nos elementos conforme a informação que  forneçemos 
  
  colorMode (HSB ,360,100,100);//definição da ultilização do  sistema de cores HSB ,em que as suas variaveis sao o Hue que vai de 0 a 360 ,saturation que vai de 0 a 100,e brilho que vai de 0 a 100
  
  //segundos
 float s = second();  //criação de uma varial que vai representar os segundo ,vai de 0 a 59 ,o valor actual o programa vai buscar ao relogio do computador 
 float cor= 360/60;//criação de um varial que vai nos dividir 360 por 60 ,neste caso os 360 vao representar os 360 do Hue do Hsb,para que de segundo a segundo effectuo-se uma diferença de cor com uma valor constante entre elas 
 tint(s*cor, 50, s+20);//filtro de cor que se aplica a imagem ,neste caso conforme os segundos passão vai precorrer o H tudo começando no 0 e acabando no 360 ,a saturação vai ser constante no valor de 50 ,e o brilho vai adicionar a cada segundo mais vinte ou seja no caso dos dez segundos sera 10+20 ou seja trinta o valor ,sendo o valor maximo de 80 
     PImage fundo;//objecto nomeado de fundo , vai conter toda a informação sobre a imagem 
    fundo=loadImage("cores.jpg");// loaded da imagem ,que vai estar contida na pasta deste mesmo trabalho 
    fundo.resize(700,900);//redefinição da dimensões da imagem ,ajustanto as dimensões inseridas 
   image(fundo,0, 0);//posicionamente da imagem na area de trabalho 
   
 
  translate (width/2-20, height/2-30);//função que nos indica que as translações seram efectudas apartir do ponto 325 , 320
  
  float m = minute();//criação de varial que vai representar os minutos  ,vai de 0 a 59 ,o valor actual o programa vai buscar ao relogio do computador 
  float h = hour();//criação de varial que vai representar as horas ,vai de 0 a 23 ,o valor actual o programa vai buscar ao relogio do computador    
  
 
  m =   map (m, 0,59, 0, 360);//com este estamos a defenir o mapeamento da area , apartir do ponto de translaçao anteriormente  referido ; o m ,vai de 0 ,59 precorrendo de 0 a 360 ,em que cada valor vai ser o anterior + x valor de angulo
  h =   map (h, 0,12, 0, 360);//com este estamos a defenir o mapeamento da area ,que vai ter como base ponto de translação anterior referido  o h ,vai de 0 ,12 precorrendo de 0 a 360  ou seja dando duas volta por um dia ,em que cada valor vai ser o anterior + x valor de angulo
  
  
   noTint();//n vai existir qualquer filtro ,nas imagem a seguir
   
  // minutos que vao estar a traz do corpo
 float angleMinutes = radians(m)+135;//funçao que vai converter angulos de 0 a 360 em radianos adicionei mais 135 pois os valores nao começavam nas posiçoes certas 
 
  pushMatrix(); //Matriz que guarda as coordenadas iniciais dos pontos 
  rotate(angleMinutes);//vai efectuar a rotação dos ponteiros dos minutos atravez do ponto de transação que sera sempre o mesmo girando 360 graus que estaram divididos por 59 como anterior referido .
   PImage minutos;//objecto nomeado de minutos que vai conter tuda a informação sobre a imagem 
    minutos=loadImage("minutos.png");// loaded da imagem ,que vai estar contida na pasta deste mesmo trabalho
    minutos.resize(56,197);//redefinição da dimensões da imagem ,ajustanto as dimensões inseridas 
    image(minutos, -25,-20);//posicionamente da imagem na area de trabalho
popMatrix();//Matriz que restaura as coordenadas posteriores  ,a combinadas popmatrix e pushmatrix vao criar um ciclo repetitivo de coordenadas

 // imagem estatíca (corpo)
 PImage corpo;//objecto nomeado de corpo que vai conter tuda a informação sobre a imagem
    corpo=loadImage("corpo.png");// loaded da imagem ,que vai estar contida na pasta deste mesmo trabalho
    corpo.resize(112,500);//redefinição da dimensões da imagem ,ajustanto as dimensões inseridas
    image(corpo,-25, -120);//posicionamente da imagem na area de trabalho
    
    
//horas vão estar a frente do corpo

float angleHours = radians(h)+135;//converte de angulos 0-360 para radianos adicionando mas 135 grau para ficar na posição certa 
pushMatrix();//Matriz que guarda as coordenadas iniciais 
  rotate(angleHours);//vai efectuar a rotação dos ponteiros dos minutos atravez do ponto de transação que sera sempre o mesmo girando 360 graus que estaram divididos por 12 como anterior referido dando duas volta por dia 
  PImage horas;//objecto nomeado de horas que vai conter tuda a informaçao sobre a imagem
    horas=loadImage("horas.png");// loaded da imagem ,que vai estar contida na pasta deste mesmo trabalho
    horas.resize(46,247);//redefinição da dimensões da imagem ,ajustanto as dimensoes inseridas
    image(horas, -20, -20);//posicionamente da imagem na area de trabalho
popMatrix();//Matriz que restauras as coordenadas posteriores  ,a combinadas popmatrix e pushmatrix vao criar um ciclo repetitivo de coordenadas

  
}

