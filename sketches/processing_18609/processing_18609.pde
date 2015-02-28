


void setup(){
  background(255);
  size(250,250);
  strokeWeight(2);
  smooth();
  noStroke();
}

void draw(){
  fill(mouseY,8,118,100);
  strokeWeight(0.01);
  ellipse(mouseX, mouseY, 50, 50);
  strokeWeight(5);
 stroke(250,mouseY,35);
 fill(255,180);
rect(75,75,100,100);
strokeWeight(8);
stroke(mouseX,100,255);
fill(255,140);
  quad(125,50,200,125,125,200,50,125);

}



