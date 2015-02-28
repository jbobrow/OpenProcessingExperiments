
int atomo= 100;
int ull = 20;
int bo = 10;

int ullo = 30;
int boc = 15;
void setup() {
  size(600,600);
  
}
void draw() {
  background(0);
strokeWeight(3);
stroke(255);
  fill(mouseX,mouseY,15);
   
  ellipse(mouseX,mouseY,atomo,atomo);
  fill(mouseX/3);
   ellipse(mouseX-ull,mouseY-boc,mouseX/15,ullo);
   ellipse(mouseX+ull,mouseY-boc,mouseX/15,ullo);
  curve(mouseX-ull, mouseY-atomo, mouseX-ull, mouseY+boc, mouseX+ull, mouseY+boc, mouseX+ull, mouseY-atomo);
  line(mouseX-ull,mouseY+boc,mouseX+ull,mouseY+boc);
}
  


