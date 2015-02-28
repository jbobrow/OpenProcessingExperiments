
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),50,225,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 80, 20);
  }
  else {
    ellipse(width/2, height/2, 50*sin(counter), 50*sin(counter));
  }
}
