
int counter;

void setup() {  //setup function called initially, only once
  size(500,500);
  background(245,84,216);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  
  noStroke();
  fill(random(255),100,143,255);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 20*sin(counter), 20*sin(counter));
  }
}
