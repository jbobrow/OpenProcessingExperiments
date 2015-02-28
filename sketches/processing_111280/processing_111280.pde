
void setup(){
  size(600,400);
  background(227,209,185);
}

void draw(){
  background(227,209,185);
  
   stroke(73,38,66);
  strokeWeight(2);
  fill(165,106,115);
  rect(50,50,100,100);
  
    stroke(73,38,66);
    strokeWeight(2);
  line(50,50,mouseX-100,mouseY-100);
  line(150,50,2*mouseX,mouseY-100);
  line(50,150,mouseX-100,2*mouseY);
  line(150,150,2*mouseX,2*mouseY);
  
  strokeWeight(1);
  
  fill(165,106,115,mouseY+mouseX);
  quad(50,150,150,150,2*mouseX,2*mouseY,mouseX-100,2*mouseY);
   fill(165,106,115,mouseX);
  quad(150,50,2*mouseX,mouseY-100,2*mouseX,2*mouseY,150,150);
  fill(214,183,188,500-mouseX);
  quad(50,150,50,50,mouseX-100,mouseY-100,mouseX-100,2*mouseY);
  fill(214,183,188,400-mouseY);
  quad(50,50,150,50,2*mouseX,mouseY-100,mouseX-100,mouseY-100);
  
   strokeWeight(2);
  fill(255,0);
  rect(mouseX-100,mouseY-100,mouseX+100,mouseY+100);
  
}


