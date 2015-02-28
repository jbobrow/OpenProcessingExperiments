
void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(0);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  

  
    stroke(100);
  fill(mouseX,mouseY,mouseY);
  ellipse(mouseX,mouseY,100,20);
  
    stroke(100);
  fill(mouseX,mouseY,mouseY);
  ellipse(mouseY,mouseY,20,20);
  
      stroke(100);
  fill(mouseX,mouseY,mouseY);
  ellipse(mouseY,mouseY,20,20);
  
      stroke(100);
  fill(mouseX,mouseY,mouseY);
  ellipse(mouseX,mouseX,20,20);
  
      stroke(100);
  fill(mouseX,mouseY,mouseY);
  ellipse(20,mouseY,20,20);
  
      stroke(100);
  fill(mouseX,mouseY,mouseY);
  ellipse(mouseX,mouseY,mouseX,20);
  
  stroke(176);
  fill(mouseX,mouseX,mouseX);
  ellipse(mouseX,mouseY,30,mouseY);
  
      stroke(100);
  fill(250,150,20);
  ellipse(mouseX,mouseY,100,100);
  
        stroke(0);
  fill(255);
  ellipse(mouseX-20,mouseY,20,20);
  
          stroke(0);
  fill(255);
  ellipse(mouseX+20,mouseY,20,20);
  
        stroke(0);
  fill(0);
  ellipse(pmouseX-20,pmouseY,mouseX-pmouseX+15,20);
  
          stroke(0);
  fill(0);
  ellipse(pmouseX+20,pmouseY,mouseX-pmouseX+15,20);
  
  stroke(0);
  fill(0);
  rect(pmouseX,pmouseY+30,30+pmouseX,mouseY-pmouseY);
}

