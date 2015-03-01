
float x1, y1, xr, yr;

void setup() {  //setup function called initially, only once
  size(720,480);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  smooth;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
