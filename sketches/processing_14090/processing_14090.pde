
//Quebra cabeça com dezesseis peças
//as imagens estão sendo partidas com o get
//com varias bolinha caindo no final
//com musica
import ddf.minim.*;

AudioPlayer player, player2;
Minim minim;


PImage ori,qc1,qc2,qc3,qc4,qc5,qc6,qc7,qc8,qc9;
PImage peca[]= new PImage[16];
int pecaPos[]=new int[16];
int posVaziaX, posVaziaY, vazia;
int j,i;
PFont fonte, letra;

int tempoInicial, tempoAtual;

PImage imagem;
PImage pecaPremio;
float x[]=new float [500];
float y[]= new float [500];
float vx[]= new float [500];
float vy[]= new float [500];
float cor[] = new float[500];

int qualImagem;

void setup(){

  minim = new Minim(this);

  size(1024,768);

  player = minim.loadFile("Nick.mp3");
  player2 = minim.loadFile("fim.mp3");

  //carrega a imagem
  //..
  //imagem aleatórias
  imagem = loadImage(int(random(1, 9.9))+".JPG");
  //imagem = loadImage ("hj.JPG");
  //para escolher a imagem que a pessoa quer montar
  //imagem = loadImage("11.jpg");


  imagem.resize(1024,768);

  letra = loadFont("tem.vlw");

  parte(imagem, 4, 4);

  posVaziaX=3*width/4;
  posVaziaY=3*height/4;
  vazia=15;

  fonte = loadFont("gh.vlw");

  tempoInicial = millis();

  for (int i=0;i<500;i++){
    x[i]=random(0,width);
    y[i]=random(-100,-80);
    vx[i]=random (-5,5);
    vy[i]=random (-5,5);
    cor[i] =255;
  }
  Embaralha();

}

void draw(){
  Pecas();
  mostraPos();
  Tempo();
  menu();
  dica();

}

void Pecas(){
  for (int j=0; j<4; j++){
    for(int i=0; i<4; i++){
      image(peca[(j*4)+i],i*1024/4,j*768/4);
    }
  }
}

void clicada(int x, int y){

  int clicada=(x/256)+4*(y/192);

  println(x+ " " + y);
  println(clicada);

  if(clicada==vazia-4 || clicada==vazia+4  || (clicada==vazia+1 &&  clicada/4 != clicada/4.0)   || clicada==vazia-1 &&  vazia/4 != vazia/4.0){

    PImage temp=peca[clicada];
    peca[clicada]=peca[vazia];
    peca[vazia]=temp;

    int posTemp=pecaPos[clicada];
    pecaPos[clicada]=pecaPos[vazia];
    pecaPos[vazia]=posTemp; 

    vazia=clicada;

    player.play(1);

  }
}

void mousePressed(){
  clicada(mouseX, mouseY);


}

void dica() {
  if (mouseX>0 && mouseX <75 && mouseY > 0 && mouseY < 20 && mousePressed) {
    image(imagem,0,0); 
  }
}

void Embaralha(){
  for (int i = 0; i <1000; i++) {
    clicada(int(random(width)),int(random(height))); 
  }
}

void mostraPos() {
  //pushMatrix();
  for (int i =0; i < 16; i++) {
    // print(pecaPos[i] + "  ");
  }
  // println("");

}

// boolean: verdadeiro (true) / falso (false)
boolean premiacao(){
  for (int i =0; i < 16; i++) {
    if (pecaPos[i] != i) {
      return false;  // sai da funcao e retorna um valor
    }
  }

  pushMatrix();
  noStroke();
  popMatrix();

  fill(150,random(255),random(249));
  textFont(fonte);
  text("Você venceu!!!",width/2-100,height/2);
  text("Parabéns",width/2-200,height/2-200);
  player2.play();
  peca[15] = pecaPremio;
  Bolinha();
  return true;
}

void parte(PImage imagem, int nx, int ny) {

  int larg, alt;

  larg = int(imagem.width/nx);
  alt = int(imagem.height/ny);


  //fatia a imagem 
  for (int i = 0; i < nx; i++) {
    for (int j = 0; j < ny; j++) {
      int ordem = j + i*4;
      peca[ordem] = imagem.get(j*larg, i*alt, larg, alt);
      pecaPos[ordem] = ordem;
      //
    }
  }
  pecaPremio = peca[15].get();
  peca[15] = loadImage("vazio.jpg");

}
void Tempo(){
  

  if ( !premiacao() ) {
    tempoAtual = millis() - tempoInicial;
    tempoAtual = tempoAtual / 1000;
  }
}

void menu() {
  fill(134,31,203,80);
  stroke(134,31,203);
  rect(0,0,190,20);
 // rect(0,20,80,20);
  fill(134,31,203);

  textFont(letra,20);
  text("Ajuda|",20,15);
  //text("Dica",20,35);

  text("Tempo:  " + tempoAtual,80,15);  
}

void Bolinha(){


  smooth(); 
  for(int i= 0;i<500;i++){
    figura(x[i],y[i],50);
    x[i]=x[i]+vx[i];
    y[i]=y[i]+vy[i];  

    //if(x[i] > width){
    //fill(254,25,36);  
    //}


    if(x[i]<0){
      vx[i]=-vx[i];
    }
    if(x[i]>width){
      vx[i]=-vx[i];
    }

    if(y[i]<0){
      y[i] = 0;
      vy[i]=-vy[i];
    }
    if(y[i]>height){
      y[i] = 0;
      vy[i]=-vy[i];
    }
  }
}
void figura(float xe,float ye,float cor){
  fill(200,random(240),random(255),100);
  ellipse(xe,ye,20,20);
}

void stop(){

  player.close();
  player2.close();

  minim.stop();

  super.stop();
}







