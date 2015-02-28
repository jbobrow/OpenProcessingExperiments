
PImage imagem; 
/* declarar a variavel da imagem */

imagem= loadImage ("imagem.JPG");
/*load da imagem*/

size (imagem.width, imagem.height); 
/*o tamanho da janela do programa, que neste caso assume o tamanho da imagem*/

PFont font;
/*declarar a variavel da font*/

font=loadFont ("BlairMdITCTT-Medium-48.vlw");
/*load da font*/

textFont (font, 25);
/*definir o tipo de letra e tamanho do texto*/

image (imagem, 0, 0); 
/*inserir a imagem*/

fill(0, 0, 0);
/*cor do texto*/

text ("KaosDesign", 230, 100);
/*definir o texto apresentado e posição do mesmo*/

fill(150, 150, 150);
textFont (font, 10);
text ("David Casteleira", 320, 115);
/*mudar a cor do texto, tamanho do texto e novo texto inserido*/

