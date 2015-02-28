
int x;
void setup(){
  frameRate(8);
size(900,600);
x=0;
}
void draw(){
background(0);
PFont miLetra;
String[] misLetras = PFont.list();
println (misLetras);
miLetra = createFont(misLetras[int(random(1,543))],72);
fill(random(250),random(0),random(100));
textFont(miLetra,x);
text ("Frankie",50,400);
x=x+1;
}
