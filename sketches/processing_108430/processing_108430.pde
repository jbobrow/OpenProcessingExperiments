
int counter;

void setup() {  //setup function called initially, only once
  size(800, 600);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter=0;
}

void draw() {  //draw function loops 
  counter++;
  fill(random(50)+100,255,128,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 75*sin(counter), 75*sin(counter));
  }
}

void keyPressed() {
  if (key == ' ') {
    background(255);
  }
}
