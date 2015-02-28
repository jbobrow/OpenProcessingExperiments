
size(640, 480);
  background(59, 98, 178);
  colorMode(RGB); 

//luz celestial dos deuses iluminando a obra de arte

fill(255, 255, 255, 40);
noStroke();
quad(450, 0, 590, 0, 390, 480, 40, 480);

//nuvens

fill(255, 255, 255, 100);
noStroke();
ellipse(56, 46, 200, 50);

fill(255, 255, 255, 100);
noStroke();
ellipse(300, 100, 200, 50);

fill(255, 255, 255, 100);
noStroke();
ellipse(500, 50, 200, 50);

fill(255, 255, 255, 150);
noStroke();
ellipse(100, 46, 250, 80);

fill(255, 255, 255, 100);
noStroke();
ellipse(500, 100, 250, 80);

fill(255, 255, 255, 150);
noStroke();
ellipse(230, 80, 200, 50);

fill(255, 255, 255, 150);
noStroke();
ellipse(130, 130, 200, 50);

fill(255, 255, 255, 150);
noStroke();
ellipse(570, 130, 200, 50);

//chão maravilhoso
fill(210, 210, 240);
quad(0, 370, 640, 420, 640, 640, 0, 640);

//edificio incrível

fill(240, 221, 128);
rect(160, 200, 350, 220);

fill(165, 42, 42); //detalhe vermelho
rect(160, 400, 350, 20);

fill(255, 255, 255); //detalhe branco
rect(160, 200, 350, 5);

textSize(10);
fill(0, 0, 0);
text("C A S A   D O   E X P E D I C I O N Á R I O", 238, 225);

fill(245, 226, 133); //esquerda
rect(115, 190, 95, 230);

fill(245, 226, 133); //direita
rect(460, 190, 95, 230);

fill(255, 255, 255); //detalhe branco esq
rect(112, 190, 100, 20);

fill(255, 255, 255); //detalhe branco dir
rect(458, 190, 100, 20);

fill(47, 47, 49); //janela de dentro 1
rect(230, 235, 30, 185);

fill(47, 47, 49); //janela de dentro 2
rect(275, 235, 30, 185);

fill(47, 47, 49); //janela de dentro 3
rect(320, 235, 30, 185);

fill(47, 47, 49); //janela de dentro 4
rect(365, 235, 30, 185);

fill(47, 47, 49); //janela de dentro 5
rect(410, 235, 30, 185);

fill(47, 47, 49); //janela de fora direita
rect(490, 250, 30, 170);

fill(455, 455, 455); //janela de fora direita detalhe sup
rect(490, 400, 30, 20);

fill(455, 455, 455); //janela de fora direita detalhe inf
rect(490, 305, 30, 20);

fill(47, 47, 49); //redondinho da janela da direita
arc(505, 250, 30, 30, PI, TWO_PI);

fill(47, 47, 49); //janela de fora esq
rect(150, 250, 30, 170);

fill(47, 47, 49); //redondinho da janela da esquerda
arc(165, 250, 30, 30, PI, TWO_PI);

fill(455, 455, 455); //janela de fora esq detalhe sup
rect(150, 400, 30, 20);

fill(455, 455, 455); //janela de fora esq detalhe inf
rect(150, 305, 30, 20);

fill(170, 132, 98); //tijolinhos
rect(115, 420, 440, 20);

//escadaria

fill(100, 66, 66); //fundo marrom
quad(210, 420, 460, 420, 500, 450, 170, 450);

fill(180, 180, 180); //primeiro degrau
quad(210, 420, 460, 420, 470, 425, 200, 425);

fill(180, 180, 180); //segundo degrau
quad(195, 430, 475, 430, 485, 435, 185, 435);

fill(180, 180, 180); //terceiro degrau
quad(185, 440, 485, 440, 495, 445, 175, 445);
