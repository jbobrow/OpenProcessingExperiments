
void setup(){
  size(400,400);
  //background(121,121,117);
}


void draw(){
  background(51,12,257);
  //noStroke();
  fill(252,242,28);
  stroke(mouseX,mouseY,191);
  strokeWeight(2);
  rect(width/8,50,100,100);
  fill(252,242,28,200);
  line(50,50,mouseX-100,mouseY-100);
  line(150,50,mouseX+mouseX,mouseY-100);
  line(50,150,mouseX-100,mouseY+mouseY);
  line(150,150,mouseX+mouseX,mouseY+mouseY);
   rect(mouseX-100,mouseY-100,mouseX+100,mouseY+100);

  println(mouseX+""+mouseY);

}
