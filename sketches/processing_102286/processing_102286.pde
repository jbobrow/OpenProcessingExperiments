
size(800,700);

background(0,0,255);

fill(0,255,0);
rect(0,500,800,800); // grama

fill(150,100,100);
rect(10,280,500,300); // parede 1
rect(510,280,700,250); // parede 2

fill(255);
rect(490,280,50,300); // coluna 2
rect(300,280,50,300); // coluna 1
rect(10,240,790,40); // viga 1

fill(200);
quad(50,190,750,190,800,240,10,240); // telhado 1

fill(255);
triangle(300,280,540,280,420,200); 

fill(150,150,250);
rect(50,285,200,285); // janela

fill(180,150,150);
rect(385,290,70,290); // porta

fill(150,100,100);
rect(100,50,600,140); // parede andar de cima

fill(255);
rect(490,50,50,140); // coluna 3
rect(300,50,50,140); // coluna 4
rect(100,50,600,40); // viga 2

fill(150,150,250);
rect(385,100,70,70); // janela

fill(200);
quad(150,30,650,30,700,50,100,50); // telhado de cima

for (int i = 280; i < 585; i = i+15) {
  line(300, i, 350, i);
} 

for (int i = 280; i < 585; i = i+15) {
  line(490, i, 540, i);
} 

for (int i = 100; i < 200; i = i+15) {
  line(300, i, 350, i);
} 

for (int i = 100; i < 200; i = i+15) {
  line(490, i, 540, i);
} 

stroke(0,255,0);
int i = 0;
while (i < 300) {
  line(i,580,i + 20,520);
  i = i + 15;
} // planta

int x = 0;
while (x < 300) {
  line(x,580,x - 20,520);
  x = x + 15;
} // planta
