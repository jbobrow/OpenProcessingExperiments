
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  smooth();
}

void draw() {  //draw function loops 
  noStroke();
  fill(255,0,0);
  
  ellipse(250, 250, 200, 200);
  
  if(mousePressed == true && dist(250,250, mouseX, mouseY) < 100) { //add some interaction
    fill(0);
    ellipse(250, 250, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
