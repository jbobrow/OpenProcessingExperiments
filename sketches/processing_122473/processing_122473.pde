
void setup(){
  size(500,500);
}

void draw(){
  background(255,255,255);
  /*head*/
  stroke(0);
  fill(119,229,170);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,140,150);
  /*eyes*/
  fill(255);
  ellipse(mouseX,mouseY-30,45, 60);
  fill(0);
  ellipse(mouseX,mouseY-20,30,40);
  /*mouth*/
  fill(0);
  ellipse(mouseX,mouseY+40,20,30);
  /*body*/
  fill(119,229,170);
  ellipse(mouseX-25,mouseY+60,50,60);
  fill(119,229,170);
  ellipse(mouseX+25,mouseY+60,50,60);
}

