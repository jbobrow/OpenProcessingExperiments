
PFont myFont;//dizer ao processing que vamos criar uma fonte e dar o nome. 
            //Isto faz-se chamado a classe das fontes "PFont" e dando um nome, neste caso "myFont"

PImage img; //dizer ao processing que vou criar uma imagem e dar-lhe um nome
       img = loadImage("canon.jpg");//carregar a imagem


    int lj = img.width; //criar uma variavel e passo a largura da imagem
    int aj = img.height/2;//crio uma variavel e passo a altura da imagem e divido por 2

    size (lj, aj); //como paramentros de largura e altura vamos buscar a largura e altura da imagem

    image (img, 0,0);// desenhar a imagem na cordenada 0,0 // função para desenhar a imagem, recebe 3 parametros: a imagem, posiçãoX e posiçãoY;
    
    fill(150); //cor do rectangulo
    rect(645,0,140,40); //desenho um rectangulo, e meto as medidas de acordo com a posição que quero
    
    fill (254,0,0);//cor da letra
    myFont = loadFont ("MyriadWebPro-48.vlw");//carregar a fonte para o processing
    textFont(myFont,25);//digo ao processing para ir buscar a fonte que carreguei e meter com 25 de tamanho
    text("you can",77,65);//o texto que quero inserir, e as coordenadas da altura e da largura
    
    
    myFont = loadFont ("Canon-48.vlw"); //carregar a fonte para o processing
    fill (254,0,0); //cor da letra
    textFont(myFont,80); //digo ao processing para ir buscar a fonte que carreguei e meter com 80 de tamanho
    text("Canon",75, 130);//o texto que quero inserir, e as coordenadas da altura e da largura
    
    fill (255);//cor da letra
    myFont = loadFont ("MyriadWebPro-48.vlw");//carregar a fonte para o processing
    textFont(myFont,18);//digo ao processing para ir buscar a fonte que carreguei e meter com 18 de tamanho
    text("Take up the CHALLENGE,",585,260);//o texto que quero inserir, e as coordenadas da altura e da largura
    
    fill (255);//cor da letra
    myFont = loadFont ("MyriadWebPro-48.vlw");//carregar a fonte para o processing
    textFont(myFont,18);//digo ao processing para ir buscar a fonte que carreguei e meter com 18 de tamanho
    text("Share a moment of GLORY",585,280);//o texto que quero inserir, e as coordenadas da altura e da largura
    
    
    fill (0);//cor da letra
    myFont = loadFont ("MyriadWebPro-48.vlw");//carregar a fonte para o processing
    textFont(myFont,12);//digo ao processing para ir buscar a fonte que carreguei e meter com 12 de tamanho
    text("http://www.canon.com/",650,25);//o texto que quero inserir, e as coordenadas da altura e da largura
    
    
    fill (0);//cor da letra
    myFont = loadFont ("MyriadWebPro-48.vlw");//carregar a fonte para o processing
    textFont(myFont,13);//digo ao processing para ir buscar a fonte que carreguei e meter com 13 de tamanho
    text("Canon began with dream to create the world's best.",50,150);//o texto que quero inserir, e as coordenadas da altura e da largura
    
    smooth(); //suavizar o a linha neste caso
    strokeWeight(2); //espessura da linha
    stroke (254,0,0); //a cor da linha
    line (74, 0 ,74, 129); //desenhar uma linha
   
    
    
    
 



