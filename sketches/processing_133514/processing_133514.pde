
int counter;

void setup() { //setup function called initially, only once
  size(500, 500);
  background(0,0,150);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() { //draw function loops
  counter++; 
  noStroke();
  fill(random(255),100,255,50);

  if (mousePressed) {
    fill(0);
  }  else {
     }
  ellipse(mouseX, mouseY, 80, 80);
}
