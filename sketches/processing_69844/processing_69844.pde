
char[] nom={'M','A','R','I','A','N','A'};
int[] posX={50,100,150,200,250,300,350};
int[] alX={(int)random(1,400),(int)random(1,400),(int)random(1,400),(int)random(1,400),(int)random(1,400),(int)random(1,400),(int)random(1,400)};
int[] alY={(int)random(40,300),(int)random(40,300),(int)random(40,300),(int)random(40,300),(int)random(40,300),(int)random(40,300),(int)random(40,300)};
int i=0, m=0;


void setup(){
size(450,300);
background(0);
frameRate(100);
for(i=0;i<=6;i++){
  text(nom[i],alX[i],alY[i]);
}

}
void draw(){
background(0);  
PFont tipo_letra;
tipo_letra=loadFont("LucidaBright-48.vlw");
textFont(tipo_letra, 32);
fill(255);
for(i=0;i<=6;i++){
  text(nom[i],alX[i],alY[i]);
}
if(alX[m]<posX[m]) alX[m]++;
  else if (alX[m]>posX[m]) alX[m]--;
if(alY[m]<alY[0]) alY[m]++;
  else if (alY[m]>alY[0]) alY[m]--;
if(alX[m]==posX[m]&& alY[m]==alY[0]) {if (m<6) m++;}
}
