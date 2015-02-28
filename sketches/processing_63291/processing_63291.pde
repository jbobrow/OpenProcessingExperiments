
//funções do processing que comunicam com o computador
//e devolvem a hora, minutos e segundos
//agora vamos escalar

void setup(){
size(500,500);

}

void draw(){
background(255);
colorMode(HSB, 360,100,100);

int s = second();
int m = minute();
int h = hour();

s = (int) map(s,0,59,0,width);
m = (int) map(m,0,59,0,width);
h = (int) map(h,0,23,0,width);

println();

float alturaPonteiros = height/3.0;
//no stroke();

noStroke();
float hs = map (s,0,width,0,360);
fill(hs,100,100);
rect(0,0,s,alturaPonteiros);
float hm = map (m,0,width,0,360);
fill(hm,100,100);
rect(0,alturaPonteiros,m,alturaPonteiros);
float hh = map (h,0,width,0,360);
fill(hh,100,100);
rect(0,alturaPonteiros*2,h,alturaPonteiros);

}

