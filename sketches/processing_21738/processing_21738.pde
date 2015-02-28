
void setup() {
  size(100,100);

}
void draw() {
  background(140,50,200);
//cuerpo
ellipseMode(CENTER);
fill(10,255,20);
ellipse(mouseX,mouseY,60,70);
//botones
fill(0);
ellipse(mouseX+10,mouseY-10,8,8);
ellipse(mouseX+12,mouseY+3,8,8);
ellipse(mouseX+11,mouseY+17,8,8);
//cabeza
fill(255,242,191);
ellipse(mouseX,mouseY-45,50,50);
//ojos
fill(255);
ellipse(mouseX-15,mouseY-50,10,10);ellipse(mouseX+5,mouseY-50,10,10);
fill(0);
ellipse(mouseX-15,mouseY-50,4,8); ellipse(mouseX+5,mouseY-50,4,8);
fill(250,0,0);
ellipse(mouseX+10,mouseY-10,5,5);
}



