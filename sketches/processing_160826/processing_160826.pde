
int counter;

void setup() {  //setup function called initially, only once
  size(150, 150);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),180,255,150);
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 50, 50);
  }
  else {
    rect(width/6, height/6,  90*sin(counter));
  }
}
