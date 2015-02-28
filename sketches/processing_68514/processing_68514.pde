
void setup(){

size(400,400);
}
void draw(){
  frameRate (6);
  background(0);
PFont miletra;

String[] misLetras= PFont.list ();

println (misLetras);

miletra = createFont(misLetras [int(random(1,500))], 62);

textFont(miletra);
text ("EMILIO",80,200);
}
