
void setup(){
size(200,200);

}
void draw() {
background(101,163,170);
fill(15,172,5);
fill(255,246,160);
//cabeza
ellipseMode(CENTER);
ellipse(mouseX,mouseY,50,90);
fill(232,184,63);
//boca
ellipse(mouseX,mouseY+50,120,60);
fill(255);
//ojos
ellipse(mouseX-20,mouseY,20,40);
ellipse(mouseX+10,mouseY,25,40);
fill(0);
//pupilas
ellipse(mouseX-20,mouseY-10,10,20);
ellipse(mouseX+10,mouseY-10,10,20);
fill(255,90,90,100);
//boca2
ellipse(mouseX+10,mouseY+60,30,20);
}





