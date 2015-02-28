
int numObjects = 100; // nº de objectos

Floresta[] listaFloresta; // iniciar objecto ( dar nome)


void setup (){ 

size (800,600); //tamanho da janela
background(255);// cor de fundo da janela
smooth(); //percentagem de pixelização


listaFloresta = new Floresta [numObjects];
for (int i =0; i < numObjects; i++){ //criar variavel


float ballAlpha = (255.0/ numObjects) * i; //alpha
float vel = (3.0/ numObjects) * i; //velocidade
float largura = (75.0 / numObjects) * i; //largura

// Floresta ( x, y, largura, alpha, vel)
listaFloresta[i] = new Floresta ( (int) random(width), (int) random(height), largura , ballAlpha, vel ); 
}


}

void draw (){ //iniciar variavel

background(253,255,162);// cor de fundo da janela

for (int i =0; i < numObjects; i++){ 
listaFloresta[i].update(); //função de actualização
listaFloresta[i].desenha(); //função de desenhar

}
 


}


class Floresta {// defenir a class

float posX; // defenir posição horizontal da variavel
float posY; // defenir posição vertical da variavel
float largura; // defenir largura da variavel

float vel; // mudar para "float"
int siz; // defenir variação de "tamanho" da variavel
int r; //defenir percentagem de cor "red" tronco
int g; //defenir percentagem de cor "green" tronco
int b; //defenir percentagem de cor "blue" tronco
float a; // nova variavel para "alpha channel" 

int w;//defenir tamanho das copas
int r1; //defenir percentagem de cor "red copas
int g1; //defenir percentagem de cor "green" copas
int b1; //defenir percentagem de cor "blue" copas



// Floresta ( x, y, largura, alpha, vel)
Floresta ( float t_posX, float t_posY, float t_largura, float t_alpha, float t_vel){

posX = t_posX; 
posY = t_posY;
largura = t_largura; 

vel = t_vel; // velocidade a ser defenida como um parametro
siz = (int) random(10,30); // tamanho dos troncos
r = (int) random (40,158); //cor r tronco
g = (int) random (20,81); //cor g tronco
b = (int) random (0,15);//cor b tronco

w = (int) random (50,80); // tamanho das copas
r1 = (int) random (3,130); //cor r copas
g1 = (int) random (103,240); // cor g copas
b1 = (int) random (20,48); // cor b copas
a = t_alpha; // alpha como parametro


} 


void update (){ //iniciar variavel para actualizar a animação

if ( posX > width+(largura/2)) { 
posX = 0 - (largura/2); 
} 

//velocidade (movimento) da animação
posX = posX + vel-1 ; 


}

void desenha (){ //iniciar variável para desenhar o objecto

noStroke(); //sem contorno
fill(r,g,b);//cor do preenchimento do objecto

rect (posX, posY, siz, 600);//geometria do objecto 

stroke (random(255),0,0);//contorno
fill(0);//cor do preenchimento do objecto

noStroke(); // sem contorno
fill(r1,g1,b1);// cor do preenchimento do objecto
rect(posX,posY,siz/2,siz/2);//geometria do objecto
ellipse(posX,posY,w,w);//geometria do objecto


}


}// fim da class

