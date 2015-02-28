
PFont font;
int x=40;
int dir=1;
String txt="Le circonferenze sono curve chiuse semplici, che dividono il piano in una superficie interna ed una esterna (infinita). La superficie del piano contenuta in una circonferenza, insieme alla circonferenza stessa, prende il nome di cerchio. Una circonferenza è inoltre un particolare caso di simmetria centrale, dal momento che tutti i punti della circonferenza sono equidistanti dal centro della stessa. La formula per trovare la lunghezza della circonferenza è:";
void setup(){
  size(800,600);
  font=loadFont("BodoniMT-48.vlw");
  textFont(font);
}
void draw(){
  background(230);
  fill(130);
  textSize(36);
  text("This is my headline",40,80);
  fill(0);
  textSize(18);
 
  textLeading(25);
  
  text(txt,x,120,300,500);
  text(txt,x+300,120,300,500);
  x=x+dir;
  if (x>200 || x<40){
    dir=-dir;
  }
  
  
}


