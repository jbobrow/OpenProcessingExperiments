
int counter;

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(0);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),255,255,50);  //set colors to maximum saturation and brightness
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 40, 40);
  }
  else {
    ellipse(width/2, height/2, 120*sin(counter), 120*sin(counter));
  }
}
