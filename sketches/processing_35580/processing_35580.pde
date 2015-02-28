
void setup(){
  size(300,300);
  background(0);
}


void draw(){
  stroke(255);
  strokeWeight(1);
noFill();
ellipse(70,200,8*mouseX,8*mouseX);

noStroke();
fill(0,120,30,mouseX);
rect(40,mouseX,35,35);

fill(255,mouseX);
rect(mouseX,200,5,5);

stroke(0,0,255);
noFill();
ellipse(100,mouseX,10,10);

}

void mousePressed(){
  stroke(255-mouseX);
  line(mouseX,0,mouseX,height);
  
  fill(255,0,0,300-mouseX);
  noStroke();
  rectMode(CENTER);
  rect(mouseX,mouseY,20,20);

}

