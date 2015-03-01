
void setup(){
  size(600,400);
  
}


void draw(){
  background(#00CB01);
  fill(#2000FC);
  ellipse(300,200,60,200);
  stroke(0);
  fill(#FF8D00);
  ellipse(300,200,200,60);
  stroke(255);
  fill(#FA0000);
  line(100,100,100,300);
  line(500,100,500,300);
  line(100,300,500,300);
  line(100,100,500,100);
  quad(0,0,100,0,100,100,0,100);
  quad(0,300,100,300,100,400,0,400);
  quad(500,0,500,100,600,100,600,0);
  quad(500,300,500,400,600,400,600,300);
  
  if (mousePressed) {
    println("butts");
    fill(255);
    ellipse(mouseX,mouseY,100,100);
  }
  else {
    fill(#840FBF);
    ellipse(mouseX,mouseY,100,100);
  }}



