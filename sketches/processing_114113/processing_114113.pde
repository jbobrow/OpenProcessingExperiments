
void setup(){
  size (400,400);
  background(240,27,27);
}

void draw(){
 background(240,27,27);
 //noStroke();
 fill(222,242,218);
 stroke(mouseX,mouseY,225);
 strokeWeight(3);
 fill(240,27,27,200);
 rect(mouseY-100,mouseX-100,mouseX,100);
 rect(mouseY+100,mouseX+100,mouseX,100);
 rect(mouseY-200,mouseX-200,mouseX,200); 
 rect(100,mouseX-100,mouseX,mouseY-100);
 
}


