
int counter;

void setup (){
  size(500,500);
 background(150);


}


void draw(){
 background(150);
ellipse(mouseX +100,mouseY +100,100,100);//hoofd
ellipse(mouseX +75,mouseY +100,25,25); //  linker oog
ellipse(mouseX +125,mouseY +100,25,25);//  rechter oog
line(mouseX +125,mouseY +125,mouseX +75,mouseY +125);//    mond
line(mouseX +100,mouseY +150,mouseX +100,mouseY +300);//   lijf
line(mouseX +100,mouseY +200,mouseX +50,mouseY +150);//    linker arm
line(mouseX +100,mouseY +200,mouseX +150,mouseY +150);//   rechter arm
line(mouseX +100,mouseY +300,mouseX +60,mouseY +350);//    linker been
line(mouseX +100,mouseY +300,mouseX +140,mouseY +350);//   rechter been

}
