

  size (600,500); // indica o tamanho da folha, neste caso do tamanho da imagem
 

/* PImage é o objecto de imagem do processing 
podemos carregar imagens e temos varias funções para manipular a imagem*/

PImage img; // guarda a imagem
img = loadImage ("filipa.jpg"); // carrega um ficheiro de imagem 
image(img, 0, 0); // função que desenha a imagem



noStroke();
smooth();


// desenho do objecto

    for (int x = 1; x < 800; x = x+1) { // variável que dis quantos objectos desejamos que aparecam sem programar um a um
      
   
      // criação de variaveis
          float diametro = random(10); // criar uma variavel e atribuir um valor
        
          float r = random(10);
          float g = random(255);
          float b = random(255);
          float s = random (1,10); // variavel para a espessura
        

  strokeWeight(random(30)); // este comando dá-nos a grossura da lina
  fill(255, 255, 255, 100); //cor de fundo do objecto
  ellipse(random(650), random(650), diametro, diametro); // cria elipses
  
  
 
  PFont HelveticaType;// aqui é onde definimos a fonte que pretendemos usar
HelveticaType = loadFont("Helvetica-Bold-48.vlw");// aqui carregamos a fonte
textFont(HelveticaType); // aqui dizemos que o texto vai ter a fonte escolhida


      
      textSize (21); // decidimos o tamanho do texto
      fill(355,72,7); // decidimos a cor do texto
      text( "O caminho da Sabedoria é não ter medo de errar!",75,450); //decidimos a palavra e a sua posição

      
    }


    

