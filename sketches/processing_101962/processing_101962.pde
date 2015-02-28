
/* Made by: Ana Beatriz Villela & Wagner Schuques. Curitiba, June,24th */

size(500, 500);
background(#999999);

/*Calçada*/
fill(#666666);
rect(0, 0, 500, 150);
rect(0, 400, 500, 500);

/*Rua*/
strokeWeight(2);
line(500, 400, 0, 400);
line(500, 150, 0, 150);

/*Faixas*/
strokeWeight(20);
stroke(#ffffff);
line(150, 180, 30, 180);
line(150, 220, 30, 220);
line(150, 260, 30, 260);
line(150, 300, 30, 300);
line(150, 340, 30, 340);
line(150, 380, 30, 380);
strokeWeight(10);
stroke(#FFFF00);
line(200, 280, 280, 280);
line(330, 280, 410, 280);
line(460, 280, 500, 280);

/* estação tubo */
noStroke();
strokeWeight(1);
fill(#2E2C2C);
rectMode(CORNERS);
rect(180,112,240,130);
fill(#1A1717);
triangle(180,112,180,130,155,112);
fill(#4D4D4D);
ellipse(300,80,80,65);
rectMode(CORNERS);
rect(150, 112, 300, 47);
fill(#777777);
ellipse(150, 80, 80, 65);

/*Onibus*/
noStroke();
fill(#000000);
ellipse(340, 230, 30, 30);
ellipse(260, 230, 30, 30);
ellipse(420, 230, 30, 30);
ellipse(220, 190, 30, 30);
fill(#E8C62C);
noStroke();
quad(200, 100, 200, 180, 240, 230, 240, 150);
fill(#DBB735);
quad(200, 100, 380, 100, 440, 150, 240, 150);
fill(#F5D548);
quad(240, 150, 440, 150, 440, 230, 240, 230);
/*Janelas*/
fill(#82837E);
rectMode(CORNERS);
rect(250, 160, 290, 200);
rect(295, 160, 335, 200);
rect(340, 160, 380, 200);
rect(385, 160, 425, 200);
quad(205, 115, 205, 145, 235, 185, 235, 155);
fill(#bb4400);
ellipse(230, 195, 10,13);
ellipse(208, 168, 10,12);
