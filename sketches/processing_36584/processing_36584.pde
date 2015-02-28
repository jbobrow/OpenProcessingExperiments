
size (500,500);// este comando define a janela
background (255); //cor fundo branca
smooth(); // graficos com anti-alissing
noStroke();//sem contorno

// variavel do tamanho do tempo
float pointSize = 10; 


int numberPoins = 100; // variavel do numero de pontos


int numShapes = 4; //variavel para repeticoes


/*variavel do tamanho que é igual 
o tamanho da janela a dividir por o numero de repetiçoes*/
int stepSizeH = (int) (height/ numShapes); 

int stepSizeW = (int) (width/ numShapes); 

// ciclo de desenho horizontalw
for ( int h = 0; h < height; h = h + stepSizeH)
{
    // ciclo de desenho horizontalw
  for ( int w = 0; w < width; w = w + stepSizeW)
  {
    
     noStroke();//sem contorno
     
   //preenchimento de cor random e alpha random entre 10-100  
fill(random(255),random(255),random(255), random(10,100));

//desenho da quadrado com o tamanho igual da janela a dividir por o numero de repetiçoes
  rect(w, h,height/ numShapes, width/ numShapes);
         
         //contorno random mas maioritariamnete azul
       stroke(random(5),random(5),random(255), random(10,200) );
       
       
        /*um cilo que vai desenhar o numero de pontos defenidos anteriormenta na 
        variavel"*/
        for ( int i = 0; i < numberPoins; i = i +1)
        { 
          strokeWeight( random(pointSize)); /*tamanho dos pontos confrome defenido anteriormenta na 
        variavel* pointsize"*/
         
         
        /* desenhar a bolas distribuidas aletoriamnete sobrea "shape" ms com distancia de 
        10pxls das extermidades*/ 
        ellipse (random(w+10,w+stepSizeW-10), random(h+10,h+stepSizeH-10),10, 10);
         
         
         
        
        }
    }
    
}

