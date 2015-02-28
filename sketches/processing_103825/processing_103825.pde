
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 100;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),random(255),random(255),random(255));
  
  if(mousePressed == true) { //add some interaction
    rect(random(mouseX), random(mouseY), mouseX, mouseY);
  }
  else {
    ellipse(width/2, height/2, random(100)*tan(counter), random(100)*tan(counter));
  }
}
