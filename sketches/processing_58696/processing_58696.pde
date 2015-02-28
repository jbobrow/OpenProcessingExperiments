
size(500,500);// area da janela
background(0);// cor de fundo

noStroke();// para nao haver stroke
smooth();// para suavizar o contorno


float step = width/10; // para gerar um numero para a posiçao horizontal
float stepY = height/10;// para gerar um numero para a posiçao vertical 



for ( int y = 0; y < 10; y = y + 1){// numero de vezes que um objecto de repete
for ( int x = 0; x < 10; x = x+1){// numero de vezes que um objecto de repete
  
 fill(random(255), random(255), random(255));// preenchimento dos quadrados
 quad( x * step, y * stepY,//p1 - pontos do quadrado 1
        x * step + 50, y * stepY,//p2
        x * step + 60, y * stepY - 30,//p3
        x * step + 10 , y * stepY - 30);//p4
       
        quad( x * step, y * stepY,//p1 - pontos do quadrado 1
        x * step + 50, y * stepY,//p2
        x * step + 60, y * stepY - 30,//p3
        x * step + 10 , y * stepY - 30);//p4
       
       
        
        
}
saveFrame("quadrado1.png");// para guardar a imagem
}
      
