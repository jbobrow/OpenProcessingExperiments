
int s; // criacao de uma variavel para os segundos
int m; // criacao de uma variavel para os minutos
int h; // criacao de uma variavel para os horas
PFont myfont; // criaçao de uma variavel para o nome do tipo de letra utilizado

void setup() // abertura de um ficheiro
{
  size(500,500); //tamanho do ficheiro
  background(0); // fundo do ficheiro
  smooth(); //torna as superficies mais suavizadas
  
  myfont = createFont("DanubeBold-48",50); // criaçao do tipo de letra
  
  s =0; // atribuimos o valo de inicio
  m =0; // atribuimos o valo de inicio
  h =0; // atribuimos o valo de inicio
  textFont(myfont,50); // definimos o tamanho da letra
}

void draw() // abertura de uma zona de espaço
{
  background(0); // definimos novamente o fundo do ficheiro para que este se mantanha
  // o S vai guardar o actual valor do segundo
  // o  valor vai de 0 a 59
  s=second(); // definimos qual a funçao das variaveis
  println(s); // definimos que queremos ver os valores do objecto especifico
  m = minute(); // definimos qual a funçao das variaveis
  h = hour(); // definimos qual a funçao das variaveis
  noStroke(); // definimos que nao queremos linha de contorno
  fill(255,0,255,75); // definimos a cor a utilizar
  text( "H",  200-50, height/4-50); // definimos o que ira ser mostrado no texto
  fill(255,0,255); // definimos a cor a utilizar
  text( h,  200-60, height/4); // definimos o que ira ser mostrado no texto
  fill(255,0,255,75); // definimos a cor a utilizar
  stroke(random(255),random(255),random(255)); // definimos a cor do traço
  ellipse(width/4, height/2, h*10,h*10); // criamos uma ellipse 
  strokeWeight(1); // definimos a espessura do traço
  fill(255,0,0,75); // definimos a cor a utilizar
  text( "M",  260-45, height/4-50); // definimos o que ira ser mostrado no texto
  fill(255,0,0); // definimos a cor a utilizar
  text( m, 260-50, height/4); // definimos o que ira ser mostrado no texto
  fill(255,0,0,75); // definimos a cor a utilizar
  stroke(random(255),random(255),random(255));// definimos a cor do traço
  ellipse(width/2, 500-m*8, 100,100);  // criamos uma ellipse
  stroke(random(255),random(255),random(255));// definimos a cor do traço
  fill(255,175,0,75); // definimos a cor a utilizar
  text( "S", 330-45, height/4-50); // definimos o que ira ser mostrado no texto
  fill(255,175,0); // definimos a cor a utilizar
  text( s, 330-50, height/4); // definimos o que ira ser mostrado no texto
  fill(255,175,0,85); // definimos a cor a utilizar
  ellipse(width-width/4, 0+s*8, 200,200); // criamos uma ellipse

  
}
  
  



