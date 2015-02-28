
int counter;

void setup() {  
  size(300, 400);
  background(255); 
  colorMode(RGB);  

}

void draw() {
  counter++;
  noStroke();
  fill(random(255),164,183,3);
  
  if(mousePressed == true) { 
    ellipse(mouseX, mouseY, random(1,21), 700);
  }
  
}
                
                
