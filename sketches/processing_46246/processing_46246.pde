
void setup() {
   size (500,500);
   background(0);
   smooth();
}


 void draw() {

color verde= color(0,random(30,150),0,random(5,100));
float numLinhas=random(5,15);
float posxRaiz= random(-5,5);
float posyRaiz=random(-5,5);
float altura=random(-80,20); 
float largura=random (-20,20);
  stroke(verde);
  for (int i=0;i<numLinhas ;i++) {
    line (mouseX+posxRaiz,mouseY+posyRaiz,mouseX+largura,
    mouseY+altura);
  }
}
