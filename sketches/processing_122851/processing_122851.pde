
void setup() {
  size(200, 200);
}

void draw() {
  //lijf
  background(255, 255, 255);
  stroke(0);
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 100, 100);

  //binnenkant lijf
  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY, 40, 40);

  //oog links
  fill(255, 255, 255);
  ellipse(mouseX-15,mouseY-33, 20, 20);
  fill(0);
  ellipse(mouseX-15,mouseY-30, 10, 10);

  //oog rechts
  fill(255, 255, 255);
  ellipse(mouseX+15, mouseY-33, 20, 20);
  fill(0);
  ellipse(mouseX+15,mouseY-30, 10, 10);

  //benen
  line(mouseX-20, mouseY+45, mouseX-20, mouseY+65);
  line(mouseX+20, mouseY+45, mouseX+20, mouseY+65);
  strokeWeight(3);

  //armen
  line(mouseX-70, mouseY-10, mouseX-40, mouseY);
  line(mouseX+40, mouseY, mouseX+70, mouseY-10);

  //voeten
  fill(0, 0, 255, 150);
  rect(mouseX-35, mouseY+65, 15, 10);
  fill(0, 0, 255, 150);
  rect(mouseX+20, mouseY+65, 15, 10);
  
  //tanden
  fill(255);
  rect(mouseX,mouseY-17,7,10);
  rect(mouseX-10,mouseY-17,7,10);
  rect(mouseX,mouseY+7,7,10);
  rect(mouseX-10,mouseY+7,7,10);
  
  //strik
  fill(35,180,40);
  ellipse(mouseX-20,mouseY+33,30,30);
  ellipse(mouseX+20,mouseY+33,30,30);
  ellipse(mouseX,mouseY+35,25,25);
  
  

}

