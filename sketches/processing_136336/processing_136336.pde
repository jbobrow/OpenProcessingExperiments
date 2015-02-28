
void setup(){
  size(800,400);
  smooth();
  background(0);
}
void draw(){
  float r=random(400);
  float s=random(200);
    if (mousePressed==true){
    noFill();
    strokeWeight(2);
    stroke(mouseX,mouseY,r,100);
      ellipse(mouseX,mouseY,s,s);
  }
  fill(mouseY,mouseX,r,100);
  noStroke();
  triangle(mouseX,mouseY,pmouseX,pmouseY,mouseX/2,mouseY/2);
}

