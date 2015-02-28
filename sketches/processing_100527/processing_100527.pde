
size (400,400);
smooth();
background(255); 
noStroke(); fill(200);
rect(100,100,50,50); 
fill(120); translate(100,100);
rotate(radians(30)); 
rect(0,0,50,50);
fill(0); 
rotate(radians(30));
rect(0,0,50,50);
fill(255,0,0);
rotate(radians(30));
rect(0,0,50,50);
fill(200,199,0);
rotate(radians(30));
rect(0,0,50,50);
fill(100,300,100);
rotate(radians(30));
rect(0,0,50,50);
fill(40,30,170);
rotate(radians(30));
rect(0,0,50,50);
// o ponto (100,100) é o ponto de origem do primeiro quadrado
// desloca o plano para o ponto (100,100) // rotaciona o plano trinta graus em torno desta nova posição
// desenhamos o segundo quadrado no ponto (0,0) deslocado
// rotaciona novamente o plano em 30 graus // o quadrado preto sofre o efeito acumulativo das 2 rotações


