
void setup(){ // definições de Set up

size (500,500);// definir a area da janela
background (255);// definir cor de fundo
smooth();// suavizar o contorno mesmo que este nao contenha stroke
frameRate(3);// tem tres frames por segundo
}

void draw(){//  definições do draw

stroke (0);// define o contorno 
strokeWeight (2);// espessura do contorno

for (int i=0; i < 100; i=i+1){ // numero de vezes que um objecto de repete

float posX_1 = random (width);// para gerar um numero para a posiçao horizontal
float posY_1 = random (height);//para gerar um numero para a posiçao vertical
float posX_2 = random (width);// para gerar um numero para a posiçao horizontal
float posY_2 = random (height);// para gerar um numero para a posiçao vertical

line (posX_1, posY_1, posX_2, posY_2); // para criar a linha

fill (0,100);// cor de preenchimento do quadrado e a opacidade 
rect (posX_1, posY_1, 10, 10);// para criar os quadrados  nas respectivas posiçoes
rect (posX_2, posY_2, 10, 10);// para criar os quadrados nas respectivas posiçoes

}
}

