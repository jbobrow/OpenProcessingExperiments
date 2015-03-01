
void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 

  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 30, 30);
  }
  else {
  stroke(0,50);
    line(200,200,mouseX,mouseY);
;
  }
}
