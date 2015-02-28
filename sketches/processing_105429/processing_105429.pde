
int counter;

void setup() {  //setup function called initially, only once
  size(1150, 1250);
  background(235);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),1100,1255,150);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 120, 120);
  }
  else {
    ellipse(width/2, height/2, 180*sin(counter), 80*sin(counter));
  }
}
