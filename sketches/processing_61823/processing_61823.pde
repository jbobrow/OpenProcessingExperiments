
// sara albuquerque nº27949 DMM

void setup(){ //isto serve para construir os elementos constantes
  size(500,500); //tamanho da janela
  smooth(); // suavizar os elementos disponiveis na area de trabalho
}
void draw(){ // isto serve para generar novos elementos
  
  colorMode(HSB,360,100,100); // isto define a ultizaçao do sistema de cores Hsb
  background(255); // isto serve para definir a cor da janela
  
  int s = second(); // serve para definir os segundos indo buscar as informaçao ao computador
  int m = minute(); // serve para definir os minutos
  int h = hour(); // serve para definir as horas
  
  int escala = 100; // Variavel defenida por escala que vai ser igual a 100
  
  
  s = (int) map (s, 0, 59, 0,height ); //com este estamos a defenir o mapeamento da area , o s ,vai de 0 ,59 precorrendo de 0 altura total ,em que cada valor vai ser o anterior + x valor de angulo
  m = (int) map (m, 0, 59, 0,250 ); //com este estamos a defenir o mapeamento da area , o m ,vai de 0 ,59 precorrendo de 0 altura total ,em que cada valor vai ser o anterior + x valor de angulo
  h = (int) map (h, 0, 24, 0,250 ); //com este estamos a defenir o mapeamento da area , o h ,vai de 0 ,24 precorrendo de 0 altura total ,em que cada valor vai ser o anterior + x valor de angulo
  println (h);
  
  // barra que altera na variaçao cromatica HSB
  noStroke(); // sem contorno  
  int sH = (int) map (s,0,height,0,360); // converter os segundos em Hue
  fill(sH,88,99); // isto é para definir a cor do objecto
  rect(0,height, 155, -s); //isto é para posicionar o rectangulo
  
 //minutos
    noStroke(); // sem contorno
  int mH = (int) map (m,0,escala,0,360); // converter os segundos em Hue
  fill(mH,84,98); // cor da ellipse dos minutos
  ellipse ( width*0.65-155, height/2-155, m-155, m-155);//isto é para posicionar a ellipse
  
 //horas
  noFill(); // sem preenchimento na ellipse das horas
  strokeWeight(2); // espessura do contorno
  stroke(54,0,0); // cor da espessura
  int hH = (int) map (h,0,escala,0,360); // converter os segundos em Hue
  ellipse (width *0.65, height/2, h, h);//isto é para posicionar a ellipse
}

