
void setup() { // introdução dos dados
size (500,500); // tamanho da tela
smooth(); // suavização da composição
noStroke(); // sem contorno
fill(0); // cor do tipo de letra, preto.
PFont a ; // variavel a de introdução aos dados do tipo de letra usada.
a = loadFont ("Arial-BoldMT-48.vlw"); // gravação do tipo de letra a
textFont(a, 32); // tamanho do tipo de letra
text("Press mouse", 15, 50); // frase escrita na posicao 15 = x e 50 = y

}

void draw() { // introdução ao desenho em causa
if (mousePressed) { // se pressionar o mouse
translate (width/2, height/2); //translação dos ponteiro do relógio
colorMode(HSB,360,100,100); // sistema de cores usada neste caso H = Hue, S=Saturation, B= Brightness
background(55,0,58); // este fundo foi colocado no void draw para que sempre que, por exemplo o ponteiro dos segundos rode no sentido do relogio, 
//não fique a marca dos mesmos

fill(0); // cor do texto introduzido neste caso cinzento
PFont a ; // variavel a de introducao do tipo de letra usada
a = loadFont ("Arial-BoldMT-25.vlw"); // tipo de letra usada
textFont(a, 16); // tamanho do tipo de letra a com 16 
text("If you don't press mouse,", 20, 25); // frase escrita na posicao 20 = x e 25 = y
text("the pointer doesn't spin!",40,45); // frase escrita na posicao 40 = x e 45 = y

float s = second(); // conversão dos valores da variavel "s" para os segundos em tempo real
float m = minute(); // conversão dos valores da variavel "m" para os minutos em tempo real
float h = hour(); // conversão dos valores da variavel "h" para as horas em tempo real

int escala = 360; // a escala varia entre 0-360

s = map (s, 0,59, 0, escala); // mapeamento dos segundos que varia entre 0-59
m = map (m, 0,59, 0, escala); // mapeamento dos minutos que varia entre 0-59
h = map (h, 0,12, 0, escala); // mapeamento das horas que varia entre 0-12


float alturaPonteiros = height/3.0; // variável em que a altura dos ponteiros vai variar entre um terço da altura e zero


// segundos

float angleSeconds = radians(s); // variavel que vai permitir a divisao em 59 segundos

pushMatrix(); // reinicializa o movimento dos ponteiros do relógio 
rotate(angleSeconds); // rotacao do ponteiro dos segundos
stroke(60,88,99); // cor da linha
strokeWeight(30); // desenho da linha
line (0,0, 0, -200); // 200 é o comprimento do ponteiro
// e é negativo porque fiz translate do centro para width/2 e height/2
popMatrix(); // encerra o movimento para voltar a processar

// minutos

float angleMinuts = radians(m); // convertemos de angulos 0-360 para radianos
pushMatrix(); // reinicializa o movimento dos ponteiros do relógio 
rotate(angleMinuts); // rotacao do ponteiro dos minutos
strokeWeight(12);// rotação do ponteiro dos minutos
line (0,0, 0, -180); // 180 é o comprimento do ponteiro
// e é negativo porque fiz translate do centro para width/2 e height/2
popMatrix(); // encerra o movimento para voltar a processar


// horas

float angleHours = radians(h);// convertemos os angulos 0-360 para radianos
pushMatrix(); // reinicializa o movimento dos ponteiros do relógio 
rotate(angleHours); // rotacao do ponteiro das horas
strokeWeight(10); // espessura da linha
stroke(0); // cor da linha neste caso preto
line (0,0, 0, -100); // 100 é o comprimento do ponteiro
// e é negativo porque fiz translate do centro para width/2 e height/2
popMatrix(); // encerra o movimento para voltar a processar

}

}

