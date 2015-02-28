
void setup() {
  size(1000, 700);
  smooth();
  background(#000000);
}
 
void draw() {
  noFill();
  noStroke();
  stroke(random(80),mouseX,mouseY,random(20,30));
  //fill(mouseX,mouseY,20,20);
  bezier(0,mouseX+random(20),mouseX,mouseY,mouseX,mouseY,width/1.6,height/2);
}

void mousePressed() {
  background(#000000);      // clears the background
}
