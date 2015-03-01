
//Interaction Challenge 1
//Problem 3 (Challenge)
void setup(){
  size(600,600); //sets screen size
}

void draw(){
  background(255);//sets background color to white
  fill(255,255,0);//sets fill color to yellow
  ellipse(mouseX, mouseY, 100, 100);//draws faces
  curve(mouseX,mouseY-100,mouseX-25,mouseY+20,mouseX+25,mouseY+20,mouseX,mouseY-100);
  //the above line creates the smile
  fill(0,mouseY,mouseX);//makes the eye color change with the position of the mouse
  ellipse(mouseX-18, mouseY-20, 15, 15);//creates left eye
  ellipse(mouseX+18, mouseY-20, 15, 15);//creates right eye
}

