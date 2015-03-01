
int counter;

void setup() {  //setup function called initially, only once
  size(400, 300);
  background(10,80,100);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(mouseX, mouseY, 80*sin(counter), 80*sin(counter));
  }
}
