
int circle;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  circle = 0;
}

void draw() {  //draw function loops 
    circle++;
    noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 100*tan(circle), 90*tan(circle));
  }
}
