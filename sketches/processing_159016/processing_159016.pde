
void setup() {
background(0)
  size(400, 600);
}
 
void draw() {
  if (mousePressed) {

      fill(random(255),random(255),155);
  
  } else {
   
    fill(255);
    noStroke()
  } 
 

  rect(mouseX, mouseY, 80, 80);
  stroke(255)
}
