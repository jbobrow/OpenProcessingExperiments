
void setup()//comando setup
{
  size(500,500);//define o tamanho da nossa janela
  background(0,0,random(360));// define a cor do fundo neste caso azul, dentro de varios tons de azul
  smooth();//suaviza as formas geometricas
  noStroke();//tira o outline
 
  
}
  void draw()//comando de desenho
  {
    
   noLoop(); //neste comando damos ordem para nao existir loop na cor 
   fill(random(360),random(360),random(360));//define a cor do rectangulo que é o chao da paisagem, com o random ele vai alterando as cores dentro das cores defenidas por rgb
   rect(0,300,500,500);//aqui sao as coordenadas que definem a posição do rectangulo em relação a pagina
   
   fill(44,175,91);//preenchimento de cor da montanha que fica mais afastada
   triangle(700,300,450,100,300,250);// coordenadas do triangulo da montanha mais afastada 
    
   fill(random(255));//preenchimento de cor da montanha mais proxima com alteração de cor entre as mais variadas cores dentro das escalas de cinza que passam do preto ao branco
   triangle(600,300,350,150,150,300);//coordenadas do triangulo que forma a montanha mais proxima do observador
    
   PImage b;// damos ordem ao programa para inserir uma imagem e usamos a variavel b para a imagem
   b = loadImage("home.png");//chamamos a imagem ao programa
   image(b, 0, 125);// e definimos as coordenads da imagem 
     
   PImage a;// damos ordem ao programa para inserir uma imagem e usamos a variavel a para a imagem
   a = loadImage("cat-md.png");//chamamos a imagem ao programa
   image(a,200,220);// e definimos as coordenads da imagem 
    
   fill(255);//aqui é definido a cor branca do texto
   PFont font;//damos ordem ao programa para inserir texto e chamamos de font
   font = loadFont("BranchingMouse-Becker-25.vlw");// chamamos a font para o programa e definimos qual a fonte a usar
   textFont(font, 32);// aqui define-se o tamanho do texto 
   text("descobre a paz interior...", 15, 50);//aqui é onde colocamos o texto que queremos que apareça na aplicação e a sua localização 
    
   
  
}

