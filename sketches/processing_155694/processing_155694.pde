

void setup() {  //setup function called initially, only once
  size(500, 500);
  
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  background(255);  //set background white
  
  fill(26,54,96);
  rect(170,150,145,10);
  
   fill(96,87,25);
  ellipse(109,100,70,70);
  
  fill(96,87,25);
  ellipse(375,100,70,70);
  
  fill(10,15,23);
  rect(0,375,445,10);
}
