
int counter;

void setup(){
  size(600, 600);
  background(230,220,146);
}
void draw(){
  background(240,50);
stroke(mouseX,mouseY,5);
strokeWeight(4);
  fill(225,250,119);
  rect(mouseX-200,mouseY-200,mouseX+300,mouseY+300);
  fill(400,253,81,200);
  rect(100,100,200,200);
  line(100,100,mouseX-200,mouseY-200);
  line(300,100,mouseX+mouseX+100,mouseY-200);
  line(100,300,mouseX-200,mouseY+mouseY+100);
  line(300,300,mouseX+mouseX+100,mouseY+mouseY+100);
  println(mouseX + " " + mouseY);
  
  
  }
