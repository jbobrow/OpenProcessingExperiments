
int counter;
 
void setup() {
  size(400, 400);
  background(#ff0099);
  stroke(#dddddd)
  strokeWeight(0.7)
 }
 
void draw() { 
   
  if(mousePressed == true) {
    ellipse(150,150,mouseX,mouseY);
  }
 else {
    ellipse(width/4, height/4, 25*sin(counter), 25*sin(counter));
  }
}
