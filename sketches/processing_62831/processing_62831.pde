
size(700,700);
background(20, 40, 300);

PFont AmericanType;
AmericanType = loadFont("HoeflerText-Ornaments-48.vlw");
textFont(AmericanType); 

noStroke();
smooth();

 for (int y = 1; y < 10; y = y+1) { 

    for (int x = 1; x < 10; x = x+1) { //gerador
      
      float rand = random(255);// gerei um numero aleatrorio de 0 a 255
      int numero = (int) rand; // converti esse numero para "inteiros"
      char c = char (numero); // converti o numero para um caracteres
      
      text( c, x * 80 , y*80); 
      
    }
    
 }

