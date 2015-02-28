
void setup() {
size(280,280);

fill(255,13,0);
smooth();
background(255);
abs(mouseX-pmouseX);
}

void draw(){
  fill(250,3,3);
  triangle(100,155,185,120,35,20);


//bola
fill(255,241,82);
ellipse(mouseX,mouseY,90,90);
//ojos
fill(255);
ellipse(mouseX-17,mouseY-17,15,15);
fill(250,3,3);
ellipse(mouseX-19,mouseY-17,10,10);
fill(255);
ellipse(mouseX+7,mouseY-17,15,15);
fill(250,3,3);
ellipse(mouseX+5,mouseY-17,10,10);
//boca
fill(0);
ellipse(mouseX-6,mouseY+12,30,30);
}

