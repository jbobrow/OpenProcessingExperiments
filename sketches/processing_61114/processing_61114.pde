
void setup(){ // definições de setup
  size(500,500); // tamanho da janela de fundo
}

void draw(){ // definições do desenho
  
  background(0); // cor do fundo
  smooth(); // suaviza o desenho
  
  int segundos=second(); // variável dos segundos
  int minutos=minute(); // variável dos minutos
  int horas=hour(); // variável das horas
  
  int x=width/2; // centro de X do arco
  int y=height/2; // posição de Y do arco
  
  float  angulo1=0; // variável do ângulo do arco
  float angulo2=PI+PI; // variável do ângulo do arco
  
  noStroke(); // não tem contorno
  
  fill(234.234,234); // cor de preenchimento da circunferência dos segundos
  ellipse(x,y, 300,300); // posição e tamanho da circunferência
  fill(255); // cor de preenchimento do arco dos segundos
  arc(x,y, 300,300, angulo1+segundos*0.053, angulo2-segundos*0.053); // posição X e Y dos arcos, tamanho de X e Y e a primeira  e segunda posição do ângulo que varia por segundo, respectivamente.
  
  fill(150,0,0); // cor de preenchimento da circunferência dos minutos
  ellipse(x,y, 200,200); // posição e tamanho da cincunferência
  fill(255,0,0); // cor de preenchimento do arco dos minutos
  arc(x,y, 200,200, angulo1+minutos*0.053,angulo2-minutos*0.053); // posição X e Y dos arcos, tamanho de X e Y e a primeira  e segunda posição do ângulo que varia por minuto, respectivamente.
  
  fill(0,0,150); // cor de preenchimento da circunferência das horas
  ellipse(x,y, 100,100); // posição e tamanho da circunferência
  fill(0,0,255); // cor de preenchimento do arco das horas
  arc(x,y, 100,100, angulo1+horas*0.159,angulo2-horas*0.159); // posição X e Y dos arcos, tamanho de X e Y e a primeira  e segunda posição do ângulo que varia por hora, respectivamente.
  
}
