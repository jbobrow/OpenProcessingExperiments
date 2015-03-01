
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(200,0,250);  //set background white
  colorMode(HSB);  //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),200,200,200);
  rect(width/2, height/2, 250*sin(counter), 250*sin(counter));
  ellipse(width/2,height/2, 200*sin(counter), 200*sin(counter));
  rect(0, 250, 250, 250);   
  rect(250,0,250,250);   
}
