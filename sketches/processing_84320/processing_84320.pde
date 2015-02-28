
  float counter = 250;
  float bounter = 250;

 void setup() {  //setup function called initially, only once
  size(500, 500);
  background(250);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}
 
void draw() {  //draw function loops
  counter = counter + random(10) - 5;
  bounter = bounter + random(10) - 5;
  noStroke();
  fill(random(255),100,255,50);
  if (mousePressed == true) { //add some interaction
    triangle(mouseX, mouseY, random(500), random(500), counter, bounter);
  }
}
void keyPressed() {
  saveFrame("Output.png");
}

