
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(254);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == false) { //add some interaction
    ellipse(mouseX, mouseY, 56, 56);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
