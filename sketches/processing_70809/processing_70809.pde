
int a;
  void setup(){
  frameRate(5);
 
   
size(500,500);
a=1;
}
 
PFont miFont;
//println(PFont.list());
 
void draw(){
  
  background(1);
String[] letras=PFont.list();
println(letras);
 
 
miFont=createFont (letras [a],62);
 
textFont(miFont);
text("EmilioAM",50,130);
a=a+1;
}
