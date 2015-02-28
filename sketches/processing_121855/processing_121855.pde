
void setup () {
  size(200,200);
}

void draw () {
  background(255,255,255);
  stroke(0);
  
  fill(129,88,88);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,100,100);    //x= 100 y= 100
  
  ellipseMode(CENTER);
  ellipse(mouseX-65,mouseY+10,20,20);
  
  ellipseMode(CENTER);
  ellipse(mouseX+65,mouseY+10,20,20);
  
  fill(5,5,5);
  rectMode(CENTER);
  rect(mouseX,mouseY-75,55,50);
  
  rectMode(CENTER);
  rect(mouseX,mouseY-45,90,10);
  
  fill(255);
  rectMode(CENTER);
  rect(mouseX,mouseY-55,55,7);
  
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(mouseX+30,mouseY+60,35,20);
  
  ellipseMode(CENTER);
  ellipse(mouseX-30,mouseY+60,35,20);
  
  fill(5,5,5);
  rectMode(CENTER);
  rect(mouseX-20,mouseY-10,2,13);
  
  rectMode(CENTER);
  rect(mouseX+10,mouseY-10,2,13);
}
