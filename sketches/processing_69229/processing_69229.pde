
void setup(){
 
size(500,500);
}
void draw(){
  frameRate (6);
  background(0);
PFont miletra;
 
String[] misLetras= PFont.list ();
 
println (misLetras);
 
miletra = createFont(misLetras [int(random(1,601))], 62);
 
textFont(miletra);
text ("Jess",250,250);
}
