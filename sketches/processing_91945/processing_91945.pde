
PFont miletra;
int x=0;
int y=0;

void setup(){
size(800,400);
background(100,52,46);
//Declarar un arreglo de tipos de letras
frameRate(30);
}


void draw(){
  background(100,52,46);
String[] misletras = PFont.list();



miletra = createFont(misletras[int(random(1,500))],80);
textFont(miletra);

x=int (random(width));

text("S",x,random(height));
if (x==10){
text ("S",x,100);
if (x==10){

 }

}


miletra = createFont(misletras[int(random(1,500))],80);
textFont(miletra);
text("o",random(width),random(height));

miletra = createFont(misletras[int(random(1,500))],80);
textFont(miletra);
text("f",random(width),random(height));

miletra = createFont(misletras[int(random(1,500))],80);
textFont(miletra);
text("i",random(width),random(height));

miletra = createFont(misletras[int(random(1,500))],80);
textFont(miletra);
text("a",random(width),random(height));
}
