
void setup() {
size(300,300);
 background(0);
}

void draw() {
 background(random(255));
//draw a white line
  stroke(255);
  line(mouseX,mouseY,300,300);
//draw a black rectangle
  stroke(0,0,355);
  fill(0,3,57);
  rect(50,50,100,100);

fill(255,0,0);

fill(300,10,10,255);
ellipse(100,75,50,50);

triangle(70,40,40,100,40,40);
}               
