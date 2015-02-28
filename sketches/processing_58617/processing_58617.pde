
size(700,500); // tamanho do fundo
background(255); // cor da imagem de fundo

PImage img; // dar um nome qe se associe à imagem (img)
img = loadImage ("rgerdsfwef.jpg"); // serve para fazer o load da imagem

image(img, 0, 0); // posição da imagem no fundo

noStroke(); // sem contorno
smooth(); // suaviza a imagem/desenho


    for (int x = 1; x < 14; x = x+1) { //o x começa em 0, aumenta até 14 com um espaçamento de 40
      
      fill(255); // cor dos círculos - branco
      ellipse( x * 40 , 350, 20, 20); //desenho dos círculos /espaçamento de 40, posição de Y, diâmetro, diâmetro)
      
}
 
