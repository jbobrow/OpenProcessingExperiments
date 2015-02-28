
void setup() {
  
  size (600,600);
  
  background(255);
}

void draw(){
  background(255);
  
  fill(mouseX,mouseY,120);
  ellipse(mouseX,mouseY-2,110,110);//cap
  
  strokeWeight(2);
  fill(255,17,85);
  ellipse(mouseX,mouseY,100,100);//cap
  
  ellipse(mouseX+60,mouseY-40,44,44);//orelles
  ellipse(mouseX-60,mouseY-40,44,44);
  
  strokeWeight(1);
  fill(255);
  ellipse(mouseX-12,mouseY-10,20,40);//ulls
  ellipse(mouseX+12,mouseY-10,20,40);//ulls
  strokeWeight(2);
  fill(0);
  ellipse(mouseX-14,mouseY-2,5,8);//ulls
  ellipse(mouseX+10,mouseY-2,5,8);//ulls
  
  
  fill(0);
  ellipse(mouseX,mouseY+20,20,10);//nas
  
  
  fill(255);
  strokeWeight(2);
  arc(mouseX,mouseY+30, 30, 30,0,PI);
}
  


