
void setup(){
  size(600,600);
}

void draw(){
  background(252,217,248);
//cara
  strokeWeight(4);
  stroke(0,0,0);
  fill(0,0,0);
  ellipse(mouseX,mouseY-80,80,60);
  ellipse(mouseX,mouseY-10,160,120);
  fill(252,230,201);
  ellipse(mouseX,mouseY,150,120);
 

//OJOS
//capa rosa
  strokeWeight(1);
  fill(245,161,187);
  ellipse(mouseX-45,mouseY-6,55,55);
  ellipse(mouseX+45,mouseY-6,55,55);
  
//capa negra
  fill(0,0,0);
  ellipse(mouseX-39,mouseY-8,40,40);
  ellipse(mouseX+39,mouseY-8,40,40);
  
//capa blanca
  fill(255,255,255);
  ellipse(mouseX-30,mouseY-13,20,16);
  ellipse(mouseX+30,mouseY-13,20,16);
  
  
//boca
  strokeWeight(2);
  noFill();
  ellipse(mouseX,mouseY+30,28,34);
  noStroke();
  fill(252,230,201);
  rect(mouseX-20,mouseY+10,40,20);
}
