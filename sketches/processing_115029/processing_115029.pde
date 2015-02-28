
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);     // value1, value2, value3, alpha
  
  if (mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  } else {
    int offset = 100;
    ellipse(width/2, height/2, 320*sin(counter), 320*sin(counter)); // x, y, width, height
    ellipse(width/2-offset, height/2-offset, 320*sin(counter), 320*sin(counter));
    ellipse(width/2+offset, height/2-offset, 320*sin(counter), 320*sin(counter));
    ellipse(width/2-offset, height/2+offset, 320*sin(counter), 320*sin(counter));
    ellipse(width/2+offset, height/2+offset, 320*sin(counter), 320*sin(counter));
  }
}
