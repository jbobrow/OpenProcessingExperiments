
int counter;

void setup() {
  size(400, 400);
  background(50, 50, 50);

}

void draw() { 
  noStroke();
  float i=random(10, 40);
 
  
   if(mouseX<200 == true) {
  fill(100, random(255), 255,random(50, 100));
  triangle(0, 0, 0, mouseX, mouseX, mouseY);
  }
  else {
  fill(random(255), 255, 100, random(50, 100))
    triangle(400, 400, 400, mouseX, mouseX, mouseY);
  }
 
}
