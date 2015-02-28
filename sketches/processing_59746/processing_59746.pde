
void setup() {
    size(500,500);
    background(255);
    println("setup");
}

void draw() {
  smooth();
  fill(mouseX,mouseY,120,255);
  stroke(mouseX+20,mouseY+40,80,255);
  //println(abs(mouseX-pmouseX));
  //strokeWeight(abs(mouseX-pmouseX));
  ellipse(mouseX,mouseY,pmouseX,pmouseY);
  ellipse(mouseX,mouseY,50,50);
  fill(100,pmouseY,pmouseX);
  stroke(mouseY,mouseX,180,100);
  rect(mouseY,mouseX,50,50);
  fill(200,mouseX,20);
  rect(pmouseX+60,mouseY+100,50,50);
}

void mousePressed() {
  saveFrame("test.png");
  
}

