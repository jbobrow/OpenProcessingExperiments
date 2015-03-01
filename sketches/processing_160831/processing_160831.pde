
int counter;

void setup() {  //setup function called initially, only once
  size(15000, 15000);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),180,255,150);
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 20, 20);
  }
  else {
    rect(width/20, height/20, 80*sin(counter), 80*sin(counter));
  }
}
