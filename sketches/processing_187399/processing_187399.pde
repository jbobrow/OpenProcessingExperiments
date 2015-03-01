
void setup() {
background(0);
size(600, 600);
}
   
void draw() {
  if (mousePressed) {
  
      fill(random(200,250),random(120),150);
    
  } else {
     
    fill(500,20,150);
    noStroke();
  }
   
  
  ellipse(mouseX, mouseY, 50, 200);
  stroke(0);
}
