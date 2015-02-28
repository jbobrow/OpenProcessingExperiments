
//definir tamanho da tela, cor de fundo, e modo de cor (incluindo Hue, Saturation, Brightness), e suavidade das formas
void setup(){
  size(640, 480);
  background(0);
  colorMode(HSB, 360, width, height);
  smooth();
}

//declarar a forma (triangulo, onde o primeiro ponto começa no meio. O utilizador pode desenhar livremente com o rato.
void draw(){
  noStroke();
   fill(mouseX, mouseX, mouseY);
      triangle(width/2,height/2,mouseX+20, mouseY+20, mouseX-20, mouseY+20);
  //com este código estamos a dizer para começar a desenhar de novo (e a gravar a imagem anterior), pressionando a tecla Espaço.
    if(keyPressed) {
        if (key == ' ')
        {    
         saveFrame("line-####.jpg");
         background(0);         
        }
}
}                       
