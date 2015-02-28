

int mida=100;

void setup() {
  size(600, 600);
  background(0);
  
}
 
void draw() {
  background(172,237,240);
  fill(252,255,93);
  
  
  
  //cara
  fill(mouseX,mouseY,120);
  ellipse(mouseX,mouseY-50,270,120);
  ellipse(mouseX,mouseY,300,mida);
  ellipse(mouseX,mouseY-70,260,120);
  ellipse(mouseX+90,mouseY-50,mida,mida);
  ellipse(mouseX-90,mouseY-50,mida,mida);
  
  ellipse(mouseX-100,mouseY-27,120,120);
  ellipse(mouseX+100,mouseY-27,120,120);
  
  ellipse(mouseX-105,mouseY-40,mida,mida);
  ellipse(mouseX+105,mouseY-40,mida,mida);
  
  ellipse(mouseX-100,mouseY-60,80,80);
  ellipse(mouseX+100,mouseY-60,80,80);
  noStroke();
  
  //ulls
  fill(255,255,255);
  ellipse(mouseX-80,mouseY-60,30,50);
  ellipse(mouseX+80,mouseY-60,30,50);
  
  fill(0);
  ellipse(mouseX-80,mouseY-60,mouseX*0.09,mouseY*0.09);
  ellipse(mouseX+80,mouseY-60,mouseX*0.09,mouseY*0.09);
  
  //boca
  fill(255,255,255);
  ellipse(mouseX,mouseY+10,mouseX*0.09,mouseY*0.09);
  
  
 
 
 
  
  
  
  
}


