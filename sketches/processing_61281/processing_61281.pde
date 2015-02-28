
float[] areas = {10, 100, 20, 30, 80, 10};

void setup() {
  size(500, 500); 
  smooth();
}

void draw() {
  background(0);

  /* Loop through the array */
  for(int i = 0; i < areas.length; i++) {
    float area = areas[i];   // get the value
    float side = sqrt(area) * 10;  // calculate the side length
    
    fill(255);
    rect(0, 0, side, side);
    
    translate(side, 0);
    translate(10, 0); //border    
  }  
}
