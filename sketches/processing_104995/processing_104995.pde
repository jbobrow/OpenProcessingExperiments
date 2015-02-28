
void setup() {
    size(800, 600);
    
    fill(18,182,255,128); //transparent blue
  
}

void draw() {
  //  rectangle(width/2, height/2, 200, 200);  
  background(255); // white background

if (mouseX <= width/2) {
  fill(200,40,60);
  ellipse(mouseX, mouseY, 100, 100);
  //this will happen if this is true
} else {
  fill(18,182,255,128);
  //otherwise do this


 ellipse(mouseX, mouseY, 200, 200);
  ellipse(mouseX, mouseY, 300, 300);
 }
 
}
