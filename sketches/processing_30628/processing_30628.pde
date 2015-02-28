
import processing.opengl.*;

/*********************************************
 * Oi Kabum! BH
 * Computaçao Grafica
 * 2o Rodizio - Audio x Imagem
 * Frequencias do som como parametro
 *********************************************/

float tamanho;
float largura;

/*********************************************/
void setup() {

  //-- use um dos dois comandos abaixo, dependendo do que quer fazer
  setupFrequencias("bach1.mp3"); // 1: para usar mp3
  // setupMic();                 // 2: para usar microfone
  //-----------------------

  smooth();
  size(screen.width,screen.height,P2D);
  background(0);
}

/*********************************************/
void draw() {

  //-- esse comando calcula as frequencias do som
  calculaFrequencias();  
  //------------------------

  noStroke();
  fill(0,0,0,20);
  rect(0,0, width, height);

  tamanho = 15*freq(10)+(height-mouseY)/10;
  tamanho = random (30,100);
                                          // pmouseX: valor anterior (previous) do mouse 
  largura = abs(mouseX - pmouseX); // abs: valor absoluto = numero positivo
  
  float sorteio = random(0,100);

  if ( sorteio < 20) {
    fill (random(-300,5000)/120,50,random(-200,5000)/22,120);
    ellipse(mouseX,mouseY, tamanho,tamanho);
    bola();
  }

  sorteio = random(50);

  if ( sorteio < 50) {
    fill (random(-100,200)*45,random(-200,300)*80,50,120);
    bola2();
    ellipse(mouseX+random(-200,200),mouseY+random(-200,200)/5, tamanho/10,tamanho/10);
  }
  
 // if (sorteio < 50) {
  //  bolas();
 // }
}


void bola(){
 
  ellipse(mouseX,mouseY,tamanho,tamanho);
  for (int i = 0; i<10;i++){
    ellipse(mouseX+random(-0.1*tamanho,0.1*tamanho),mouseY+random(-0.1*tamanho,0.1*tamanho),0.8*tamanho,0.8*tamanho);
  }
}

void bolas() {
  
  int quantas = 20;
  float intervaloX = (mouseX - pmouseX)/quantas;
  float intervaloY = (mouseY - pmouseY)/quantas;
  
  for (int i = 0; i<quantas;i++){
    float diametro = 100*sin( i*PI/(quantas) );
    ellipse(pmouseX + i*intervaloX,pmouseY + i*intervaloY, diametro, diametro);
  }
  
}

void bola2(){
  //tamanho=tamanho;
  
  tamanho = 20*freq(10);
  float pos1=mouseX+random(-200,200);
  float pos2=mouseY+random(-200,200);
  ellipse(pos1,pos2,tamanho/5,tamanho/5);
  for (int i = 0; i<5;i++){
    ellipse(pos1+random(-0.1*tamanho,0.1*tamanho),pos2+random(-0.1*tamanho,0.1*tamanho),0.8*tamanho,0.8*tamanho);
  }
}


