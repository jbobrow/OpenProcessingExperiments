
 int s;
 int m;
 int h;
void setup (){ // definições de set up
  size (600,600); // tamanho da janela
  background(255);// cor de fundo
  smooth(); // definição de contorno
}
  


void draw(){ // desenhar imagem
  background(255); // cor de fundo
  
  //Imagem de fundo
   PImage b;
b = loadImage("azul.jpg");
image(b,0,0);

// segundos, minutos e horas
  s= second();
  m= minute();
 h= hour();
  
  //  valores designados para segundos , minutos e horas
  s= (int) map (s,0,59,0,height);
  m= (int) map (m,0,59,0,width/2);
  h = (int) map (h,0,59,0,width);
 
  //horas
  stroke (#0F4D4C); // contorno da linha
  strokeWeight(30); // espessura da linha
  line(0,height/2,h,height/2); // desnho da linha
  
  //segundos
  stroke (#0F4D4C);// contorno da linha
  strokeWeight(10);// espessura da linha
  line(width/2,0,width/2,s);// desenho da linha
  
  //minutos
  stroke (#0F4D4C); // contorno da linha
  strokeWeight(20); // espessura da linha
  line(width,height/2, width-m, height/2 ); // desnho da linha
 



 

   
}
  



