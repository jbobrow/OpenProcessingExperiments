
size(600, 600);
background(202, 222, 250);
stroke(138, 138, 138);

fill(175, 0, 0);
beginShape();
vertex(275, 50);
vertex(325, 50);
vertex(325, 100);
vertex(425, 225);
vertex(475, 225);
vertex(475, 525);
vertex(125, 525);
vertex(125, 225);
vertex(175, 225);
vertex(275, 100);
endShape(CLOSE);

fill(224, 224, 224);
rect(125, 375, 350, 150); //divisão dos andares

fill(255, 255, 255);
rect(125, 370, 350, 10); //cornija

stroke(100, 100, 100);

//Reprodução utilizando variável:

int x = 150;
int y = 250;

fill(255, 255, 255);
rect(x, y, 50, 100); //janela 1
rect(x+5, y+5, 40, 90);
fill(224, 224, 224, 150); //vidro 1
rect(x, y+50, 50, 50);

fill(255, 255, 255);
rect(x+125, y, 50, 100); //janela 2
rect(x+130, y+5, 40, 90);
fill(224, 224, 224, 150); //vidro 2
rect(x+125, y+50, 50, 50);

fill(255, 255, 255);
rect(x+250, y, 50, 100); //janela 3
rect(x+255, y+5, 40, 90);
fill(224, 224, 224, 150); //vidro 3
rect(x+250, y+50, 50, 50);

//Reprodução manual:

fill(255, 255, 255);
rect(150, 400, 50, 100); //janela 4
rect(155, 405, 40, 90);
fill(224, 224, 224, 150); //vidro 4
rect(150, 450, 50, 50);

fill(255, 255, 255);
rect(275, 400, 50, 100); //janela 5
rect(280, 405, 40, 90);
fill(224, 224, 224, 150); //vidro 5
rect(275, 450, 50, 50);

fill(255, 255, 255);
rect(400, 400, 50, 100); //janela 6
rect(405, 405, 40, 90);
fill(224, 224, 224, 150); //vidro 6
rect(400, 450, 50, 50);

fill(255, 255, 255);
rect(275, 150, 50, 50); //janela do ático
rect(280, 155, 40, 40);


noStroke();
fill(38, 126, 1);
rect(0, 525, 600, 525); //grama
