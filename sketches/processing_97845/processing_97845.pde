
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250,3PD);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(255,255,0,255);
  
  if(mousePressed == true) { //add some interaction
    box(mouseX, mouseY, 20, 20);
  }
  else {
    rect(75, 75, 100, 100);
  }
}
