
size (800,800); // tamanho janela
background(255); // cor fundo




PImage img;  //nova imagen dar nome

img = loadImage("befree.jpg");  //carregar imagen

image (img, 100, 100); // funçao para desenhar imagen


size(img.width, img.height); // posicionamento imagen
image(img,0 ,0);
noFill(); // rect sem prenchimento
strokeWeight(5); // tamanho moldura
rect(0,0, img.width, img.height); // moldura


PFont arialBold; // download fonte

arialBold = loadFont( "BrowalliaNew-Italic-48.vlw");  // load da fonte a utilizar

textFont(arialBold, 50); // tipo letra
text( "Be free" , 55,290); // texto


   noStroke(); // sem contorno
   fill(255,255,255,95 ); // preenchimento
 ellipse(width/2, height/2, 300, 300);  // desenho circulo 1

noStroke(); // sem contorno
   fill(255,255,255,90 ); // preenchimento
 ellipse(width/4, height/4, 150, 150); // desenho circulo 2
 
