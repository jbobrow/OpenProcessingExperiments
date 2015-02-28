

int value = 255;// variável em que o valor é 0
void setup()// definição dos elementos estáticos
{
size (500,500);// define a área de composição
background (0);// define a cor de fundo
smooth();// suaviza a imagem
}

void draw()// definiçãodos elementos em animação
{
  
fill(value);// o preenchimento vai ser igual a 255

PImage img; //denominei a imagem como img 

img = loadImage ("morder o lábio.jpg"); // upload da imagem

image(img,50,50);// posicionamento da imagem

PFont arialBold;// denominei a fonte de ariaBold


arialBold = loadFont ("Helvetica-48.vlw");// upload da fonte

// tamnhos de letra e posicinamento da mesma
textSize(18);
text("F",320,212);
textSize(25);
text("A",340,238);
textSize(25);
text("k",320,240);
textSize(80);
text("P",70,450);
textSize(80);
text("L",104,460);
textSize(25);
text("a",130,450);
textSize(58);
text("e",280,280);
textSize(60);
text("H",240,330);
textSize(60);
text("t",287,337);
textSize(20);
text("o",309,212);
textSize(25);
text("s",337,227);
textSize(18);
text("g",327,215);
textSize(12);
text("m",326,200);
textSize(140);
text("ç",16,489);
textSize(54);
text("b",231,368);
textSize(140);
text("A",90,572);
textSize(40);
text("i",210,390);
textSize(40);
text("n",208,430);
textSize(34);
text("e",217,363);
textSize(49);
text("j",178,443);
textSize(42);
text("u",259,286);
textSize(12);
text("v",336,210);
textSize(12);
text("Q",336,200);
textSize(10);
text("x",346,199);
textSize(10);
text("c",352,199);
textSize(10);
text("d",356,206);
textSize(15);
text("t",349,210);
textSize(52);

}














