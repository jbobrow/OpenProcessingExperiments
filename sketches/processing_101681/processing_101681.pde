
size(700,350);
background(205,248,237);
fill(222,16,47);
// estrutura superior
quad(120,60,580,60,580,85,120,85);
//estrutura lateral esquerda
quad(120,85,158,85,158,265,120,265);
//estrutura lateral direita
quad(580,85,542,85,542,265,580,265);
line(149,84,551,84);
// sumindo com as linhas transpassadas
strokeWeight(2);
stroke(222,16,47);
line(121,85,579,85);
strokeWeight(1);
stroke(0);
fill(68,90,98);
//retângulo principal (VIDROS)
quad(150,100,550,100,550,200,150,200);
fill(134,130,120);
quad(148,83,552,83,552,100,148,100);
quad(148,200,552,200,552,207,148,207);
line(150,150,550,150);
int x;
for (x=150; x<550; x=x+8) line (x,100,x,200);
