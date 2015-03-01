
Rect {50, 50, 50, 50}
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
    ellipse(mouseX, mouseY, 235, 20);
  }
  else {
    ellipse(h/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
