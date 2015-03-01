
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  if(counter%5==0) {
      stroke(0, 0, random(255), 100);
      fill(random(255), 200, 80, 100);
      point(500*sin(counter), 500*sin(counter));
      ellipse(500*sin(counter), 500*sin(counter), 100, 20);
  }
  noStroke();
  fill(random(255), 200, 80, 40);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 250*sin(counter), 250*cos(counter));
  }
  else {
    rect(500*sin(counter), 500*cos(counter), 500*cos(counter), 500*sin(counter));
  }
}
