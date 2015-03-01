
int counter;

void setup() {  //setup function called initially, only once
  size(50, 400);
  background(25);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 50;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(25),190,255,52);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
