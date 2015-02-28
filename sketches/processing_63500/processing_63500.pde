
/*
RELÓGIO BINÁRIO
 */

import ddf.minim.*; // Importa a biblioteca "minim"

Minim sound;
AudioSample som1, som2, som3, som4, som5, som6, som7, som8, som9, som10, som11, som12, som13; // Variáveis de cada som

PFont font; // Chamada da class para a fonte

int dX, dY; // Variáveis das dimensões da tela
float cX, cY; // Variáveis das coordenadas do centro da tela

boolean check1, check2, check3, check4, check5, check6, check7, check8, check9, check10, check11, check12, check13; // Variáveis para verificar se o som toca ou não

int h, m, s; // Variáveis de Horas, Minutos e Segundos
int h1, h2, m1, m2, s1, s2; // Variáveis dos primeiros e segundos valores de Horas, Minutos e Segundos
boolean on; // Variável para ligar ou desligar a luz

CircT   circH11, circH21, circM11, circM21, circS11, circS21, circH12, circH22, circM12, circM22, circS12, circS22, circH24, circM14, circM24, circS14, circS24, circH28, circM28, circS28; // Criação dos objectos

void setup() {
  font = loadFont("DaxMedium-48.vlw"); // Loading da fonte

  // Faz o load de cada som
  sound = new Minim(this);
  som1 = sound.loadSample("tshi.mp3", 1000);
  som2 = sound.loadSample("kuts.mp3", 1000);
  som3 = sound.loadSample("taka.mp3", 1000);
  som4 = sound.loadSample("beat1.mp3", 1000);
  som5 = sound.loadSample("whou.mp3", 1000);
  som6 = sound.loadSample("beat2.mp3", 1000);
  som7 = sound.loadSample("whisel.mp3", 1000);
  som8 = sound.loadSample("touro.mp3", 1000);
  som9 = sound.loadSample("you_are.mp3", 1000);
  som10 = sound.loadSample("kuru.mp3", 1000);
  som11 = sound.loadSample("tururu.mp3", 1000);
  som12 = sound.loadSample("tatu.mp3", 1000);
  som13 = sound.loadSample("na.mp3", 1000);

  dX=500; // Largura da tela 
  dY=500; // Altura da tela

  size(dX, dY); // Criação da tela

  cX=dX*0.5; // Centro horizontal da tela
  cY=dY*0.5; // Centro vertical da tela

  // Definição dos objectos com as suas posições a partir do centro da tela
  circH11 = new CircT(int(cX-90), int(cY+45));
  circH21 = new CircT(int(cX-60), int(cY+45));
  circM11 = new CircT(int(cX-15), int(cY+45));
  circM21 = new CircT(int(cX+15), int(cY+45));
  circS11 = new CircT(int(cX+60), int(cY+45));
  circS21 = new CircT(int(cX+90), int(cY+45));
  circH12 = new CircT(int(cX-90), int(cY+15));
  circH22 = new CircT(int(cX-60), int(cY+15));
  circM12 = new CircT(int(cX-15), int(cY+15));
  circM22 = new CircT(int(cX+15), int(cY+15));
  circS12 = new CircT(int(cX+60), int(cY+15));
  circS22 = new CircT(int(cX+90), int(cY+15));
  circH24 = new CircT(int(cX-60), int(cY-15));
  circM14 = new CircT(int(cX-15), int(cY-15));
  circM24 = new CircT(int(cX+15), int(cY-15));
  circS14 = new CircT(int(cX+60), int(cY-15));
  circS24 = new CircT(int(cX+90), int(cY-15));
  circH28 = new CircT(int(cX-60), int(cY-45));
  circM28 = new CircT(int(cX+15), int(cY-45));
  circS28 = new CircT(int(cX+90), int(cY-45));
}

