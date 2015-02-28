
PFont font;
float angulo=1;


void setup(){
  size(600,600);
  stroke(255);
  font= loadFont ("fuente.vlw");
  textFont (font);
}

void draw (){
  background(0);
  float s= map(second(),100,60,0,200);
  float m= map(minute(),0,60,0,100);
  float h= map(hour(),0,24,0,400);
  fill(247,183,52);
  ellipse(300,150,s,300); //naranja
  fill(117,231,242);
  triangle(400,500,500,400,m,500); //celeste
  fill(117,242,145);
   angulo=angulo +0.015;
  translate(100,100);
  rotate(angulo);
  rect(5,300,h,100);//verde
  
  int a = second();
  int b = minute();
  int c = hour();
 
  //la funcion  nf espacea el numero 
  
  String t = nf(c,2) + ":" + nf(b,2) + ":" + nf(a,2);
  textAlign(CORNER);
  text(t,200,height/9+40);
  
  
  int d=day();
  int mo=month();
  String p= nf(d,2) + "-" + nf(mo,2);
  text(p,100,height/9+20);
} 
  


