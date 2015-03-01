
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(150,0,250);  //set background white
  colorMode(HSB);  //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),200,200,200);
  rect(width/2, height/2, 160*sin(counter), 160*sin(counter));
  ellipse(width/2,height/2, 160*sin(counter), 160*sin(counter));
      
     
}
