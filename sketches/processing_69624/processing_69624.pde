
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
fill(random(250),random(255),random(100));
textFont(miLetra,x);
text ("Cendejas",random(x),590);
x=x+1;
}

