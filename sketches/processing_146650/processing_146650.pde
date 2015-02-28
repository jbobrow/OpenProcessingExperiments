
/*Para mim a música invoca o advento da globalização, pensei em desenhar um globo terrestre e uma ligação entre o ocidente e oriente. Como desenhar um globo terrestre detalhadamente pelo processing é meio complicado, eu resolvi apenas representá-lo através de uma elipse azul. O ocidente e oriente são representados pelos desenhos da esquerda e direita, respectivamente, os desenhos da direita representam prédios urbanos em estilo ocidental, enquanto o desenho da direita representa um templo religioso do extremo oriente (budista ou shintoísta). As letras "W" e "E" representam os pontos cardeais: oeste(W) e leste(E). */
size (600,500);
background(0);
stroke (155,252,249);
strokeWeight(20);
fill(58,122,233);
ellipse (width/2,height/2, 400,400);
rectMode(CORNERS);
stroke(1);
strokeWeight(2);
fill(130);
rect(60,60,140,440);
fill(0);
rect(75,80,85,420);
rect(95,80,105,420);
rect(115,80,125,420);
fill(80);
rect(160,160,240,440);
fill(10);
rect(180,180,220,420);
stroke(255);
strokeWeight(1);
fill(255,48,38);
quad(440,440,520,440,540,400,420,400);
quad(440,400,520,400,540,360,420,360);
quad(440,360,520,360,540,320,420,320);
quad(440,320,520,320,540,280,420,280);
quad(460,280,500,280,520,240,440,240);
quad(460,240,500,240,520,200,440,200);
fill(247,230,70);
triangle(470,200,490,200,480,40);
fill(255,104,10);
ellipse(480,100,40,40);
fill(255);
stroke(0);
textSize(48);
text("W",20,220);
text("E",520,220);
stroke(255);
strokeWeight(6);
line(280,240,360,240);
line(280,280,360,280);
noStroke();
triangle(360,230,380,240,360,250);
triangle(280,270,280,290,260,280);
textSize(14);
text("Pela Internet, Gilberto Gil - 1997",360,475);
text("Igor Becker",500,490);
