
int a;
void setup(){
frameRate(5);
size(500,300);
 a=1;


//println(PFont.list());
}
void draw(){
 
  background(0);
  PFont miLetra;
String[] misLetras=PFont.list();

println(misLetras); 


miLetra=createFont(misLetras[a],62);
textFont(miLetra);
text("Alejandro",10,250);
a=a+1;
}

