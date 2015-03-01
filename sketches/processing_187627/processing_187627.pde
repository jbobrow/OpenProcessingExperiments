
int counter;

void setup() {  //setup function called initially, only once
  size(300, 300);
  background(369);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(369),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/6, height/4, 91*sin(counter), 91*sin(counter));
  }
}
