
int counter;

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
    counter++;
  noStroke();
  fill(random(0),0,0);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX,mouseY, 20, 20);
  }
  

  for (int i = 0; i < 600; i++) {
  float r = random(10);
  stroke(r*10);
  ellipse(mouseX,i,i,mouseY);
}
}
 
