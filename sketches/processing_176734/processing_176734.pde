
int counter;

void setup() {  //setup function called initially, only once
  size(600,300);
  background(900);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(480),190,255,450);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 59, 267);
  }
  else {
    ellipse(width/90, height/2, 80*sin(counter), 90*sin(counter));
  }
}
