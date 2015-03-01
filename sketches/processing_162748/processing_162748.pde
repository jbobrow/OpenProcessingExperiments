
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),random(255),random(255),50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, counter%100, 20);
  }
  else {
    ellipse(random(width), random(height), 80*sin(counter), 80*sin(counter));
  }
}
