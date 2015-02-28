
int counter;

void setup() {  //setup function called initially, only once
  size(275, 275);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),240,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 50, 20);
  }
  else {
    ellipse(width/4, height/2, 80*sin(counter), 80*sin(counter));
  }
}
