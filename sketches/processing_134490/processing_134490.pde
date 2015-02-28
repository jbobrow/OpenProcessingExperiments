

void setup() {
  size(500, 500);
  background(157, 163, 222);
  smooth();
}

void draw() {
 
    
  if(counter == 1) {
    fill(red);
  }  
  else if(counter == 2) {
    fill(green); 
  }
  else if(counter == 3) {
    fill(orange); 
  }
  else if(counter == 4) {
    fill(purple); 
  }
    
  if (mousePressed == true) {
    ellipse(mouseX, mouseY, 50, 50);
  }
  
 }

void mouseReleased() {
 counter++; // increase the counter
 if(counter == 5) {
   counter = 1;  // loop after 3
 }
 printIn(counter);
} 
