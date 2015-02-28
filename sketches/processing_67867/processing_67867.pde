
void setup(){
  size(400,400);  
  noFill();
  smooth();
}

void draw(){
 background(255,255,255);
stroke(0,0,255);
strokeWeight(3);
ellipse(20, 40, 40, 40);

noFill();
stroke(0,0,0);
strokeWeight(3);
ellipse(70, 40, 40, 40);

noFill();
stroke(255,0,0);
strokeWeight(3);
ellipse(mouseX, mouseY, 40, 40);
    
noFill();
stroke(255,255,0);
strokeWeight(3);
ellipse(45, 60, 40, 40);

noFill();
stroke(0,255,0);
strokeWeight(3);
ellipse(95, 60, 40, 40);
}
