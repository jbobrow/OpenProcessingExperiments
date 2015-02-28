
size(350,350);
background(38,144,180); // ceu
smooth();

line(0,120,200,120); // horizontal

fill(23,23,23); // preto
triangle(120,120,80,350,280,350); // rua

fill(70,129,39); //verde
triangle(120,120,2,350,0,120); // grama
triangle(120,120,width,350,width,120); // grama

fill(140,144,138); //cinza claro
triangle(120,120,2,350,80,350); // calçada esquerda
triangle(120,120,143,154,143,143); // calçada direita

fill(57,59,88); // azul marinho
quad(260,50,260,320,360,465,360,-5); // predio 1
quad(200,100,200,235,260,321,260,74); // predio 2
quad(163,130,163,182,200,235,200,138); // predio 3
quad(143,137,143,154,163,182,163,153); // predio 4

fill(83,98,147); // azul marinho claro
triangle(163,130,200,138,200,127); // terraço 3
triangle(143,137,163,134,163,153); // terraço 4