void draw() {
  h=hour(); // Valor das horas
  m=minute(); // Valor dos minutos
  s=second(); // Valor dos segundos

  // Separa cada valor em dois se esse valor for constituido por dois números, caso contrario atribui o valor "0" ao primeiro.
  if (str(h).length()==2) {
    h1=int(str(h).substring(0, 1));  
    h2=int(str(h).substring(1));
  }
  else {
    h1=int(0);  
    h2=int(str(h).substring(0, 1));
  }
  if (str(m).length()==2) {
    m1=int(str(m).substring(0, 1));
    m2=int(str(m).substring(1));
  }
  else {
    m1=int(0);
    m2=int(str(m).substring(0, 1));
  }
  if (str(s).length()==2) {
    s1=int(str(s).substring(0, 1));
    s2=int(str(s).substring(1));
  }
  else {
    s1=int(0);
    s2=int(str(s).substring(0, 1));
  }

  background(0); // Cor de fundo

  // Desenho dos objectos
  // Cada objecto tem passa o parametro, de acordo com a validade da condição (Se os valores forem iguais é verdadeiro, caso contrário é falso)
  circH11.cria((h1==1) ? true : false);
  circH21.cria((h2==1||h2==3||h2==5||h2==7||h2==9) ? true : false);
  circM11.cria((m1==1||m1==3||m1==5) ? true : false);
  circM21.cria((m2==1||m2==3||m2==5||m2==7||m2==9) ? true : false);
  circS11.cria((s1==1||s1==3||s1==5) ? true : false);
  circS21.cria((s2==1||s2==3||s2==5||s2==7||s2==9) ? true : false);
  circH12.cria((h1==2) ? true : false);
  circH22.cria((h2==2||h2==3||h2==6||h2==7) ? true : false);
  circM12.cria((m1==2||m1==3) ? true : false);
  circM22.cria((m2==2||m2==3||m2==6||m2==7) ? true : false);
  circS12.cria((s1==2||s1==3) ? true : false);
  circS22.cria((s2==2||s2==3||s2==6||s2==7) ? true : false);
  circH24.cria((h2==4||h2==5||h2==6||h2==7) ? true : false);
  circM14.cria((m1==4||m1==5) ? true : false);
  circM24.cria((m2==4||m2==5||m2==6||m2==7) ? true : false);
  circS14.cria((s1==4||s1==5) ? true : false);
  circS24.cria((s2==4||s2==5||s2==6||s2==7) ? true : false);
  circH28.cria((h2==8||h2==9) ? true : false);
  circM28.cria((m2==8||m2==9) ? true : false);
  circS28.cria((s2==8||s2==9) ? true : false);

  //Cada uma liga o som na altura em que a luz acende, e verifica se o som já está a tocar para não repetir
  if ((s2==1 || s2==3 || s2==5) && check1==false) {
    som1.trigger();
    check1=true;
  }
  else if ((s2==1 || s2==3 || s2==5) && check1==true) {
  }
  else {
    check1=false;
  }

  if ((s2==2 ||s2==7 || s2==8) && check2==false) {
    som2.trigger();
    check2=true;
  }
  else if ((s2==2 ||s2==7 || s2==8) && check2==true) {
  }
  else {
    check2=false;
  }

  if ((s2==4 || s2==6 || s2==9) && check3==false) {
    som3.trigger();
    check3=true;
  }
  else if ((s2==4 || s2==6 || s2==9) && check3==true) {
  }
  else {
    check3=false;
  }

  if ((s1==1 || s1==3 || s1==5) && check4==false) {
    som4.trigger();
    check4=true;
  }
  else if ((s1==1 || s1==3 || s1==5) && check4==true) {
  }
  else {
    check4=false;
  }

  if ((s1==2 || s1==4) && check5==false) {
    som5.trigger();
    check5=true;
  }
  else if ((s1==2 || s1==4) && check5==true) {
  }
  else {
    check5=false;
  }

  if (m2==9 && check6==false) {
    som6.trigger();
    check6=true;
  }
  else if (m2==9 && check6==true) {
  }
  else {
    check6=false;
  }

  if ((m2==4 || m2==7) && check7==false) {
    som7.trigger();
    check7=true;
  }
  else if ((m2==4 || m2==7) && check7==true) {
  }
  else {
    check7=false;
  }

  if ((m2==2 || m2==6 || m2==8) && check8==false) {
    som8.trigger();
    check8=true;
  }
  else if ((m2==2 || m2==6 || m2==8) && check8==true) {
  }
  else {
    check8=false;
  }

  if ((m2==1 || m2==3 || m2==5) && check9==false) {
    som9.trigger();
    check9=true;
  }
  else if ((m2==1 || m2==3 || m2==5) && check9==true) {
  }
  else {
    check9=false;
  }

  if ((m1==2 || m1==4) && check10==false) {
    som10.trigger();
    check10=true;
  }
  else if ((m1==2 || m1==4) && check10==true) {
  }
  else {
    check10=false;
  }

  if ((m1==1 || m1==3 || m1==5) && check11==false) {
    som11.trigger();
    check11=true;
  }
  else if ((m1==1 || m1==3 || m1==5) && check11==true) {
  }
  else {
    check11=false;
  }

  if (h1==1 && check12==false) {
    som12.trigger();
    check12=true;
  }
  else if (h1==1 && check12==true) {
  }
  else {
    check12=false;
  }

  if (h1==2 && check13==false) {
    som13.trigger();
    check13=true;
  }
  else if (h1==2 && check13==true) {
  }
  else {
    check13=false;
  }


  /////////////////////////////////////////

  filter(BLUR, 0.75); // Aplicação de filtro BLUR nas círcunferências

  textFont(font, 50); // Criação da fonte e definição do tamanho
  fill(255); //Cor do texto

  // Letras das colunas
  textAlign(CENTER, CENTER); // Alinhamento do texto ao centro
  text("H", cX-75, cY+90); // Desenho do texto na posição central da tela
  text("M", cX, cY+90);
  text("S", cX+75, cY+90);

  // Números das linhas
  textFont(font, 14);
  text("8", cX+120, cY-47);
  text("4", cX+120, cY-17);
  text("2", cX+120, cY+13);
  text("1", cX+120, cY+43);

  // Valor numérico de cada coluna
  /*
  textFont(font, 18);
   text(h1, cX-90, cY-90);
   text(h2, cX-60, cY-90);
   text(m1, cX-15, cY-90);
   text(m2, cX+15, cY-90);
   text(s1, cX+60, cY-90);
   text(s2, cX+90, cY-90);
   */

  filter(BLUR, 0.75); // Aplicação de filtro BLUR
}

// Criação da class do objecto
class CircT { 
  int endX, endY;
  boolean on; // Variável "Ligado/Desligado"
  // Parâmetros do objecto que definem a posição de cada circunferência
  CircT(int tempEndX, int tempEndY) {
    endX=tempEndX;
    endY=tempEndY;
  }
  void cria(boolean tempOn) {
    on=tempOn;
    // Se a variável "on" seja "true", o preenchimento é vermelho
    if (on==true) {
      fill(255, 0, 0);
    }
    // Caso a variável "on" seja "false", o preenchimento é branco
    else {
      fill(50);
    }
    noStroke(); // Sem traço
    ellipse(endX, endY, 20, 20); // Circunferência de diâmetro 20
  }
}

void stop()
{
  // Fecha as classes
  som1.close();
  som2.close();
  som3.close();
  som4.close();
  som5.close();
  som6.close();
  som7.close();
  som8.close();
  som9.close();
  som10.close();
  som11.close();
  som12.close();
  som13.close();
  // Para o som antes de fechar
  sound.stop();
  super.stop();
}


