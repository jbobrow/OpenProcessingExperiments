


// Elizabeth Peralta, 2/12/14, Creative Computing B, Benjamin Bacon


int y = 100;
int z = 100;

//size of circles


void setup() {
  size(800,800);  
  background(0); 
  smooth();
  
}

void draw() {
    
  y = int(random(0,200));
  z = int(random(0,200));
  

fill(225, 0, 0, 10); //make circle red and transparent

ellipse(mouseX, mouseY, y, z);
}


