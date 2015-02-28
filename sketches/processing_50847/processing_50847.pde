
void setup() {
  size (800,800);
}
void draw () {
  background(255);
  smooth();
  rectMode(CENTER);
  fill(mouseX+10, mouseY+10, 29);
  //head
  rect(mouseX, mouseY, 160, 200);
  //left ear                          
  rect(mouseX-90, mouseY-30, 20, 30);
  //right ear
  rect(mouseX+90, mouseY-30, 20, 30);

  //mouth
  fill(0);
  rect(mouseX, mouseY+30, 100, 60);
  //tooth
  fill(255);
  rect(mouseX, mouseY+15, 40, 30);
  line(mouseX, mouseY, mouseX, mouseY+30);

  //eyes
  ellipse(mouseX-30, mouseY-50, 20, 20);
  ellipse(mouseX+30, mouseY-50, 20, 20);
  fill(0);
  ellipse(mouseX-30, mouseY-50, 5, 5);
  ellipse(mouseX+30, mouseY-50, 5, 5);
  //eyebrows
  stroke(2);
line(mouseX-40,mouseY-70,mouseX-10,mouseY-50);
line(mouseX+40,mouseY-70,mouseX+10,mouseY-50);


}

