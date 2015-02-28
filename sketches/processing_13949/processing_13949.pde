
//Hyo Sun Lee
//One Art
               
 void setup() {
  size(800,800);
  noStroke();
  background(255,190,170);
}
 
void draw() {
  background(255,190,170);
 
  noStroke();
  fill(random(100),random(255),random(255),70);
  float diag = random(1200);
  rect(mouseX-70, mouseY-70, diag, diag);
   
  noStroke();
  fill(random(255),random(100),random(255),140);
  float diam = random(900);
  ellipse(mouseX, mouseY,diam,diam);
}
