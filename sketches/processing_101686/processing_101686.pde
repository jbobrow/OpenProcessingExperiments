
//FÁBIO BARROS GOUVEIA
// FACHADA EDIFÍCIO
size(500,600);
background(50, 120, 200);// céu
colorMode(RGB);

fill(215, 240, 245);// prédio
rect(0,561, 600, 40);

stroke (0,0,0); // para colorir linha
strokeWeight (2); // definir grossura da linha
beginShape(); // para inteligar linhas
vertex(110,100);
vertex(130,280);
vertex (90,470);
vertex (50, 470);
vertex (50, 560);
vertex(420, 560);
vertex(420, 440);
vertex(365,446);
vertex(330, 280);
vertex(255,190);
vertex(330,140);
vertex(370,50);
endShape(CLOSE);

beginShape();
fill(155,215,235);
vertex(330,140);
vertex(330,280);
vertex(255,190);
endShape(CLOSE);

strokeWeight (1);
//Linhas horizontais
for(int i=0; i<3;i++)
line (110+i*2, 100+i*15, 350-i*8, 100+i*15);

for(int i=0; i<10;i++)
line (115+i*1.7, 145+i*15, 330-i*0, 145+i*15);

for(int i=0; i<12;i++)
line (130-i*3, 280+i*15, 330+i*3, 280+i*15);

line(90,470, 280,470);

// Linhas verticais
line(280, 470, 365,446);
line(130, 100, 130, 470);
line(160, 100, 160, 470);
line(190, 100, 190, 470);
line(220, 100, 220, 470);
line(250, 100, 250, 470);
line(280, 100, 280, 175);
line(310, 100, 310, 154);
line(280, 220, 280, 470);
line(310, 255, 310, 461);
line(338, 312, 339, 454);


//Haal de entrada do edifício
stroke (0,0,0); // para colorir linha
strokeWeight (2); // definir grossura da linha
fill(190, 190, 190);//cor do hall de entrada
quad(280, 540, 320, 540, 320, 560, 280, 560); // Hall de entrada principal

stroke (0,0,0); // para colorir linha
strokeWeight (1); // definir grossura da linha
fill(0,0,0);//cor do hall de entrada


//Linhas horizontais paralelas (Ambiente comercial do edifício)
line(50, 480, 420, 480); 
line(50, 495, 420, 495);
line(50, 510, 420, 510);
line(50, 525, 420, 525);

//Traços diagonais amarelos
stroke (255, 255, 0); // para colorir linha
strokeWeight (1.5); // definir grossura da linha
fill(255, 255, 0);// cor da linha
line(60, 470, 245, 559); 
line(75, 560, 115, 470);
line(50, 560, 240, 470);
line(50, 500, 130, 560);
line( 380, 447, 420, 585);
line(420, 463, 350, 560);
line(420, 448, 160, 560);

stroke (173,234,234); // para colorir linha
strokeWeight (1); // definir grossura da linha
fill(173,234,234);// cor da linha
fill(173,234,234,160);
ellipse(50, 50, 200, 40);
ellipse(100, 70, 150, 40);
ellipse(400, 25, 180, 40);
ellipse(445, 50, 100, 35);


//Gramado
stroke (0, 0, 0); // para colorir linha
strokeWeight (1); // definir grossura da linha
fill(173,255,47);
rect(0,561, 600, 40);
