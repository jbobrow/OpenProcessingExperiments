
int counter;
  
void setup() { 
  size(250, 250);
  background(0);  
  counter = 200;

}
  
void draw() {
  counter++;
  noStroke();
  fill(random(255), random(255), random(255), 20);
    
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 35, 35);
  }
  
}


