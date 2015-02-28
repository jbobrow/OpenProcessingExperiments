
int typoe;
  void setup(){
  frameRate(10);
 
   
size(500,200);
typoe=1;
}
 
PFont wordy;
//println(PFont.list());
 
void draw(){
  
  background(1);
String[] letras=PFont.list();
println(letras);
 
 
wordy=createFont (letras [typoe],62);
 
textFont(wordy);
text("Alejandra",50,130);
typoe=typoe+1;
}
