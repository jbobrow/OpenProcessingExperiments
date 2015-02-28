
int counter;

void setup() {  //setup function called initially, only once
  size(640, 360);
  background(50);  //set background white
 // colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
 // counter = 0;
}

void draw() {  //draw function loops 
 // counter++;
 // noStroke();
 stroke(255); 
 line(pmouseX, pmouseY, mouseX, mouseY); 
 
}
