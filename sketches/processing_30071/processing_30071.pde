
// code_by_thomas bagnoli_

// Color_dymanics_

void setup(){
  size (500,500);
  smooth();
  frameRate(30);
}

void draw(){

fill(mouseX,mouseY,pmouseX,pmouseY);
stroke(mouseY,mouseX,pmouseX,pmouseY);
strokeWeight(abs(pmouseX-mouseY));
ellipse(mouseX,mouseY,50,50);
strokeWeight(abs(pmouseY-mouseX));
ellipse(mouseY,mouseX,80,80);
}
  
 

