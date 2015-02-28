
void setup(){
  size(1800,600);
}
void draw(){
 stroke(92,4,55,mouseX);
  fill(92,4,55,mouseX);
  rect(mouseX,50,1500,200);
 
  stroke(mouseX,23,63);
  fill(mouseX,23,63);
  rect(200,10,40,500);
 
  stroke(30,64,mouseX);
  fill(30,64,mouseX);
  ellipse(1300,450,500,200);

  stroke(0);
  fill(4,4,mouseY,50);
  ellipse(mouseX,300,300,mouseY);
}

