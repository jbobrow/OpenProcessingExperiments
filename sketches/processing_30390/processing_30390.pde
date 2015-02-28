
void setup() {
size(500, 200);                 // tamanho da janela
background (0);                 //cor de fundo

smooth();
}
void draw() {                  //funçoes do void setup - draw
if (mousePressed) {            //condição do rato
fill(0);
} else {
fill(255);
}
triangle (random(width), 90,150,150,250,random (height)); //objectos desenhados

}



