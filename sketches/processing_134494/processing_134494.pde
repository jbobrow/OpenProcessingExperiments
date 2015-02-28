
color red = color(255, 0, 30, 70);
color green = color(0, 255, 0, 70);
color orange = color(245, 130, 22, 70);
color purple = color(144, 17, 191, 70);



int counter = 1; // your state counter

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
 println(counter);
} 
