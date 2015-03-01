
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 10;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),255,255,10);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 50, 50);
  }
  else {
    ellipse(width/2, height/2, 1*(counter), 1*(counter));
  }
}
