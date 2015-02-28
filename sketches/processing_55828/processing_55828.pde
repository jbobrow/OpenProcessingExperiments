

PImage i;
PFont pf;

int tamanho = 5;
int opaco = 100;

void setup(){
pf = loadFont("marciano.vlw");
i = loadImage("Inna.jpg");
size(2*i.width + 20, 2*i.height-40);  // Dobro o tamanho da largura para dispor as duas imagens ...
background(255);
smooth();     // melhoramento visual das bordas ...

}

void draw(){
// Escolhendo um ponto qualquer dos eixos

text(" Marciano Lopes de Moura ", i.width - 60  ,i.height + 50);
text(" IFPI - Multimidia ", i.width -60, i.height + 67);
int x = int (random(i.width));
int y = int(random(i.height));
int armazena = x + y * i.width;

// Carrega Pixel a Pixel;
loadPixels();

// Capturando as cores de cada pixel da imagem 
float verde = green(i.pixels[armazena]);
float vermelha = red(i.pixels[armazena]);
float azul = blue(i.pixels[armazena]);  // Capturando os tons azul !!

fill(vermelha, verde, azul, opaco);
noStroke();
ellipse(x, y, tamanho, tamanho);
image(i, (10 + i.width), 0 );
}





















