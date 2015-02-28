
int counter;

void setup() {  //setup function called initially, only once
  size(450, 450);
    background(170);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
 
  counter++;
  noStroke(255);
  fill(random(20),100,255,50);
  
  if(mousePressed == false) { //add some interaction
    stroke(0);
    ellipse(mouseX, mouseY, 80, 80);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
