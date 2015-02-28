
int a=1, pos=0;
char[] nom={'M','A','R','I','A','N','A'};

void setup(){
size(800,500);
background(0);
frameRate(10);
}
void draw(){
 background(0);
PFont tipo_letra;
tipo_letra=loadFont("LucidaBright-48.vlw");
textFont(tipo_letra, a+=5);
fill(255);
text("Mariana Calderón",pos++,pos+=3);
fill(150,0,200);
text(a,0,500);
}
