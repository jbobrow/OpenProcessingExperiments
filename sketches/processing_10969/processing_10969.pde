
class Draw {
  
int X; //posição X
int Y; //Posição Y
int bot1;//botão 1 (desligado)
int bot2; // botão 2 (ligado)
int tam; //tamanho da boca
float R; //cor vermelha
float G; // cor verde
float B; // cor azul
char start; //iniciar animação.
float Stroke; // cor do contorno/borda
int P; // posição dos pés.
int BR; // vermelho  do background
int BG; // verde do background
int BB; // azul do background  

Draw() {
  X = width;
  Y = height;
  bot1=0;//botão 1 (desligado)
  bot2 = 255; // botão 2 (ligado)
  tam=5; //tamanho da boca
  R=0; //cor vermelha
  G=0; // cor verde
  B=0; // cor azul
  start = 'n'; //iniciar animação.
  Stroke=0; // cor do contorno/borda
  P=433; // posição dos pés.
  BR=215; // vermelho  do background
  BG=242; // verde do background
  BB=245; // azul do background  
}
  
  
void desenhaLata (){
rectMode(CENTER);
strokeWeight(5); //alterando a largura do contorno para 5
stroke(Stroke, 0, 0);
fill (230);
quad (X/2 -30 , 180, X/2+30, 180, X/2 +50, Y/6, X/2 -50, Y/6);
//boca
fill (0);
rect (X/2, 165, tam, tam); 
fill (230);
//olhos
strokeWeight (8);
stroke (R, G, B);
line (X/2-15, 124, X/2-15, 101); 
line (X/2+15, 124, X/2+15, 101);
stroke (Stroke, 0, 0);
strokeWeight(5);
//pescoço
rect (250, 195, 30, 20);
//pernas
//esquerda
ellipse (225, 315, 50, 50);
ellipse (225, 340, 45, 45);
ellipse (225, 360, 40, 40);
quad (213, 377, 237, 377, 234, 408, 216, 408);
//direita
ellipse (275, 315, 50, 50);
ellipse (275, 340, 45, 45);
ellipse (275, 360, 40, 40);
quad (265, 377, 287, 377, 285, 408, 268, 408);
//corpo
fill(175);
rect (250, 250, 85, 90);
quad ( X/2 -10 , 330, X/2+10, 330, X/2 +40, 300, X/2 -40, 300);
//chapéu
triangle (200, 83, X/2, 5, 300, 83);
//pés
quad (214, 409, 235, 409, 235, P, 195, 437);
quad (267, 409, 267, 432, 314, P, 287, 411);
//braços
quad ( X/2 + 45, 208, 367, 245, 319, 294, 337, 247);
quad ( X/2 - 45, 208, 175, 278, 110, 298, 161, 258);
//Machado
strokeWeight(10);
stroke(#291305);
line (40, 260, 168, 385);
noStroke();
fill (R);
quad (168, 385, 157, 440, 100, 410, 146, 365);
strokeWeight(5);
//botoes
stroke(0);
fill (0, bot1, 0);
ellipse (234, 236, 15, 15);
fill (0, bot2, 0);
ellipse (265, 236, 15, 15); 
}


void ligaDesliga(){ 
if (mouseX > 224 && mouseX < 242 && mouseY > 227 && mouseY < 243) {
bot1 = 255;
start = 's';
bot2 = 0;
}
// retira os efeitos anteriores se o mouse for pressionado no botão2
if (mouseX > 255 && mouseX < 274 && mouseY > 227 && mouseY < 243){
bot1 = 0;
start = 'n';
}
}
// método que acontece caso uma tecla seja pressionada.


void Alerta (){
    JOptionPane.showMessageDialog (null, "Ele pode entrar em pane :OOO", "ESQUECI DE AVISAR  : ", JOptionPane.WARNING_MESSAGE);
}

void EfeitosCor (){
  background (BR, BG, BB);
  // faz os efeitos que acontecerão quando o botão 1 estiver ligado:
if (start =='s') {  
Stroke = random (0, 255); // deixa a cor do contorno randômica, em escala de cinza.
R = random (0, 255); // deica as cores dos olhos randômicas
G = random (0, 255);
B = random (0, 255);
tam = 15; // aumenta o tamanho da boca
P = 412; // mové os pés
BR = 0; // deixa a cor do fundo preta
BG = 0;
BB = 0;
}
// faz os efeitos que acontecerão quando o botão 2 estiver ligado:
else {
 Stroke = (0); // todos os efeitos são anulados e voltam ao estado anterior
 R=0;
 G=0;
 B = 0; 
 tam = 5;
 P = 433;
 BR = 215;
 BG = 242;
 BB = 245;
 }
}

void animacao() {
//animaçao:
//faz o botão esquerdo ficar aceso caso o mouse esteja por cima dele, e apagado caso contrário.
if (mouseX > 224 && mouseX < 242 && mouseY > 227 && mouseY < 243) {
bot1 = 255;}
else {
if (start=='n')
bot1 = 0;
}
//faz o mesmo que o anterior, desta vez com o botão direito.
if (mouseX > 255 && mouseX < 274 && mouseY > 227 && mouseY < 243) {
bot2 = 255;}
else {
if (start=='s')
bot2 = 0;
}
}

}



