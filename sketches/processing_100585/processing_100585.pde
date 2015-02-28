
int counter;

void setup() {
  size(400, 400);
  background(231, 255, 245);

}

void draw() { 
  noStroke();
  float i=random(10, 40);
  
   if(mouseY<200 == true) {
  fill(100, random(255), 255,random(50, 100));
  }
  else {
  fill(255, 100, random(255), random(50, 100));
  }


  if(mousePressed == true) {
    ellipse(mouseX, mouseY, i, i);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
