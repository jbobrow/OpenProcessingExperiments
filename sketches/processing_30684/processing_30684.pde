
size (700,700); // define o tamanho da janela
background (0);  // define a cor do background
smooth(); // aplica anti-alias
noStroke();

float pointSize = 1; // define as variáveis do ponto; tamanho do ponto
int numberPoins = 1000; //variáveis do loop; numero de pontos 

// variáveis para forma
int numShapes = 30; 
int stepSizeH = (int) (height/ numShapes); 
int stepSizeW = (int) (width/ numShapes); 

// loop que cria as formas
for ( int h = 0; h < height; h = h + stepSizeH)
{
  for ( int w = 0; w < width; w = w + stepSizeW)
  {
       stroke(255,random(255),random(255));
        // define a estrutura da forma
        for ( int i = 0; i < numberPoins; i = i +1)
        { 
          strokeWeight( random(pointSize)); 
          fill(0);
         ellipse(random(w,w+stepSizeW), random(h,h+stepSizeH),10,10);
        }
    }
    saveFrame("ex6.png"); //salva uma imagem
}

