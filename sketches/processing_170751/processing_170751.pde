
void setup (){
size (400,400);
smooth();
}
void draw () {
background (127);
for (int x= 100; x<=120; x+=20){
  rect (10, mouseX, 15,50);
rect (380, mouseY, 15, 50);
ellipse (mouseX+30, mouseY-10, 15,15);// animar pelotita
}


}


