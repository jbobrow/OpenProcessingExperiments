

size (700,700); // tamanho da janela
 background(random(180,255),200,0);  // cor de fundo
smooth(); // definição do contorno


fill(300,50,5); // preenchimento do circulo
strokeWeight(5); // espessura da linha do circulo
stroke(100,100,10); // variavel de cor do contorno 
ellipse(random(width), random(height), 150, 150); //  medida do circulo
    
strokeWeight(15); // espessura da linha
stroke(random(100), random(100), random(100)); // variavel de cor do contorno 
line(random(width), random(height), random(width), random(height) ); // medida da linha

stroke(random(500), random(500), random(500)); // variavel de cor do contorno
point ( random(width), random(height)); // medidas do ponto

stroke(random(100), random(100), random(100)); // variavel de cor do contorno  
arc ( width/2, height/2, 200,200, radians(1), radians ( random(200)) ); // medidas do arco

stroke(random(650), random(650), random(650)); // variavel de cor do contorno 
noFill(); // nao tem preenchimento a figura
quad(random(width), random(height),random(width), random(height),random(width), random(height),random(width), random(height)); // medidas da figura  
 
stroke(random(600), random(600), random(600)); // variavel de cor do contorno 
rect(200, 200, 200, 200); // medidas do quadrado

stroke(random(200), random(200), random(200)); // variavel de cor do contorno
fill(random(200), random(200), random(200)); // preenchimento do triangulo
triangle(width/2-80, height/2, width/2, height/2-100, width/2+80, height/2); // medidas do triangulo


PFont arialBold; // escolha da fonte
arialBold=loadFont ("Arial-BoldMT-48.vlw"); // tipo de letra
textSize (30); // tamnho do texto
text ("2D Primitives", 60, 60); // qual o texto e as medidas onde se localiza

