

void setup(){
  size(400,400);
  background(234,0,15);
}

void draw(){
  background(234,0,15);
ellipseMode(CENTER);
rectMode(CENTER);
noStroke();
fill(0);
rect(mouseX,mouseY,50,50);
fill(255);
ellipse(300,300, mouseX, mouseY);

}


