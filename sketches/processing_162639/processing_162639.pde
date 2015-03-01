
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  frameRate(200)
}

void draw() {  //draw function loops 
  fill(random(255),random(255),random(255));
  stroke(random(255),random(255),random(255));
  distance= dist(125,125,mouseX,mouseY);
  size = 1000/(distance*distance)+20;
  
  rect(125-size/2,125-size/2,size,size);
  
  
}
