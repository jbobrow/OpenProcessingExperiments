
int counter;

void setup() {  //setup function called initially, only once
  size(800, 500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),1000,255,500);
  
  if(mousePressed == false) { //add some interaction
     rectMode(CENTER);
rect(mouseX, mouseY,10,10);
  }
  else {
  }
}
