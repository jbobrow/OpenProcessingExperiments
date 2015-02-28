

size (700,700); // tamanho da janela
background (255);  // cor de fundo
smooth(); // definicao de contorno


fill(0,0,0); // preenchimento com cor
strokeWeight(10); // tamanho de contorno
stroke(300,300,300); // contorno de cor
ellipse(random(width), random(height), 150, 150);
    
strokeWeight(8); 
stroke(random(400), random(400), random(400)); // variavel de cor (R,G,B) 
line(random(width), random(height), random(width), random(height) ); 

stroke(random(300), random(300), random(300)); // variavel de cor (R,G,B) 
point ( random(width), random(height)); 

stroke(random(255), random(255), random(255)); // variavel de cor (R,G,B) 
arc ( width/2, height/2, 100,100, radians(10), radians ( random(400)) ); 

stroke(random(500), random(500), random(500)); // variavel de cor (R,G,B) 
noFill(); // transparent color 
quad(random(width), random(height),random(width), random(height),random(width), random(height),random(width), random(height));  //
 
stroke(random(0), random(0), random(0)); // variavel de cor (R,G,B) 
rect(100, 100, 200, 50);

stroke(random(255), random(255), random(255)); // variavel de cor (R,G,B) 
fill(random(500), random(500), random(500)); 
triangle(width/2-100, height/2, width/2, height/2-150, width/2+300, height/2);

PFont arialBold; // escolha da fonte
arialBold=loadFont ( "Arial-BoldMT-48.vlw"); // tipo de letra
textSize (20); // tamanho da letra
text ( "Ilda Magalhães", 60, 60); // texto e as medidas onde se localiza

