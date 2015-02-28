
//GREEN LANTERN
void setup() {
  size(700,700);
  noStroke();
}

void draw(){
  noCursor();
  background(255);
  //marc de fons
  fill(118,190,91,127);
  ellipse(width/2,height/2,(2*width)/3,(2*height)/3);
  fill(28,100,1,127);
  ellipse(width/2,height/2,(2*width)/3.25,(2*height)/3.25);
  //s'ha dividit el size en una cuadricula de 18x18 on s'ha dibuixat el personatge
  //cabell
  fill(55,31,21);
  rect(mouseX-((2.5*width)/18),mouseY-((2*height)/18),(5*width)/18,(3*height)/18); 
  //face
  fill(250,214,182);
  rect(mouseX-((2*width)/18),mouseY-(height/18),(4*width)/18,(3.5*height)/18);  
  //barveta
  fill(221,187,159);
  rect(mouseX-((2*width)/18),mouseY+((1.5*height)/18),(4*width)/18,height/18);
  rect(mouseX-(width/18),mouseY+((2*height)/18),(2*width)/18,height/18);
  triangle(mouseX+((2*width)/18),mouseY+(height/18),mouseX+((2*width)/18),mouseY+((2*height)/18),mouseX+(width/18),mouseY+((2*height)/18)); 
  triangle(mouseX-((2*width)/18),mouseY+(height/18),mouseX-((2*width)/18),mouseY+((2*height)/18),mouseX-(width/18),mouseY+((2*height)/18));  
  //mascara
  fill(118,190,91);
  quad(mouseX+((1.5*width)/18),mouseY-((0.5*height)/18),mouseX,mouseY,mouseX,mouseY+(height/18),mouseX+((1.5*width)/18),mouseY+((0.5*height)/18));
  quad(mouseX-((1.5*width)/18),mouseY-((0.5*height)/18),mouseX,mouseY,mouseX,mouseY+(height/18),mouseX-((1.5*width)/18),mouseY+((0.5*height)/18));
  //tupé
  fill(55,31,21);
  triangle(mouseX-((2*width)/18),mouseY-((2*height)/18),mouseX+((2*width)/18),mouseY-((2*height)/18),mouseX-(width/18),mouseY-((3*height)/18));
  quad(mouseX-(width/18),mouseY-((3*height)/18),mouseX+((2*width)/18),mouseY-((3*height)/18),mouseX+((1.5*width)/18),mouseY-((2.5*height)/18),mouseX+((2.5*width)/18),mouseY-((1.5*height)/18));
  //ulls
  fill(255); 
  ellipse(mouseX-((0.25*width)/18),mouseY+((0.5*height)/18), width/64, width/64);
  ellipse(mouseX+((0.25*width)/18),mouseY+((0.5*height)/18), width/64, width/64);

}


