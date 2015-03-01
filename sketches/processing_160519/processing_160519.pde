
int counter;

void setup() {  //setup function called initially, only once
  size(400, 600);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() { 
    // Simple House
   size(400, 600);
    // house
    rect(50, 250, 300, 300);
    // roof
    triangle(50, 250, 350, 250, 200, 50);
    // door
    rect(175, 450, 50, 100);
    // door knob
    ellipse(185, 515, 6, 6);
    // left windows
    rect(85, 300, 40, 40);
    rect(130, 300, 40, 40);
    rect(85, 345, 40, 40);
    rect(130, 345, 40, 40);
    // right windows
    rect(230, 300, 40, 40);
    rect(275, 300, 40, 40);
    rect(230, 345, 40, 40);
    rect(275, 345, 40, 40);
}
