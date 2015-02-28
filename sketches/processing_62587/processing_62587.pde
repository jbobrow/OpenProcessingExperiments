
// Exercício de 1D Grid - Anabel Santos

// definiçoes setup
void setup(){
  size(800,200); // tamanho do fundo
  background(0); // cor do background
   
   
   PFont texto1; // nome que se dá a variável do texto
   texto1 = loadFont ("golden0pony-48.vlw"); // Tipo de letra escolhido
   textFont (texto1); //dizer a fonte a utilizar
   
   PFont texto2; // nome que se dá a variável do texto
   texto2 = loadFont ("golden0pony-48.vlw"); // Tipo de letra escolhido
   textFont (texto2); //dizer a fonte a utilizar
   
   noStroke(); // sem linha de contorno (outline)
   smooth(); // suavizar
}

// parte ilustrativa (desenhos)
void draw(){ 
    background(0); // cor do background
    
    for (int y= 2; y < 10; y = y+2) { // forma de variável, indicam se y for menor que 10 ele terá x cor e x tamanho
      
      if(y < 10) { // se
        
        fill(255,3,142); // cor do texto
    textSize (y*3); //tamanho da fonte
      text( "WOHOO", y*70 , height/4);  // texto que vai aparecer e tamanho 
  }
     fill(255,191,229); // cor do texto
    textSize (y*2); //tamanho da fonte
      
  }    
 }


