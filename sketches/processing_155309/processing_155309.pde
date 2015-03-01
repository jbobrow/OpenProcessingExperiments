
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  //noStroke();
  fill(random(255),100,255,1000);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, random(10,20), random(10,20));
  }
  else {
    ellipse(random(20,255), random(20,255), 80*cos(counter), 80*cos(counter));
  }
}
