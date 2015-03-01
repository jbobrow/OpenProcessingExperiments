
int thursdayNight;

void setup() {
  size(600,400);
}


void draw() {
  background(252,245,99);
  fill(thursdayNight);
  ellipse(400,200,100,100);
  fill(0);
  strokeWeight(10);
  stroke(125);
  ellipse(mouseX,mouseY,100,100);
  
  if (mousePressed) {
    println("it's late but i love 4741");
    thursdayNight = 0;
} else {
  thursdayNight = 255;
}

}



