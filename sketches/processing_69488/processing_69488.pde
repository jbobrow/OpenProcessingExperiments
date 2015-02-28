
int counter;

void setup() {  //setup function called initially, only once
  size(660, 250);
  background(125);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 9;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),150,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 50, 20);
  }
  else {
    ellipse(width/9, height/5, 100*sin(counter), 50*sin(counter));
  }
}
