
//Autor: Carlos B.

void setup(){
  size(400,400);
  smooth();
}
void draw(){
  background(247,192,107);
//Cejas
fill(70,70,70);
triangle(100,40,80,60,160,80);
triangle(100,40,80,60,160,80);
triangle(300,40,320,60,240,80);
//Ojos 1
fill(198,191,178);
ellipse(110,130,mouseY/7,80);
ellipse(290,130,mouseY/7,80);
//Ojos 2
fill(70,70,70);
ellipse(110,145,40,mouseX/8);
ellipse(290,145,40,mouseX/8);
//Boca
fill(232,295,199);
rect(120,240,160,60);
//Nariz
fill(219,199,168);
triangle(240,200,200,160,160,200);
//dientes de la cara
fill(198,191,178);
rect(120,280,20,20);
rect(140,280,20,20);
rect(160,280,20,20);
rect(180,280,20,20);
rect(200,280,20,20);
rect(220,280,20,20);
rect(240,280,20,20);
rect(260,280,20,20);
rect(120,240,20,mouseY/19.5);
rect(140,240,20,mouseY/19.5);
rect(180,240,20,mouseY/19.5);
rect(200,240,20,mouseY/19.5);
rect(220,240,20,mouseY/19.5);
rect(260,240,20,mouseY/19.5);
rect(240,240,20,mouseY/19.5);
rect(160,240,20,mouseY/19.5);
}
void mousePressed(){
  background(0);
}
void mouseReleased(){
  background(255);
}


