
void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
  if (mousePressed) {
    fill(222);
    rotate(radians(frameCount * 50  % 360)); //turnning 360
  } else {
    fill(random(255),mouseY,mouseX);
    rotate(radians(frameCount * 1  % 360)); //turnning 360


  }
  
   
rect( mouseX, mouseY, 10,20);
}


