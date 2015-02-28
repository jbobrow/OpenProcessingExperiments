
// Cria uma janela de 500 x 500 pixels
size (700,500);

//fundo Branco
background (100);

//Cor da linha cinza
stroke (180);

//Linhas da Fachada
fill(237,248,250);
quad(275,170,625,125,625,252,275,297);
fill(255);
//Lateral Esquerda
quad(50,100,250,150,250,300,50,250);
//Lateral Direita
quad(250,150,650,100,650,250,250,300);

fill(220);
//Linhas de Profundidade Esquerda
quad (50,100,450,65,450,75,80,107);
//Linhas de Profundidade Direita
quad(450,65,650,100,620,103,450,75);

fill(160);
quad(80,107,450,75,620,103,250,150);

//Linhas da Fachada
fill(237,248,250);
quad(275,170,625,125,625,252,275,297);

//Pronfundidade inferior
fill(160);
quad(275,291,618,248,625,252,275,297);
//Profundidade Lateral
quad(618,248,625,252,625,125,618,126);

//Balcão
fill(240);
quad(520,160,600,150,600,170,520,180);
fill(160);
quad(515,158,520,160,520,180,515,178);
//Direita Vertical Superior
line(593,148,600,150);

//Porta
fill(190);
quad(540,157,540,142,580,137,580,153);
fill(255);
quad(545,156,545,146,575,143,575,154);
