
void setup() {
size(200,200);
fill(255,13,0);
smooth();
}

void draw(){
  background(255);
//bola
fill(255,13,0);
ellipse(mouseX,mouseY,90,90);

//agujeros para dedo
fill(80);
ellipse(mouseX-17,mouseY-17,10,10);
ellipse(mouseX+7,mouseY-17,10,10);
ellipse(mouseX-6,mouseY-6,10,10);

}

