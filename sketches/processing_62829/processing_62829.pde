
size(500,500); //tamanho da imagem
background(285, 290, 80); //cor do fundo

PFont AmericanType; 
AmericanType = loadFont("AdobeArabic-Bold-48.vlw");//carregar a fonte
textFont(AmericanType); //tipo de letra

noStroke();//sem contorno
smooth();


    for (int x = 1; x < 10; x = x+1) {
      
      fill(0); 
textFont(AmericanType,90); 
text ( "Sara Lemos", 90,190); // carregar texto

      
    }

