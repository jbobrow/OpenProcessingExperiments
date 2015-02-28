
/*In this file zoogs eyes change colour!!*/

void setup () {
    size(500,500);
    smooth();
}
  
void draw() {
  
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  stroke(0);
  fill(175);
  rect(mouseX,mouseY, 20,100);
  
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  fill(mouseX, mouseY, mouseX+mouseY);
  ellipse(mouseX-20,mouseY-30,16,32);
  ellipse(mouseX+20,mouseY-30,16,32);
  
  stroke(0);
  line(mouseX-10,mouseY+50,mouseX-10,mouseY+60);
  line(mouseX+10,mouseY+50,mouseX+10,mouseY+60);
  
  
  //ellipse(81,70,16,32);
 // ellipse(119,70,16,32);
 //line(81,150,80,160);
 //line(110,150, 120,160);
}

/*In the following code zoogs eyes would change colour when mousepressed occurs!!
void mousePressed () {
  fill(mouseX+pmouseX,mouseY+pmouseY, 100);
  ellipse(mouseX-20,mouseY-30,16,32);
  ellipse(mouseX+20,mouseY-30,16,32);
  
}*/

