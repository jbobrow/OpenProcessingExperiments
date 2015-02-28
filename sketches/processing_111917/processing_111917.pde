
void setup(){
  size(400,400);
  background(148,206,198);
}
void draw(){
  background(148,206,198);
  //noStroke();
  fill(76,65,214);
  stroke(57,64,49);
  strokeWeight(1);
  rect(50,50,100,100);
  //line(20,20,200,200);
  fill(10,108,40,35);
  stroke(57,64,49);
  strokeWeight(0.5);
  rect(mouseX-100,mouseY-100,mouseX+150,mouseY+150);
  line(50,50,mouseX-100,mouseY-100);
  line(150,50,250,mouseY-100);
  line(50,150,mouseX-100,mouseY+250);
  line(150,150,250,mouseY+250);
  
 
}


