
int counter;

void setup() {  //setup function called initially, only once
  size(440, 330);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}
void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(255);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}