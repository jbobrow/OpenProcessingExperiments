
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
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(width/2, height/2, 100*sin(counter), 100*cos(counter);
  }
  else {
    line(250*sin(counter), 250*sin(counter), 250*cos(counter,250*cos(counter));
  }
}
