
//Alex Chow
//Smiley face
//7/08/13
//helped by Nathan and Sam

void setup () {
  background(0); 
  size (400, 400);
  strokeWeight(3); 
  ellipseMode(CENTER);
  stroke(255);
}

void draw(){
  background(0);
 //head
  fill(26, 45, 162);
    ellipse (mouseX, mouseY, 300, 300);
   //Eyes
    fill(255);
    ellipse(mouseX-60, mouseY-50, 75, 75);
    ellipse(mouseX+60, mouseY-50, 75, 75);
    //pupils
    fill(0);
    ellipse(mouseX-55, mouseY-38, 40, 40);
    ellipse(mouseX+55, mouseY-38, 40, 40);
    line(mouseX+50, mouseY+50, mouseX-40, mouseY+50);
   
  if (mousePressed == true){
   fill(234, 255, 13);
    ellipse(mouseX, mouseY, 300, 300);
    
    fill(255);
    ellipse(mouseX-60, mouseY-50, 75, 75);
    ellipse(mouseX+60, mouseY-50, 75, 75);
    
    fill(0);
    ellipse(mouseX-55, mouseY-60, 40, 40);
    ellipse(mouseX+55, mouseY-60, 40, 40);
    arc(mouseX, mouseY+50, 100, 100, 0, radians (180));
  }
}

