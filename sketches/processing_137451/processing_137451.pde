
String[] lineas;
PFont miFuente;
void setup(){
  size (800,800);
  miFuente =loadFont ("f1.vlw");
  
  lineas = loadStrings ("texto.txt");
}
void draw () {
  textFont (miFuente);
for(int i=0; i<lineas.length;i++){
  text (lineas [i],0,i*30,width,height);
}
}
