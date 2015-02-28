
void setup() { //funçao que armazena as definiçoes gerais do programa
  size(500,500); //define o tamanho da janela
  background(255); //define a cor de fundo
  smooth (); //suaviza os objectos desenhados usando para isso o antialiasing
}

void draw() { //função de que desenha os objectos
 
 float h = hour(); //atribui à variavel h as horas do sitema
 float m = minute(); //atribui à variavel m os minutosdo do sitema
 float s = second(); //atribui à variavel s os segundos do sitema
   
  float m2 = (TWO_PI*m)/60;//atribui à variavel m2 o valor da area do circulo definida por 2PI*m/60, para que seja feita uma distribuiçao correcta dos minutos pelo relogio, sendo que 2PI * X = area de um circulo
  float h2 = (TWO_PI*h)/24;//atribui à variavel h2 o valor da area do circulo definida por 2PI*h/24, para que seja feita uma distribuiçao correcta das horas pelo relogio, sendo que 2PI * X = area de um circulo
  float s2 = (TWO_PI*s)/60;//atribui à variavel h2 o valor da area do circulo definida por 2PI*h/60, para que seja feita uma distribuiçao correcta dos segundos pelo relogio, sendo que 2PI * X = area de um circulo
 
 stroke(255); // cor da linha do objecto
 strokeWeight(2); //espessura da linha do objecto
  fill(255, 0, 0); //cor do preenchimento do objecto
  arc(width/2, height/2, 400, 400, 0, h2); //desenha um arco - coordenadas da posiçao do objecto (x,y) e tamanho do mesmo
  fill(255); //cor do preenchimento do objecto
  ellipse(width/2, height/2, 300, 300); //desenha uma elipse - coordenadas da posição do objecto (x,y) e tamanho da mesma
  fill(255, 90, 90); //cor do preenchimento do objecto
  arc(width/2, height/2, 300, 300, 0, m2); //deenha um arco - coordenadas da posiçao do objecto (x,y) e tamanho do mesmo
  fill(255); //cor do preenchimento do objecto
  ellipse(width/2, height/2, 200, 200); //desenha uma elipse - coordenadas da posição do objecto (x,y) e tamanho da mesma
  fill(255, 180, 180); //cor do preenchimento do objecto
  arc(width/2, height/2, 200, 200, 0, s2); //desenha um arco - coordenadas da posiçao do objecto (x,y) e tamanho do mesmo
  fill(255); //cor do preenchimento do objecto
  ellipse(width/2, height/2, 100, 100); //desenha uma elipse - coordenadas da posição do objecto (x,y) e tamanho da mesma
  
  fill(0); //cor do preenchimento do objecto
  ellipse(width/2, height/2, 100, 100); //desenha uma elipse - coordenadas da posição do objecto (x,y) e tamanho da mesma
  
  stroke (0); // cor da linha do objecto
  strokeWeight (2); //espessura da linha do objecto
  line (width/2, height/2, 480, height/2); //linha - coordenadas da posição inicial e final do objecto
  
  PFont agency; //cria a variavel agency que armazena o tipo de letra
  agency = loadFont("AgencyFB-Bold-20.vlw"); //carrega a variavel agency com o tipo de letra agency e o tamanho 20
  fill(0); //cor do preenchimento do objecto
    text("H", 423, 240); //texto "H", posição em x, posição em y
    text("M", 371, 240); //texto "M", posição em x, posição em y
    text("S", 322, 240); //texto "S", posição em x, posição em y
  
  fill(255); //cor do preenchimento do objecto
  textFont(agency,15); //carrega a variavel agency com o tipo de letra agency e o tamanho 15
    text("CÁTIA PIRES", 220, 238); //texto "CÁTIA PIRES", posição em x, posição em y
    text("25554", 235, 255); //texto "25554", posição em x, posição em y
    text("LABM2", 235, 272); //texto "LABM2", posição em x, posição em y
       
}

//CÁTIA PIRES _ 25554 LABORATORIO MULTIMEDIA _ 2012


