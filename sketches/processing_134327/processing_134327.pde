
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),150,255,250);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 100, 100);
  }
 }
