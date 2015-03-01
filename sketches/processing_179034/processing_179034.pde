
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(100, 57);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),255,255,255, 70);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 50, 40);
  }
  else {

  }
}
