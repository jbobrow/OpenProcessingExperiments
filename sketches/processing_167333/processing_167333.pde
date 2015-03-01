
//EJERCICIO CLASE 2 ENTREGA PARA OCTUBRE 21

void setup(){
size(400,400);
}
void draw(){
  background(0);
  fill(mouseX,0,0); 
stroke(255);
line(mouseX-30,mouseY-30,mouseX+30,mouseY+30);
line(mouseX-30,mouseY+30,mouseX+30,mouseY-30);
  stroke(255,255,255);
  strokeWeight(4);
  ellipse(mouseX,mouseY,mouseY*0.30,mouseY*0.30);
  fill(0,mouseX,0);
  ellipse(mouseX-30,mouseY-30,mouseY*0.15,mouseY*0.15);
  ellipse(mouseX+30,mouseY-30,mouseY*0.15,mouseY*0.15);
}



