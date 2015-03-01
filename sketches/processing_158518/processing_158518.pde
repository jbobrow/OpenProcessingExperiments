
int logo = 0;
void setup() { 
  size(600, 600);
  background(50,50,150); 
  logo = 0;
}
 
void draw() { 
  logo++;
  noStroke();
  fill(random(255),20, 250, 100);
   
  if(mousePressed) {
    triangle(mouseY, mouseX, 170, 250, 250, 250);
    stroke(); 
    fill(55,7,103);
    rect(mouseX, mouseY, 70, 70);

  }
  else {
  triangle(mouseY, mouseX, 170, 250, 250, 250);
}
}
