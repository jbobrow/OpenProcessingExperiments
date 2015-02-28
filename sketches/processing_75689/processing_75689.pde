
int counter;
 
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}
 
void draw() {  //draw function loops
  counter+=55;
  noStroke();
  fill(random(45),random(198),random(255),30);  
    rect(counter, counter%9, 80*sin(counter), 80*sin(counter));
}

